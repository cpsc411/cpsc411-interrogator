#lang at-exp racket/base
(require
 racket/function
 racket/dict
 racket/sandbox
 racket/port
 racket/pretty
 racket/format
 net/cgi
 rackunit)

(require/expose openssl/mzssl (X509_get_default_cert_file))


(provide (all-defined-out))

(pretty-print-current-style-table
 (pretty-print-extend-style-table
  (pretty-print-current-style-table)
  '(module) '(begin)))

(define (get-bindings/ignore)
  (with-handlers ([values (lambda _ '())])
    (get-bindings)))

(define (make-interrogator-evaluator lang)
  (parameterize ([sandbox-memory-limit 128]
                 [sandbox-output 'string]
                 [sandbox-eval-limits '(30 128)]
                 [sandbox-error-output 'string]
                 [sandbox-propagate-exceptions #f]
                 [sandbox-gui-available #f]
                 [sandbox-path-permissions (append `((exists
                                                     ,(X509_get_default_cert_file)))
                                                   (sandbox-path-permissions))])
    (make-evaluator lang)))

(define (get-valid-id-set sandbox-path)
  (dynamic-require sandbox-path 'valid-id-set (thunk #f)))

(define (trace-supported? sandbox-path)
  (dynamic-require sandbox-path 'trace-support? (thunk #f)))

;; Takes a path, as a string, to the CGI script responsible for processing the
;; form input. Probably the path to the file that calls this function.
;;
;; Creates a form which expects at least the GET variable "an" to be set to an
;; assignment string, "a1"--"a10".
;; The form also processes the GET inputs "traced?", which expects a Racket
;; boolean, and "test", which expects a string representing a quoted program to be
;; compiled with the assignment reference solution (when "traced?") or a valid
;; expression in the interrogator sandbox.
(define (make-interrogator-form
         action
         #:bindings [bind-dict (get-bindings/ignore)]
         #:assignment [assignment-number (dict-ref bind-dict 'an "a4")]
         #:sandbox
         [sandbox-path
          (list 'lib (format "cpsc411/interrogator/~a-sandbox" assignment-number))])
  (let ([evalor (make-interrogator-evaluator sandbox-path)]
        [valid-id-set (get-valid-id-set sandbox-path)])
    `(html (head (title "Enter a test case"))
            (body
             (form ([action ,action])
                   "Enter a test case to interrogate the compiler:"
                   (br)
                   (textarea ([rows "20"]
                              [name "test"]
                              [id "test"]
                              [cols "80"])
                             ,(dict-ref bind-dict 'test ""))
                   (br)
                   (input ([type "hidden"] [name "an"] [value ,assignment-number]))
                   ,@(if (trace-supported? sandbox-path)
                         '((input ([type "checkbox"] [name "traced?"] [value "#t"]))
                           (label ([for "traced?"]) "Trace the entire compiler?"))
                         '())
                   (br)
                   (input ([type "submit"])))
             ,@(if (dict-ref bind-dict 'test #f)
                   (begin
                     (let ([x (call-with-deep-time-limit
                               60
                               (thunk
                                (evalor
                                 ((if (dict-ref bind-dict 'traced? #f)
                                      (curry format "(with-traced (compile ~a))")
                                      values)
                                  (dict-ref bind-dict 'test)))))])
                       `((p "Standard output")
                         (pre ,(pretty-format (get-output evalor) #:mode 'write))
                         (p "Return value")
                         (script ([type "text/javascript"])
                                 "function copyElementToClipboard(str) {
  var copyText = document.getElementById(str).textContent;
  const textArea = document.createElement('textarea');
  textArea.textContent = copyText;
  document.body.append(textArea);
  try {
    textArea.select();
    document.execCommand(\"copy\");
    copyText.setSelectionRange(0, 99999);
    document.execCommand(\"copy\");
  }
  finally {
    textArea.remove()
  };
}")
                         (input ([name "copy-return"]
                                 [type "button"]
                                 [value "Copy Return Value"]
                                 [onClick "copyElementToClipboard(\"return-value\")"]))
                         (pre ([id "return-value"]) ,(pretty-format x #:mode 'write))
                         (p "Standard error")
                         (pre ,(get-error-output evalor))
                         (br))))
                   (if valid-id-set
                       `((h2 "Instructions:")
                         ,@(if (trace-supported? sandbox-path)
                               `((p (unquote
                                     @~a{If you check the box above, provide a
                                            quoted surfance language program.
                                            The interrogator will trace the entire
                                            compilation of the program.
                                            Otherwise, provide an expression or rackunit test using one
                                            of the compiler passes, and the interrogator will run it.})))
                               `((p (unquote
                                     @~a{Provide an expression or rackunit test using one
                                         of the compiler passes, and the interrogator will run it.}))))
                         (p (unquote @~a{There is a de-factor limit on the size
                                         of the input example, depending on your
                                         browser. I strongly recommend using
                                         Firefox, which has a large limit.
                                         Limits for common browsers:})
                            (ul
                             ,@(for/list ([(k v)
                                           (in-dict '((Chrome . 32779)
                                                      (Android . 8192)
                                                      (Firefox . >64k)
                                                      (Safari . >64k)
                                                      (IE . 2047)
                                                      (Edge . 2047)))])
                                 `(li ,(format "~a's Limit: ~a character" k v)))))
                         (p (unquote @~a{You can use the following identifiers:}))
                         (ul
                          ,@(map (lambda (x) `(li ,(~a x))) valid-id-set)))
                       '()))))))
