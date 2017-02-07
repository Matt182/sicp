#lang planet neil/sicp

(define (make-segment vstart vend) (cons vstart vend))
(define (start-segment seg) (car seg))
(define (end-segment seg) (cdr seg))
