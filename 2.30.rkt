(define (square x) (* x x))

(define (square-tree tree)
  (cond ((null? tree) nil)
        ((pair? (car tree)) (append (list (square-tree (car tree)))
                                    (square-tree (cdr tree))))
        (else (append (list (square (car tree)))
                      (square-tree (cdr tree))))))


(define (map-square-tree tree)
  (map (lambda (x)
         (cond ((null? x) nil)
               ((pair? x) (map-square-tree x))
               (else (square x))))
       tree))
