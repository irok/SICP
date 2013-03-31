(define (inc x) (+ x 1))
(define (square x) (* x x))

(define (my-compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (define (iter g m)
    (if (= m 1)
        g
        (iter (my-compose f g) (- m 1))))
  (iter f n))

(define (smooth f)
  (let ((dx 0.00001))
    (lambda (x) (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3))))

(define (n-fold-smooth f n)
  ((repeated smooth n) f))
