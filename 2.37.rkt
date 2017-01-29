(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map (lambda (x) (car x)) seqs))
            (accumulate-n op init (map (lambda (x) (cdr x)) seqs)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product x v)) m))

(define (transpose mat)
   (accumulate-n cons nil mat))

(define (matrix-*-matrix m n)
(let ((cols (transpose n)))
  (map (lambda (x) (matrix-*-vector cols x)) m)))

(matrix-*-matrix (list (list 1 1 3) (list 1 2 3) (list 1 2 3))
                 (list (list 2 2 2) (list 2 2 2) (list 2 2 2)))