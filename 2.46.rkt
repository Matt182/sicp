#lang planet neil/sicp
(define wave einstein)

(define (make-vect x-cor y-cor)
  (cons x-cor y-cor))

(define (xcor-vect vect) (car vect))
(define (ycor-vect vect) (cdr vect))

(define (vect-op op v1 v2)
  (define (opp proc)
    (op (proc v1)
        (proc v2)))
  (make-vect (opp xcor-vect) (opp ycor-vect)))

(define (add-vect vect1 vect2)
  (vect-op + vect1 vect2))

(define (sub-vect vect1 vect2)
  (vect-op - vect1 vect2))

(define (scale-vect s v)
  (make-vect (* s (xcor-vect v)) (* s (ycor-vect v))))

(define v (make-vect 1 3))
(define v2 (make-vect 2 4))

(scale-vect 2 v2)