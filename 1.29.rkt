(define (cube x)
  (* x x x))

(define (sum term a next b k h)
  (if (> a b)
      0
  (+ (term a)
     (sum term (next a (+ k 1) h) next b (+ k 1) h))))

(define (y a k h)
  (+ a (* k h)))

(define (simpson-integral f a b n)
  (define h (/ (- b a) n))
  (* (/ h 3)(sum f a y b 0 h))
  )

(simpson-integral cube 0 1 1000)