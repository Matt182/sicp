(define (for-each f l)
  (f (car l))
  (if (null? (cdr l)) nil
      (for-each f (cdr l))))

(for-each (lambda (x) (newline) (display x))
(list 57 321 88))