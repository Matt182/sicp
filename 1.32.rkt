(define (accumulate combiner null-val term next a b)
  (if (> a b) null-val
      (combiner (term a)
                (accumulate combiner null-val term next (next a) b))))
