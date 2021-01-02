#lang racket/base
(require
 "interrogator-lib.rkt"
 racket/pretty
 xml
 net/cgi)

(output-http-headers)
(display (xexpr->string (make-interrogator-form "interrogator-cgi.rkt")))
