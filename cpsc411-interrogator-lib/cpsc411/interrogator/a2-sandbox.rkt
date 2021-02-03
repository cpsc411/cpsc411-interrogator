#lang racket/base

(require
 cpsc411/reference/a2-solution
 cpsc411/compiler-lib
 cpsc411/2c-run-time
 "interrogator-base-sandbox.rkt")

(provide
 (all-from-out "interrogator-base-sandbox.rkt")
 wrap-x64-run-time
 wrap-x64-boilerplate

 check-values-lang
 uniquify
 sequentialize-let
 canonicalize-bind
 select-instructions
 uncover-locals
 assign-fvars
 replace-locations
 assign-homes ; composition
 flatten-begins
 patch-instructions
 implement-fvars
 check-paren-x64
 generate-x64

 interp-values-lang
 interp-paren-x64

 valid-id-set
 trace-support?)

(define trace-support? #t)

(define valid-id-set
  (append
   '(
     wrap-x64-run-time
     wrap-x64-boilerplate

     check-values-lang
     uniquify
     sequentialize-let
     canonicalize-bind
     select-instructions
     uncover-locals
     assign-fvars
     replace-locations
     assign-homes ; composition
     flatten-begins
     patch-instructions
     implement-fvars
     check-paren-x64
     generate-x64

     interp-values-lang
     interp-paren-x64)
   base-valid-id-set))

(current-pass-list
 (list
  check-values-lang
  uniquify
  sequentialize-let
  canonicalize-bind
  select-instructions
  assign-homes ; composition
  flatten-begins
  patch-instructions
  implement-fvars
  check-paren-x64
  generate-x64
  wrap-x64-run-time
  wrap-x64-boilerplate))
