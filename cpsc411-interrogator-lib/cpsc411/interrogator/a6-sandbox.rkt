#lang racket/base

(require
 cpsc411/v1-reference/a6-solution
 cpsc411/deprecated/a6-compiler-lib
 "interrogator-base-sandbox.rkt")

(provide
 (all-from-out "interrogator-base-sandbox.rkt")

 check-values-lang
 type-check-values-lang
 uniquify
 select-instructions
 uncover-locals
 undead-analysis
 conflict-analysis
 pre-assign-frame-variables
 assign-frames
 assign-registers
 assign-frame-variables
 discard-call-live
 replace-locations
 implement-fvars
 expose-basic-blocks
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
     type-check-values-lang
     uniquify
     select-instructions
     uncover-locals
     undead-analysis
     conflict-analysis
     pre-assign-frame-variables
     assign-frames
     assign-registers
     assign-frame-variables
     discard-call-live
     replace-locations
     implement-fvars
     expose-basic-blocks
     flatten-program
     patch-instructions
     generate-x64
     interp-paren-x64
     link-paren-x64
     current-assignable-registers
     current-patch-instructions-registers
     current-parameter-registers
     current-return-value-register
     current-return-address-register
     current-frame-base-pointer-register)
   base-valid-id-set))
