(define (square x) (* x x))

(define (cont-frac n d k)
  (define (iter i result)
    (let ((Ni (n i))
          (Di (d i)))
      (if (= i 0)
          result
          (iter (- i 1) (/ Ni (+ Di result))))))
  (iter k 0))

(define (tan-cf x k)
  (cont-frac (lambda (i) (if (= i 1) x (- (square x))))
             (lambda (i) (- (* i 2) 1))
             k))
