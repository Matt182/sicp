(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

(define (total-weight mobile)
  (define (branch-weight branch)
    (if (pair? (branch-structure branch))
               (branch-weight (branch-structure branch))
               (branch-structure branch)))
  (cond ((null? mobile) 0)
        ((+ (branch-weight (left-branch mobile))
            (branch-weight (right-branch mobile))))))

(define (balansed? mobile)
  (define (rotation-moment branch)
    (cond ((null? branch) 0)
          ((pair? (branch-structure branch)) (* (branch-length branch)
                                                (rotation-moment (branch-structure branch))))
          (else (* (branch-length branch)
                   (branch-structure branch)))))
  (if (null? mobile) #t
      (= (rotation-moment (left-branch mobile))
         (rotation-moment (right-branch mobile)))))

(total-weight (make-mobile (make-branch 1 (make-branch 1 2))(make-branch 1 (make-branch 1 2))))