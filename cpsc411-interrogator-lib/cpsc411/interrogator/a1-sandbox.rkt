#lang racket/base

(require
 cpsc411/reference/a1-solution
 "interrogator-base-sandbox.rkt")

(provide
 (all-from-out "interrogator-base-sandbox.rkt")

 check-paren-x64
 interp-paren-x64
 generate-x64

 valid-id-set)

(define valid-id-set
  (append
   '(check-paren-x64
     interp-paren-x64
     generate-x64)
   base-valid-id-set))
