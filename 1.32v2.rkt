(define (product f a next b)
  (if (= a b) (f a)
      (* (f a)
         (product f (next a) next b))))

(define (product-iter f a next b)
  (define (iter f a next b acc)
    (if (= a b) (* (f a) acc)
        (iter f (next a) next b (* (f a) acc))))
  (iter f a next b 1))

(define (accumulate combiner null-value f a next b)
  (if (= a b) null-value
      (combiner (f a)
                (accumulate combiner null-value f (next a) next b))))

(define (acc-iter combiner null-value f a next b)
  (define (iter a acc)
    (if (> a b) acc
        (iter (f a) (combiner (f a) acc))))
  (iter a null-value))