(define (square x) (* x x))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((= n 1) b)
        (else (expt-iter b n 1))))

(define (expt-iter b n a)
  
  

;(define (even? n) (= (remainder n 2) 0))