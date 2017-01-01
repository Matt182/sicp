(define (fast-mul a b)
  (cond ((= b 0) 0)
        ((= b 1) a)
        ((even? b) (fast-mul (double a) (half b)))
        (else (+ a (fast-mul a (- b 1))))))

(define (double x) (* 2 x))

(define (half x) (/ x 2))

(fast-mul 111 23)