(define (inc x) (+ x 1))
(define (square x) (* x x))

(define (my-compose f g)
  (lambda (x) (f (g x))))
