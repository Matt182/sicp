(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-point x y)
  (cons x y))

(define (x-point point) (car point))
(define (y-point point) (cdr point))

(define (make-segment point1 point2)
  (cons point1 point2))

(define (start-segment seg) (car seg))
(define (end-segment seg) (cdr seg))

(define (midpoint-segment seg)
  (define (mid x y)(/ (+ x y) 2))
  (make-point
   (mid (x-point (start-segment seg)) (x-point(end-segment seg)))
   (mid (y-point (start-segment seg)) (y-point(end-segment seg)))))

(print-point (midpoint-segment (make-segment(make-point 2 2) (make-point 4 4))))