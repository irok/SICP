(require (lib "trace.ss"))

(define (inc x) (+ x 1))
(define (square x) (* x x))

(define (my-compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 1)
      f
      (my-compose f (repeated f (- n 1)))))

(trace repeated)