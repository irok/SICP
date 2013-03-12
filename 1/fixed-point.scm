(require (lib "trace.ss"))
(define (average x y) (/ (+ x y) 2))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (sqrt-fail x)
  (fixed-point (lambda (y) (/ y x))
               1.0))

(define (new-sqrt x)
  (fixed-point (lambda (y) (average y (/ x y)))
               1.0))

; (fixed-point cos 1.0)
; (fixed-point (lambda (y) (+ (sin y) (cos y))) 1.0)
