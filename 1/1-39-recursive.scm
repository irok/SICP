(define (square x) (* x x))

(define (cont-frac n d k)
  (define (iter i)
    (let ((Ni (n i))
          (Di (d i)))
      (if (= i k)
          (/ Ni Di)
          (/ Ni (+ Di (iter (+ i 1)))))))
  (iter 1))

(define (tan-cf x k)
  (cont-frac (lambda (i) (if (= i 1) x (- (square x))))
             (lambda (i) (- (* i 2) 1))
             k))
