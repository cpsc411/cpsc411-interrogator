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
 current-pass-list

 pretty-display

 #%module-begin
 #%top-interaction
 #%top
 check-equal?
 check-match
 check-exn
 check-not-exn
 let
 lambda
 #%app
 #%datum
 quote
 quasiquote
 unquote
 thunk
 compose
 list

 base-valid-id-set)

(define base-valid-id-set
  '(parameterize
    current-pass-list
    let
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
    lambda
    list))
