#lang racket/base
(require
 "interrogator/interrogator-lib.rkt"
 web-server/http/bindings
 web-server/servlet-env
 web-server/servlet)

(define (start req)
  (start
   (send/suspend
    (lambda (k-url)
      (response/xexpr
       (make-interrogator-form k-url #:bindings (request-bindings req)))))))

(serve/servlet start #:port 8080 #:launch-browser? #f)
