(define (fast-pow a b)
  (pow-iter a b 1))

(define (pow-iter a b c)
  (cond ((= b 1) c)
        ((even? b) (pow-iter a (/ b 2) (* c a a)))
        (else (* a (pow-iter a (- b 1) c) ))))

(fast-pow 2 5)