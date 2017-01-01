(define (pascal row col)
  (cond ((eq? row 1) 1)
        ((eq? row 2) 1)
        ((eq? col 1) 1)
        ((eq? row col) 1)
        (else (+ (pascal (- row 1) (- col 1))
                 (pascal (- row 1) col)))))

(pascal 5 3)