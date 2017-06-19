#lang planet neil/sicp

(define (lookup-tree x tree)
  (cond ((null? tree) false)
        ((equal? x (car tree)) tree)
        ((< x (car tree))(lookup-tree x (cddr tree)))
        (else (lookup-tree x (cdr tree)))))
