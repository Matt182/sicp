#lang planet neil/sicp

(define (make-monitored f)
  (let ((count 0))
    (lambda (arg)
      (cond ((eq? `how-many-calls? arg) count)
            ((eq? `reset-count arg) (set! count 0))
            (else (begin (set! count (+ count 1))
                         (f arg)))))))

(define s (make-monitored (lambda (x) x)))

(s 10)
(s 10)
(s 10)
(s `how-many-calls?)
(s `reset-count)
(s `how-many-calls?)