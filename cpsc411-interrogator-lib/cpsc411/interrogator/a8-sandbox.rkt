#lang racket/base

(require
 "interrogator-base-sandbox.rkt"
 cpsc411/v1-reference/a8-solution
 (except-in cpsc411/deprecated/a8-compiler-lib compile with-traced min-int max-int))

(provide
 (all-from-out "interrogator-base-sandbox.rkt")

 check-exprs-lang
 uniquify
 implement-safe-primops
 specify-representation
 a-normalize
 select-instructions
 expose-allocation-pointer
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
 implement-mops
 generate-x64

 current-assignable-registers
 current-patch-instructions-registers
 current-parameter-registers
 current-return-value-register
 current-return-address-register
 current-frame-base-pointer-register
 current-heap-base-pointer-register

 current-fixnum-shift
 current-fixnum-mask
 current-fixnum-tag
 current-boolean-shift
 current-boolean-mask
 current-boolean-tag
 current-true-ptr
 current-false-ptr
 current-empty-mask
 current-empty-tag
 current-empty-ptr
 current-void-mask
 current-void-tag
 current-void-ptr
 current-ascii-char-shift
 current-ascii-char-mask
 current-ascii-char-tag
 current-error-shift
 current-error-mask
 current-error-tag
 current-pair-shift
 current-pair-mask
 current-pair-tag
 current-pair-size
 current-car-displacement
 current-cdr-displacement
 car-offset
 cdr-offset
 current-vector-shift
 current-vector-mask
 current-vector-tag
 current-vector-length-displacement
 current-vector-base-displacement
 current-procedure-shift
 current-procedure-mask
 current-procedure-tag
 current-procedure-size
 current-procedure-label-displacement
 current-procedure-arity-displacement

 interp-paren-x64
 link-paren-x64

 compile
 with-traced
 trace-support?

 valid-id-set)

(define trace-support? #t)

(define valid-id-set
  (append
   '(check-exprs-lang
     uniquify
     implement-safe-primops
     specify-representation
     a-normalize
     select-instructions
     expose-allocation-pointer
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
     implement-mops
     generate-x64

     current-assignable-registers
     current-patch-instructions-registers
     current-parameter-registers
     current-return-value-register
     current-return-address-register
     current-frame-base-pointer-register
     current-heap-base-pointer-register

     current-fixnum-shift
     current-fixnum-mask
     current-fixnum-tag
     current-boolean-shift
     current-boolean-mask
     current-boolean-tag
     current-true-ptr
     current-false-ptr
     current-empty-mask
     current-empty-tag
     current-empty-ptr
     current-void-mask
     current-void-tag
     current-void-ptr
     current-ascii-char-shift
     current-ascii-char-mask
     current-ascii-char-tag
     current-error-shift
     current-error-mask
     current-error-tag
     current-pair-shift
     current-pair-mask
     current-pair-tag
     current-pair-size
     current-car-displacement
     current-cdr-displacement
     car-offset
     cdr-offset
     current-vector-shift
     current-vector-mask
     current-vector-tag
     current-vector-length-displacement
     current-vector-base-displacement
     current-procedure-shift
     current-procedure-mask
     current-procedure-tag
     current-procedure-size
     current-procedure-label-displacement
     current-procedure-arity-displacement

     interp-paren-x64
     link-paren-x64)
   base-valid-id-set))
