#lang planet neil/sicp

(define (make-account balance secret)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Недостаточно денег на счете"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch sec m)
    (if (eq? sec secret)
        (cond ((eq? m `withdraw) withdraw)
          ((eq? m `deposit) deposit)
          (else (error "Неизвестный вызов -- MAKE-ACCOUNT"
                       m)))
        (error "Wrong password")
        ))
  dispatch)

(define a (make-account 100 `asd))

((a `zxc `withdraw) 25)