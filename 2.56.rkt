#lang planet neil/sicp
(define (=number? var num)
  (and (number? var) (= var num)))

(define (pow a b)
  (if (= b 0) 1
      (* a (pow a (- b 1)))))

(define (exponentation? x)
  (and (pair? x) (eq? (car x) `**)))

(define (base x) (cadr x))
(define (exponent x) (caddr x))

(define (make-exponentiation base exp)
  (cond ((=number? exp 0) 1)
        ((=number? exp 1) base)
        ((and (number? base) (number? exp)) (pow base exp))
        (else (list `** base exp))))

