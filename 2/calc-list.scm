(define nil '())

; list-ref
(define (my-list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))
(define squares (list 1 4 9 16 25))
; (my-list-ref squares 3)
; -> 16

; length
(define (my-length items)
  (if (null? items)
      0
      (+ 1 (my-length (cdr items)))))
(define odds (list 1 3 5 7))
; (my-length odds)
; -> 4

(define (my-length2 items)
  (let iter ((a items) (count 0))
    (if (null? a)
        count
        (iter (cdr a) (+ 1 count)))))
; (my-length2 odds)
; -> 4
