(define (repeated f n)
  (lambda (x)
    (if (= n 1)(f x)
        (f ((repeated f (- n 1)) x)))))

(define dx 0.00001)

(define (square x) (* x x))

(define (smooth f)
  (lambda (x)
    (/ (+ (f (- x dx)) (f x) (f (+ x dx)))
       3)))

(define (n-fold-smooth f n)
  (lambda (x)
    ((repeated (smooth f) n) x)))

((n-fold-smooth square 1) 2)