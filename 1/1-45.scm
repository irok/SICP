(define (inc x) (+ x 1))
(define (square x) (* x x))
(define (cube x) (* x x x))
(define (average x y) (/ (+ x y) 2))

(define (my-compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (define (iter g m)
    (if (= m 1)
        g
        (iter (my-compose f g) (- m 1))))
  (iter f n))

(define (pow x n)
  ((repeated (lambda (m) (* m x)) n) 1))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) 0.00001))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (fourth-root x)
  (fixed-point ((repeated average-damp 2) (lambda (y) (/ x (cube y))))
               1.0))

(define (n-th-root-try n x c)
  (fixed-point ((repeated average-damp c) (lambda (y) (/ x (pow y (- n 1))))) 1.0))

(define (n-th-root n x)
  (define (damp-count n) (floor (/ (log n) (log 2))))
  (fixed-point ((repeated average-damp (damp-count n)) (lambda (y) (/ x (pow y (- n 1))))) 1.0))