#lang planet neil/sicp

(define isLoop
  (let ((seen nil))
    (lambda (x)
      (cond ((not (pair? x)) #t)
            ((memq x seen) #f)
            (else (begin (set! seen (cons x seen))
                         (and (isLoop (cdr x))
                              (isLoop (car x)))))))))

(define z2 (cons `a  nil))

(isLoop z2)

  