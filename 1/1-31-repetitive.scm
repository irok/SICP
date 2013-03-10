(require (lib "trace.ss"))
(define (inc n) (+ n 1))

(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (trace iter)
  (iter a 1))

(define (factorial n)
  (product identity 1 inc n))

(define (approximate-pi n)
  (define (term n)
    (if (even? n)
        (/ (+ n 2) (+ n 1))
        (/ (+ n 1) (+ n 2))))
  (* (product term 1 inc n) 4.0))
