#lang racket/base

(require
 cpsc411/reference/a6-solution
 cpsc411/compiler-lib
 (except-in "interrogator-base-sandbox.rkt" compile with-traced max-int min-int))

(provide
 (all-from-out "interrogator-base-sandbox.rkt")

 check-values-lang
 uniquify
 sequentialize-let
 impose-calling-conventions
 normalize-bind
 select-instructions
 uncover-locals
 undead-analysis
 conflict-analysis
 assign-call-undead-variables
 allocate-frames
 assign-registers
 replace-locations
 assign-frame-variables
 implement-fvars
 optimize-predicates
 expose-basic-blocks
 resolve-predicates
 flatten-program
 patch-instructions
 generate-x64

 current-assignable-registers
 current-patch-instructions-registers
 current-parameter-registers
 current-return-value-register
 current-return-address-register
 current-frame-base-pointer-register

 interp-paren-x64
 link-paren-x64

 compile
 with-traced
 trace-support?

 valid-id-set)

(define trace-support? #t)

(define valid-id-set
  (append
   '(check-values-lang
     uniquify
     sequentialize-let
     impose-calling-conventions
     normalize-bind
     select-instructions
     uncover-locals
     undead-analysis
     conflict-analysis
     assign-call-undead-variables
     allocate-frames
     assign-registers
     replace-locations
     assign-frame-variables
     implement-fvars
     optimize-predicates
     expose-basic-blocks
     resolve-predicates
     flatten-program
     patch-instructions
     generate-x64

     current-assignable-registers
     current-patch-instructions-registers
     current-parameter-registers
     current-return-value-register
     current-return-address-register
     current-frame-base-pointer-register

     interp-paren-x64
     link-paren-x64

     compile)
   base-valid-id-set))
