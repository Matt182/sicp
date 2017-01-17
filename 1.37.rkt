(define (cont-frac l1 l2 k)
  (if (= k 1)(/ (l1 k) (l2 k))
      (/ (l1 k) (+ (l2 k) (cont-frac l1 l2 (- k 1))))))




(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           10)
