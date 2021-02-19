#lang racket/base

(require
 cpsc411/reference/a7-solution
 cpsc411/compiler-lib
 (except-in "interrogator-base-sandbox.rkt" compile with-traced  max-int min-int))

(provide
 (all-from-out "interrogator-base-sandbox.rkt")

 check-exprs-lang
 uniquify
 implement-safe-primops
 specify-representation
 remove-complex-opera*
 sequentialize-let
 impose-calling-conventions
 canonicalize-bind
 select-instructions
 uncover-locals
 undead-analysis
 conflict-analysis
 assign-call-undead-variables
 allocate-frames
 assign-registers
 assign-frame-variables
 replace-locations
 optimize-predicates
 implement-fvars
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
     remove-complex-opera*
     sequentialize-let
     impose-calling-conventions
     canonicalize-bind
     select-instructions
     uncover-locals
     undead-analysis
     conflict-analysis
     assign-call-undead-variables
     allocate-frames
     assign-registers
     assign-frame-variables
     replace-locations
     optimize-predicates
     implement-fvars
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

     interp-paren-x64
     link-paren-x64)
   base-valid-id-set))
