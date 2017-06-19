#lang planet neil/sicp

(define z
  (let ((called 0))
  (lambda (arg)
    (if (= 0 called)
        (begin (set! called 1) arg)
        0))))

(define f z)

(+ (f 0) (f 1))