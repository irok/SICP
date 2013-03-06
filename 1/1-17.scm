(define (double x) (+ x x))
(define (halve x) (/ x 2))
;(define (even? n) (= (remainder n 2) 0))

(define (my-* a b)
  (cond ((= b 0) 0)
        ((even? b) (my-* (double a) (halve b)))
        (else (+ a (my-* a (- b 1))))))
