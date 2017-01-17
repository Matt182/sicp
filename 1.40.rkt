(define (cube x) (* x x x))

(define (quad x) (* x x))

(define (cubic a b c)
  (lambda(x) (+ (cube x) (* a (quad x)) (* b x) c)))


