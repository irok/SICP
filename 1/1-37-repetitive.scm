(require (lib "trace.ss"))

(define fai 1.6180)
(define tolerance 0.0001)

(define (cont-frac n d k)
  (define (iter i result)
    (let ((Ni (n i))
          (Di (d i)))
      (if (= i 0)
          result
          (iter (- i 1) (/ Ni (+ Di result))))))
  (trace iter)
  (iter k 0))

(define (cont-frac-fai k)
  (cont-frac (lambda (i) 1.0)
             (lambda (i) 1.0)
             k))

(define (cont-frac-fai-enough? k)
  (< (abs (- (cont-frac-fai k) (/ 1 fai))) tolerance))
