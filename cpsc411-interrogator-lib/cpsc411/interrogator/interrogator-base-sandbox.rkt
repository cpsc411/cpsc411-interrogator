#lang racket/base
(require
 racket/pretty
 racket/function
 ;; TODO: Need to collapse compiler lib into a single library, rather than
 ;; assignment specific ones.
 ;cpsc411/compiler-lib
 rackunit)

(provide
 ;with-traced
 ;compile

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
    check-equal?
    check-match
    check-exn
    check-not-exn
    compose
    pretty-display
    thunk
    lambda))
