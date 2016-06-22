(define (sqr x)(* x x))

(define (abs x)
  (if (> x 0) (x) (* x -1)))

(define (formula x y)
  (/ (+ (/ x (sqr y)) (* 2 y)) 3))

(define (cube x)(* x x x))

(define (cube-root x y)
  (if (> (abs(- x (cube (formula x y)))) 0.01)
      (cube-root x (formula x y))
      (formula x y)))

(cube-root 8 2)