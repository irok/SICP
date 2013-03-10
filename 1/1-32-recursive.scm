(require (lib "trace.ss"))
(define (cube x) (* x x x))
(define (inc n) (+ n 1))

(define (accumulate combiner null-value term a next b)
  (define (iter i)
    (if (> i b)
        null-value
        (combiner (term i) (iter (next i)))))
  (trace iter)
  (iter a))

; for sum
(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (sum-cubes a b)
  (sum cube a inc b))

(define (sum-integers a b)
  (sum identity a inc b))

(define (pi-sum a b)
  (define (pi-term x)
    (/ 1.0 (* x (+ x 2))))
  (define (pi-next x)
    (+ x 4))
  (sum pi-term a pi-next b))

; for product
(define (product term a next b)
  (accumulate * 1 term a next b))

(define (factorial n)
  (product identity 1 inc n))

(define (approximate-pi n)
  (define (term n)
    (if (even? n)
        (/ (+ n 2) (+ n 1))
        (/ (+ n 1) (+ n 2))))
  (* (product term 1 inc n) 4.0))
