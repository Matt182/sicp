(define (enumerate-interval from to)
  (if (= from to) (list to)
      (append (list from) (enumerate-interval (+ 1 from) to))))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (accumulate op init seq)
  (if (null? seq) init
      (accumulate op (op init (car seq)) (cdr seq))))

(define (filter pred seq)
  (cond ((null? seq) `())
        ((pred (car seq)) (cons (car seq) (filter pred (cdr seq))))
        (else (filter pred (cdr seq)))))

(define (ordered-uniq-trios n)
  (flatmap (lambda (x)
   (flatmap (lambda (y)
              (map (lambda (z) (list z y x))
                   (enumerate-interval 1 y)))
            (enumerate-interval 1 x)))
   (enumerate-interval 1 n)))

(define (less-trios-sum s n)
  (filter
   (lambda (x) (= s (accumulate + 0 x)))
   (ordered-uniq-trios n)))

(less-trios-sum 6 3)