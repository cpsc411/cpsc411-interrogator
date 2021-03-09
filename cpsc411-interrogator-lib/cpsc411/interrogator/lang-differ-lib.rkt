#lang racket/base

(require
 racket/class
 scribble/base
 scribble/decode
 scribble/core
 scribble/render
 scribble/base-render
 scribble/html-render
 scribble/bettergrammar
 racket/dict
 setup/xref
 scribble/xref
 data/maybe
 data/monad
 data/applicative
 #;(only-in net/cgi get-bindings)
 (for-label racket)
 (for-label (except-in cpsc411/compiler-lib compile))
 (only-in "interrogator-lib.rkt" get-bindings/ignore)

 cpsc411/langs/v1
 cpsc411/langs/v2
 cpsc411/langs/v3
 cpsc411/langs/v4
 cpsc411/langs/v5
 cpsc411/langs/v6
 cpsc411/langs/v7)

(provide (all-defined-out))

(define (normalize-name str)
  (string->symbol (regexp-replace #rx" v([0-9]+)" (string-foldcase str) "-v\\1")))

(define (make-doc #:bindings [binds '()])
  (from-just
   '()
   (do [lang1 <- ((just normalize-name) (false->maybe (dict-ref binds 'lang1 #f)))]
       [lang2 <- ((just normalize-name) (false->maybe (dict-ref binds 'lang2 #f)))]
       [doc <- (pure (decode (list (eval-syntax #`(bettergrammar*-diff #,lang1 #,lang2)))))]
       (define r (new (render-mixin render%)
                      [dest-dir #f]))
       (pure (send r set-external-root-url "https://docs.racket-lang.org"))
       [info <- (pure (send r collect (list doc) '("foo")
                            (send r traverse (list doc) '("foo"))))]
       (pure (xref-transfer-info r info (load-collections-xref)))
       [r-info <- (pure (send r resolve (list doc) '("foo") info))]
       (pure
        `((p ,(format "Differences between ~a and ~a" lang1 lang2))
          ,(car
            (send r render-table (car (part-blocks doc))
                  doc
                  r-info
                  #f)))))))

(define (make-differ-form action #:bindings [bind-dict (get-bindings/ignore)])
  `(html
    (meta ([charset "utf-8"]))
    (head
     (link ([rel "stylesheet"]
            [type "text/css"]
            [href "scribble.css"]))
     (link ([rel "stylesheet"]
            [type "text/css"]
            [href "manual.css"]))
     (link ([rel "stylesheet"]
            [type "text/css"]
            [href "manual-fonts.css"]))
     (link ([rel "stylesheet"]
            [type "text/css"]
            [href "manual-racket.css"]))
     (link ([rel "stylesheet"]
            [type "text/css"]
            [href "manual-style.css"]))
     (link ([rel "stylesheet"]
            [type "text/css"]
            [href "racket.css"]))
     (link ([rel "stylesheet"]
            [type "text/css"]
            [href "bettergrammar.css"]))
     (link ([rel "stylesheet"]
            [type "text/css"]
            [href "custom.css"])))
    (body
     (form
      ([action ,action])
      (label ([for "lang1"]) "Enter Source Language Name")
      (input ([type "text"] [name "lang1"]))
      (br)
      (label ([for "lang2"]) "Enter Target Language Name")
      (input ([type "text"] [name "lang2"]))
      (br)
      (input ([type "submit"])))
     ,@(make-doc #:bindings bind-dict))))
