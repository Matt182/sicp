(define (repeated f x)
  (lambda (n)
    (if (> n 0)(f((repeated f x) (- n 1)))
        x)))
