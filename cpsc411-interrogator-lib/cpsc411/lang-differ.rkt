#lang racket/base

(require
 "interrogator/lang-differ-lib.rkt"
 web-server/http/bindings
 web-server/servlet-env
 (except-in web-server/servlet url))

(define (start req)
  (start
   (send/suspend
    (lambda (k-url)
      (response/xexpr
       (make-differ-form k-url #:bindings (request-bindings req)))))))

(define-values (scribble-path _4 _3)
  (split-path (collection-file-path "manual-fonts.css" "scribble")))

(define-values (bettergrammar-path _2 _1)
  (split-path (collection-file-path "bettergrammar.css" "scribble")))

(serve/servlet start
               #:port 8081
               #:launch-browser? #f
               #:servlet-path "/index.rkt"
               #:extra-files-paths (list scribble-path bettergrammar-path))
