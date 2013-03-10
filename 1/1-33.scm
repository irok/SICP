(define (inc n) (+ n 1))
(define (square n) (* n n))

(define (filtered-accumulate combiner null-value term a next b filter)
  (define (iter i result)
    (cond ((> i b) result)
          ((filter i) (iter (next i) (combiner (term i) result)))
          (else (iter (next i) result))))
  (iter a null-value))

; prime?
(define (prime? n)
  (define (fast-prime? n times)
    (define (expmod base exp m)
      (cond ((= exp 0) 1)
            ((even? exp)
             (remainder (square (expmod base (/ exp 2) m)) m))
            (else
             (remainder (* base (expmod base (- exp 1) m)) m))))
    (define (fermat-test n)
      (define (try-it a)
        (= (expmod a n n) a))
      (try-it (+ 1 (random (- n 1)))))
    (cond ((= times 0) true)
          ((fermat-test n) (fast-prime? n (- times 1)))
          (else false)))
  (fast-prime? n 1000))
  
; a
(define (sum-squares-prime a b)
  (filtered-accumulate + 0 square a inc b prime?))

; b
(define (product-coprime a b)
  (define (coprime? n) (= (gcd n b) 1))
  (filtered-accumulate * 1 identity a inc b coprime?))
