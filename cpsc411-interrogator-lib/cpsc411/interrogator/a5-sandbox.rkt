#lang racket/base

(require
 "interrogator-base-sandbox.rkt"
 cpsc411/reference/a5-solution
 cpsc411/compiler-lib)

(provide
 (all-from-out "interrogator-base-sandbox.rkt")

 current-assignable-registers
 current-patch-instructions-registers
 current-parameter-registers
 current-return-value-register
 current-return-address-register
 current-frame-base-pointer-register

 type-check-values-lang

 check-values-lang
 type-check-values-lang
 uniquify
 sequentialize-let
 impose-calling-conventions
 canonicalize-bind
 select-instructions
 assign-homes-opt
 uncover-locals
 undead-analysis
 conflict-analysis
 assign-registers
 replace-locations
 expose-basic-blocks
 resolve-predicates
 flatten-program
 patch-instructions
 implement-fvars
 generate-x64

 interp-paren-x64
 link-paren-x64

 valid-id-set

 trace-support?)

(define trace-support? #t)

(define valid-id-set
  (append
   '(current-assignable-registers
     current-patch-instructions-registers
     current-parameter-registers
     current-return-value-register
     current-return-address-register
     current-frame-base-pointer-register

     type-check-values-lang

     check-values-lang
     type-check-values-lang
     uniquify
     sequentialize-let
     impose-calling-conventions
     canonicalize-bind
     select-instructions
     assign-homes-opt
     uncover-locals
     undead-analysis
     conflict-analysis
     assign-registers
     replace-locations
     expose-basic-blocks
     resolve-predicates
     flatten-program
     patch-instructions
     implement-fvars
     generate-x64

     interp-paren-x64
     link-paren-x64)
   base-valid-id-set))
