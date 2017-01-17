(define (same-parity a . b)
  (define (inner l acc)
    (if (null? l) acc
        (inner (cdr l)
               (if (= (remainder a 2)
                      (remainder (car l) 2)) (append acc (list (car l)))
                                             acc))))

  (inner b (list a)))
(same-parity 2 3 4 5 6)