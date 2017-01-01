(define (eleven n)
  (if (< n 3) n
      (+ (eleven (- n 1)) (eleven (- n 2)) (eleven (- n 3)))))

(eleven 7)