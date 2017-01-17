(define (fringe x)
  (cond ((null? x) nil)
        ((pair? (car x)) (append (deep-reverse(car x))
                                 (deep-reverse(cdr x))))
        (else (append (list (car x))
                      (deep-reverse(cdr x))
                      ))))

(define x (list (list 1 2) (list 3 4)))

(fringe (list x x))