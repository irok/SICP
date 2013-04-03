(require (lib "trace.ss"))
(define (average x y) (/ (+ x y) 2))
(define (square x) (* x x))

; iterative-improve
(define (iterative-improve enough? improve)
  (define (try guess)
    (let ((improved (improve guess)))
      (if (enough? improved guess)
          improved
          (try improved)
          )))
  ;(trace try)
  (lambda (first-guess) (try first-guess)))

; close-enough?
(define (close-enough? v1 v2)
  (< (abs (- v1 v2)) 0.00001))

; 1.1.7
(define (im-sqrt x)
  ((iterative-improve close-enough?
                      (lambda (y) (average y (/ x y)))) 1.0))

; 1.3.3
(define (fixed-point f first-guess)
  ((iterative-improve close-enough? f) first-guess))

(define (fp-sqrt x)
  (fixed-point (lambda (y) (average y (/ x y))) 1.0))

; with average-damp
(define (average-damp f) (lambda (x) (average x (f x))))

(define (ad-sqrt x)
  (fixed-point (average-damp (lambda (y) (/ x y))) 1.0))

(define (cube-root x)
  (fixed-point (average-damp (lambda (y) (/ x (square y)))) 1.0))

; Q1.45
(define (my-compose f g) (lambda (x) (f (g x))))

(define (repeated f n)
  (define (iter g m)
    (if (= m 1) g (iter (my-compose f g) (- m 1))))
  (iter f n))

(define (pow x n) ((repeated (lambda (m) (* m x)) n) 1))

(define (n-th-root n x)
  (define (damp-count n) (ceiling (/ (log n) (log 2))))
  (fixed-point ((repeated average-damp (damp-count n)) (lambda (y) (/ x (pow y (- n 1))))) 1.0))
