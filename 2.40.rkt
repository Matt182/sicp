(define (enumerate-interval from to)
  (if (= from to) (list to)
      (append (list from) (enumerate-interval (+ 1 from) to))))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (accumulate op init seq)
  (if (null? seq) init
      (accumulate op (op init (car seq)) (cdr seq))))

(define (uniq-pairs n)
  (flatmap
   (lambda (x) (map (lambda (y)
                      (list x y))
                    (enumerate-interval 1 x)))
   (enumerate-interval 1 n)))

(uniq-pairs 3)