(define (inc x) (+ x 1))
(define (square x) (* x x))

(define (my-compose g f)
  (lambda (x) (g (f x))))
