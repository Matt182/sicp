#lang planet neil/sicp
(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((= x (car set)) set)
        ((< x (car set)) (append (list x (car set)) (cdr set)))
        (else (cons (car set)
                    (adjoin-set x (cdr set))))))

(adjoin-set 3 (list 1 2 3 6))
  