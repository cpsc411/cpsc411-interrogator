#lang info
(define collection 'multi)
(define deps
  '("net-lib"
    "rackunit-lib"
    "sandbox-lib"
    "web-server-lib"
    ("base" #:version "8.2")
    "cpsc411-lib"
    "cpsc411-reference-lib"
    "functional-lib"
    "racket-index"
    "scribble-lib"
    "scribble-bettergrammar-lib"))
(define pkg-desc "implementation (no documentation, tests) of the cpsc411 interrogator")
(define version "0.1")
(define pkg-authors '(wilbowma))
(define build-deps '("at-exp-lib"))
