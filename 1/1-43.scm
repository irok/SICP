(define (inc x) (+ x 1))
(define (square x) (* x x))

(define (my-compose g f)
  (lambda (x) (g (f x))))

(define (repeated f n)
  (if (= n 1)
    f
    (repeated (my-compose f f) (- n 1))))
