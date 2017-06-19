#lang planet neil/sicp

(define (front-ptr queue) (car queue))
(define (rear-ptr queue) (cdr queue))
(define (set-front-ptr! queue item) (set-car! queue item))
(define (set-rear-ptr! queue item) (set-cdr! queue item))

(define (empty-queue? queue) (null? (front-ptr queue)))

(define (make-queue) (cons `() `()))

(define (front-queue queue)
  (if (empty-queue? queue)
      (error "FRONT вызвана с пустой очередью" queue)
      (car (front-ptr queue))))

(define (display-queue queue)
  (define (print qu)
    (if (null? qu)
        #t
        (begin (display (car qu))
               (display " ")
               (print (cdr qu)))))
  (let ((q (front-ptr queue)))
    (print q)))

(define (insert-queue! queue item)
  (let ((new-pair (cons item `())))
    (cond ((empty-queue? queue)
           (set-front-ptr! queue new-pair)
           (set-rear-ptr! queue new-pair)
           queue)
          (else
           (set-cdr! (rear-ptr queue) new-pair)
           (set-rear-ptr! queue new-pair)
           queue))))

(define z (make-queue))
(insert-queue! z `a)
(insert-queue! z `b)
(insert-queue! z `c)
(display-queue z)