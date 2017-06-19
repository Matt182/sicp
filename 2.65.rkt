#lang planet neil/sicp

(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list (right-branch tree)
                                          result-list)))))
  (copy-to-list tree `()))

(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
      (cons `() elts)
      (let ((left-size (quotient (- n 1) 2)))
        (let ((left-result (partial-tree elts left-size)))
          (let ((left-tree (car left-result))
                (non-left-elts (cdr left-result))
                (right-size (- n (+ left-size 1))))
            (let ((this-entry (car non-left-elts))
                  (right-result (partial-tree (cdr non-left-elts)
                                              right-size)))
              (let ((right-tree (car right-result))
                    (remaining-elts (cdr right-result)))
                (cons (make-tree this-entry left-tree right-tree)
                      remaining-elts))))))))

(define (list_union set1 set2)
  (if (null? set1)
      set2
      (cond ((< (car set1) (car set2))
             (cons (car set1) (list_union (cdr set1) set2)))
            ((> (car set1) (car set2))
             (cons (car set2) (list_union set1 (cdr set2))))
            (else (list_union (cdr set1) set2)))))

(define (list_intersect set1 set2)
  (if (null? set1)
      `()
      (cond ((< (car set1) (car set2))
             (list_intersect (cdr set1) set2))
            ((> (car set1) (car set2))
             (list_intersect set1 (cdr set2)))
            (else (cons (car set1) (list_intersect (cdr set1) (cdr set2)))))))


(define (union-set tree1 tree2)
  (list->tree (list_union (tree->list-2 tree1) (tree->list-2 tree2))))

(define (intersect-set tree1 tree2)
  (list->tree (list_intersect (tree->list-2 tree1) (tree->list-2 tree2))))

(define tree1 (make-tree 2 (make-tree 1 `() `()) (make-tree 3 `() `())))

(define tree2 (make-tree 5 (make-tree 2 `() `()) (make-tree 6 `() `())))

(union-set tree1 tree2)

(intersect-set tree1 tree2)