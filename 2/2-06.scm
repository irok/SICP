(define zero (lambda (f) (lambda (x) x)))
(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))
(define three (lambda (f) (lambda (x) (f (f (f x))))))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define (num-value num)
  (define (inc n) (+ n 1))
  ((num inc) 0))

(define (plus a b)
  (lambda (f) (lambda (x) ((b f) ((a f) x)))))