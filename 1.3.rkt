(define (sqsum x y)(+(* x x)(* y y)))
(define (bigest x y z)(cond ((and (> x y)(> y z))(sqsum x y))
                            ((and (> z x)(> x y))(sqsum z x))
                            ((and (> y x)(> z x))(sqsum y z))))
