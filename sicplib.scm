; Value
(define nil '())

; Math
(define (average x y) (/ (+ x y) 2))
(define (cube x) (* x x x))
(define (double x) (+ x x))
;(define (even? n) (= (remainder n 2) 0))
(define (halve x) (/ x 2))
(define (square x) (* x x))

; System
(define (runtime) (current-milliseconds))
