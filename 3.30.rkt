#lang planet neil/sicp

(define (full-adder a b c-in sum c-out)
  (let ((s (make-wire))
        (c1 (make-wire))
        (c2 (make-wire)))
    (half-adder b c-in s c1)
    (half-adder a s sum c2)
    (or-gate c1 c2 c-out)
    ’ok))

(define (ripple-carry-adder a b cin s cout)
  (define (inner)
    (if (null? a)
      'ok
      (let ((aw (car a))
            (bw (car b))
            (c-out-new (make-wire))
            (sw (car s)))
        (full-adder aw ab c sw cout)
        (ripple-carry-adder (cdr a) (cdr b) cout (cdr s) c-out-new))))
  (inner)
  s)