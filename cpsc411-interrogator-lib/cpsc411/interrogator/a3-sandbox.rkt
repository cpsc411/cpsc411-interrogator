#lang racket/base

(require
 cpsc411/reference/a3-solution
 cpsc411/2c-run-time
 cpsc411/compiler-lib
 "interrogator-base-sandbox.rkt")

(provide
 (all-from-out "interrogator-base-sandbox.rkt")

 interp-paren-x64
 check-paren-x64
 check-values-lang
 uniquify
 sequentialize-let
 canonicalize-bind
 select-instructions
 uncover-locals
 undead-analysis
 conflict-analysis
 assign-registers
 replace-locations
 assign-homes-opt
 assign-homes
 flatten-begins
 patch-instructions
 implement-fvars
 generate-x64
 wrap-x64-run-time
 wrap-x64-boilerplate

 valid-id-set
 trace-support?)

(define trace-support? #t)

(define valid-id-set
  (append
   '(interp-paren-x64
     check-paren-x64
     check-values-lang
     uniquify
     sequentialize-let
     canonicalize-bind
     select-instructions
     uncover-locals
     undead-analysis
     conflict-analysis
     assign-registers
     replace-locations
     assign-homes-opt
     assign-homes
     flatten-begins
     patch-instructions
     implement-fvars
     generate-x64
     wrap-x64-run-time
     wrap-x64-boilerplate)
   base-valid-id-set))

(current-pass-list
 (list
  check-values-lang
  uniquify
  sequentialize-let
  canonicalize-bind
  select-instructions
  assign-homes-opt
  flatten-begins
  patch-instructions
  implement-fvars
  generate-x64
  wrap-x64-run-time
  wrap-x64-boilerplate))
