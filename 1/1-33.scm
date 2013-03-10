(define (inc n) (+ n 1))
(define (square n) (* n n))

(define (filtered-accumulate combiner null-value term a next b filter)
  (define (iter i result)
    (if (> i b)
        result
        (iter (next i) (if (filter i)
                           (combiner (term i) result)
                           result))))
  (iter a null-value))

; prime?
(define (prime? n)
  (define (divides? a b)
    (= (remainder b a) 0))
  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))))
  (define (smallest-divisor n)
    (find-divisor n 2))
  (= n (smallest-divisor n)))
  
; a
(define (sum-of-prime-squares a b)
  (filtered-accumulate + 0 square a inc b prime?))

; b
(define (product-of-coprime-numbers a b)
  (define (coprime? n) (= (gcd n b) 1))
  (filtered-accumulate * 1 identity a inc b coprime?))
