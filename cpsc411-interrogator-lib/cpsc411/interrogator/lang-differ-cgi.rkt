#lang racket/base
(require
 "lang-differ-lib.rkt"
 racket/pretty
 xml
 net/cgi)

(output-http-headers)
(display (xexpr->string (make-differ-form "lang-differ-cgi.rkt")))
