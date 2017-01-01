(define (square x) (* x x))

(define (cube x) (* x x x))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
(/ (+ x y) 2))

(define (good-enough2? guess prev)
  (< (abs (- prev guess)) 0.001))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (good-enough-cube? guess x)
  (< (abs (- (cube guess) x)) 0.1))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (improve-cube y x)
  (/ (+ (/ x (* y y))
        (* 2 y))
     3))

(define (sqrt-iter guess x prev)
  (if (good-enough2? guess prev)
          guess
          (sqrt-iter (improve guess x)
                     x
                     guess)))


(define (cube-iter guess x)
  (if (good-enough-cube? guess x)
          guess
          (cube-iter (improve-cube guess x)
                     x)))

(cube-iter 1.0 8)