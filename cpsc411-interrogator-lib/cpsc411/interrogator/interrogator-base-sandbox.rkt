#lang racket/base
(require
 racket/pretty
 racket/function
 cpsc411/compiler-lib
 rackunit)

(provide
 with-traced
 compile
 max-int
 min-int

 parameterize

 pretty-display

 #%module-begin
 #%top-interaction
 #%top
 check-equal?
 check-match
 check-exn
 check-not-exn
 lambda
 #%app
 #%datum
 quote
 quasiquote
 unquote
 thunk
 compose

 base-valid-id-set)

(define base-valid-id-set
  '(parameterize
    compile
    max-int
    min-int
    check-equal?
    check-match
    check-exn
    check-not-exn
    compose
    pretty-display
    thunk
    lambda))
