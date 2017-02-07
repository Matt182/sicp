#lang planet neil/sicp
(define (make-frame-list origin edge1 edge2)
  (list origin edge1 edge2))

(define (make-frame-cons origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define (origin-list frame) (car frame))
(define (edge1-list frame) (cdr (car frame)))
(define (edge2-list frame) (cdr (cdr (car frame))))

(define (origin-cons frame) (car frame))
(define (edge1-cons frame) (cdr (car frame)))
(define (edge2-cons frame) (cdr (cdr frame)))

