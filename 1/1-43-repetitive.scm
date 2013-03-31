(require (lib "trace.ss"))

(define (inc x) (+ x 1))
(define (square x) (* x x))

(define (my-compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (define (iter g m)
    (if (= m 1)
        g
        (iter (my-compose f g) (- m 1))))
  (trace iter)
  (iter f n))
