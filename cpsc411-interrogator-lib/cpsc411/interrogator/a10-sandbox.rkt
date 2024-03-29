#lang racket/base

(require
 cpsc411/reference/a10-solution
 cpsc411/compiler-lib
 (except-in "interrogator-base-sandbox.rkt" compile with-traced min-int max-int))

(provide
 (all-from-out "interrogator-base-sandbox.rkt")
 check-exprs-lang
 expand-macros
 uniquify
 implement-safe-primops
 implement-unsafe-primops
 implement-safe-call
 implement-unsafe-call
 define->letrec
 optimize-direct-calls
 dox-lambdas
 uncover-free
 convert-closures
 optimize-known-calls
 hoist-lambdas
 implement-closures
 specify-representation
 remove-complex-opera*
 sequentialize-let
 impose-calling-conventions
 normalize-bind
 select-instructions
 expose-allocation-pointer
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
 optimize-jumps
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
 current-procedure-label-displacement
 current-procedure-arity-displacement
 current-procedure-environment-displacement

 -O2-pass-list
 -O3-pass-list

 interp-paren-x64
 link-paren-x64

 compile
 with-traced
 trace-support?

 valid-id-set)

(define trace-support? #t)

(define valid-id-set
  (append
   '( check-exprs-lang
      expand-macros
      uniquify
      implement-safe-primops
      implement-unsafe-primops
      implement-safe-call
      implement-unsafe-call
      define->letrec
      optimize-direct-calls
      dox-lambdas
      uncover-free
      convert-closures
      optimize-known-calls
      hoist-lambdas
      implement-closures
      specify-representation
      remove-complex-opera*
      sequentialize-let
      impose-calling-conventions
      normalize-bind
      select-instructions
      expose-allocation-pointer
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
      optimize-jumps
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
     current-procedure-label-displacement
     current-procedure-arity-displacement
     current-procedure-environment-displacement

     interp-paren-x64
     link-paren-x64)
   base-valid-id-set))


