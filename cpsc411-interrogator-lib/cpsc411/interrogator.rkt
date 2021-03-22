#lang racket/base
(require
 "interrogator/interrogator-lib.rkt"
 web-server/http/bindings
 web-server/servlet-env
 web-server/servlet)

(define (start req)
  (start
   (send/back
    (response/xexpr
     (make-interrogator-form "standalone.rkt" #:bindings (request-bindings req))))))

(serve/servlet
 start
 #:port 8080
 #:launch-browser? #f)
