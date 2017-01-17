(define (product f a next b)
  (if (= a b) (f a)
      (* (f a)
         (product f (next a) next b))))

(define (product-iter f a next b)
  (define (iter f a next b acc)
    (if (= a b) (* (f a) acc)
        (iter f (next a) next b (* (f a) acc))))
  (iter f a next b 1))

(define (inc x) (+ x 1))

(define (factorial x)
  (define (iden x) x)
  (product iden 1 inc x))


(define (pi)
  (define (f-top x)
    (if (even? x) (+ 2 x)
        (+ 2 (- x 1))))
  (define (f-bottom x)
    (if (even? x) (+ 2 (- x 1))
        (+ 2 x)))
  (* 4
     (/ (product f-top 1 inc 13)
        (product f-bottom 1 inc 13))))

