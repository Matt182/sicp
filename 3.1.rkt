#lang planet neil/sicp

(define (make-accumulator start)
  (lambda (added)
    (begin
      (set! start (+ start added))
      start)))
