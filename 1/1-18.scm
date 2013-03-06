(define (double x) (+ x x))
(define (halve x) (/ x 2))
;(define (even? n) (= (remainder n 2) 0))

(define (my-* a b)
  (define (iter a b s)
    (cond ((= b 0) s)
          ((even? b)
           (iter (double a) (halve b) s))
          (else
           (iter a (- b 1) (+ s a)))))
  (if (or (= a 0) (= b 0))
      0
      (iter a b 0)))
