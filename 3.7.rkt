#lang planet neil/sicp

(define (make-account balance s)
  (define secret s)
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
          ((eq? m `balance) balance)
          ((eq? m `chpass) (lambda (p) (set! secret p)))
          (else (error "Неизвестный вызов -- MAKE-ACCOUNT"
                       m)))
        (lambda (a) (display "Wrong password"))
        ))
  dispatch)

(define (make-joint acc pass newpass)
  (begin ((acc pass `chpass) newpass) acc))

(define a (make-account 100 `asd))

((a `asd `withdraw) 25)

(define b (make-joint a `asd `poo))

((a `poo `withdraw) 1)
((a `poo `withdraw) 25)