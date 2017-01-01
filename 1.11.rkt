(define (sigma3 n x)
  (if (> x 0)(+ (- n x) (sigma3 n (- x 1)))
      0))

(define (f n)
  (if  ( < n 3) n
      (sigma3 n 3)))

(f 3)