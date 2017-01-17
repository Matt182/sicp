(define (make-rat n d)
  (let ((newn (if (< d 0)(* (abs n) -1)
                  n)))
    (let ((newd (abs d)))
      (let ((g (gcd newn newd)))
        (cons (/ newn g) (/ newd g))))))

