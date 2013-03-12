(define tolerance 0.0001)

(define (cont-frac n d k)
  (define (iter i result)
    (let ((Ni (n i))
          (Di (d i)))
      (if (= i 0)
          result
          (iter (- i 1) (/ Ni (+ Di result))))))
  (iter k 0))

(define (cont-frac-e k)
  (+ 2 (cont-frac (lambda (i) 1.0)
                  (lambda (i)
                    (if (= (remainder i 3) 2)
                        (* (/ (+ i 1) 3) 2)
                        1))
                  k)))

(define (cont-frac-e-enough? k)
  (< (abs (- (cont-frac-e k) e)) tolerance))
