(define (cube x) (* x x x))


(define dx 0.00001)

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))


((deriv cube) 5)

