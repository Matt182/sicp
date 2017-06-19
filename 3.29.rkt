#lang planet neil/sicp

(define (or-gate a1 a2 output)
  (let ((not1 (inverter (get-signal a1)))
        (not2 (inverter (get-signal a2)))
        (w1 (make-wire))
        (w2 (make-wire))
        (w3 (make-wire)))
    (set-signal! w1 not1)
    (set-signal! w2 not2)
    (and-gate w1 w2 w3)
    (inverter w3 output)))
