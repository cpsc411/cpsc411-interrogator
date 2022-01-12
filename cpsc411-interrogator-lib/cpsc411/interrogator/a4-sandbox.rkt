#lang racket/base

(require
 cpsc411/reference/a4-solution
 cpsc411/2c-run-time
 cpsc411/compiler-lib
 "interrogator-base-sandbox.rkt")

(provide
 (all-from-out "interrogator-base-sandbox.rkt")

 uniquify
 sequentialize-let
 normalize-bind
 select-instructions
 uncover-locals
 undead-analysis
 conflict-analysis
 assign-registers
 replace-locations
 assign-homes-opt
 expose-basic-blocks
 resolve-predicates
 optimize-jumps
 flatten-program
 inline-jumps
 patch-instructions
 implement-fvars
 generate-x64

 current-assignable-registers
 current-patch-instructions-registers
 current-return-value-register
 current-frame-base-pointer-register

 wrap-x64-run-time
 wrap-x64-boilerplate

 link-paren-x64
 interp-paren-x64

 interp-values-lang

 valid-id-set)

(define valid-id-set
  (append
   '(uniquify
     sequentialize-let
     normalize-bind
     select-instructions
     uncover-locals
     undead-analysis
     conflict-analysis
     assign-registers
     replace-locations
     assign-homes-opt
     expose-basic-blocks
     resolve-predicates
     optimize-jumps
     flatten-program
     inline-jumps
     patch-instructions
     implement-fvars
     generate-x64

     current-assignable-registers
     current-patch-instructions-registers
     current-return-value-register
     current-frame-base-pointer-register

     wrap-x64-run-time
     wrap-x64-boilerplate

     link-paren-x64
     interp-paren-x64

     interp-values-lang)

   base-valid-id-set))
