#lang planet neil/sicp
(define wave einstein)

(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((up (beside (up-split painter (- n 1))
                        (up-split painter (- n 1)))))
        (below painter up))))

(define (right-split painter n)
  (if (= n 0)
      painter
      (let ((right (below (right-split painter (- n 1))
                           (right-split painter (- n 1)))))
        (beside painter right))))

(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1))))
        (let ((top-left (beside up up))
              (bottom-right (below right right))
              (corner (corner-split painter (- n 1))))
          (beside (below painter top-left)
                  (below bottom-right corner))))))


(paint (corner-split wave 2))