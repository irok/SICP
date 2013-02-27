(define (myexpt b n)
  (if (= n 0)
      1
      (* b (myexpt b (- n 1)))))
