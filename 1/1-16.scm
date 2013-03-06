(define (square x) (* x x))
;(define (even? n) (= (remainder n 2) 0))

(define (fast-expt b n)
  (define (iter b n a)
    (cond ((= n 0) a)
          ((even? n)
           (iter (square b) (/ n 2) a))
          (else
           (iter b (- n 1) (* a b)))))
  (cond ((= n 0) 1)
        ((= n 1) b)
        (else (iter b n 1))))
