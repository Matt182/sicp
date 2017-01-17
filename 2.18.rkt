(define (reverse list)
  (if (null? (cdr list)) nil
             (append (reverse (cdr list))(cons (car list) nil))))


(reverse (list 1 2 3 4))