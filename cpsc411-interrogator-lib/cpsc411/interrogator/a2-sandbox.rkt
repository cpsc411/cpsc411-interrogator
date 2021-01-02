#lang racket/base

(require
 cpsc411/reference/a2-solution
 cpsc411/2c-run-time
 "interrogator-base-sandbox.rkt")

(provide
 (all-from-out "interrogator-base-sandbox.rkt")
 uniquify
 sequentialize-let
 canonicalize-bind
 select-instructions
 uncover-locals
 assign-fvars
 replace-locations
 assign-homes
 flatten-begins
 patch-instructions
 implement-fvars
 generate-x64
 wrap-x64-run-time
 wrap-x64-boilerplate

 valid-id-set)

(define valid-id-set
  (append
   '( uniquify
      sequentialize-let
      canonicalize-bind
      select-instructions
      uncover-locals
      assign-fvars
      replace-locations
      assign-homes
      flatten-begins
      patch-instructions
      implement-fvars
      generate-x64
      wrap-x64-run-time
      wrap-x64-boilerplate)
   base-valid-id-set))
