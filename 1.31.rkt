(define (product term next a b)
  (if (= a b) a
      (* (term a) (product term next (next a) b))))

(define (factorial b)
  (define (next a)(+ a 1))
  (define (term a)(* a 1))
  (product term next 1 b))

(define (pi n)
  (define (next a)(+ a 1))
  (define (term a)
    (if (= (modulo a 2) 0)(* a a)
        (/ 1 (* a a))))
  (* 4
     (* 2 (product term next 3 n))))
