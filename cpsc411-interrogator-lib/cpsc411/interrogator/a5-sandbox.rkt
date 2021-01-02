#lang racket/base

(require
 "interrogator-base-sandbox.rkt"
 cpsc411/v1-reference/a4-franken-solution
 cpsc411/compiler-lib)

(provide
 (all-from-out "interrogator-base-sandbox.rkt")
 block-locals-lang->cfg
 (struct-out instruction-node)

 current-assignable-registers

 type-check-values-lang

 check-values-lang
 interp-values-lang
 uniquify
 select-instructions
 uncover-locals
 assign-homes
 assign-homes-opt
 undead-analysis
 undead-analysis/option
 conflict-analysis
 assign-registers
 discard-call-live
 replace-locations
 expose-basic-blocks
 flatten-program
 patch-instructions
 interp-paren-x64
 link-paren-x64
 generate-x64

 valid-id-set)

(define valid-id-set
  (append
   '(instruction-node
     make-instruction-node
     block-locals-lang->cfg
     current-assignable-registers
     type-check-values-lang
     check-values-lang
     interp-values-lang
     uniquify
     select-instructions
     uncover-locals
     assign-homes
     assign-homes-opt
     undead-analysis
     undead-analysis/option
     conflict-analysis
     assign-registers
     discard-call-live
     replace-locations
     expose-basic-blocks
     flatten-program
     patch-instructions
     interp-paren-x64
     link-paren-x64
     generate-x64)
   base-valid-id-set))
