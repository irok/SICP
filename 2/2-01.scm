; constructor
(define (make-rat x y)
  (let ((g (gcd x y))
        (sign (if (< (* x y) 0) -1 1)))
    (cons (* sign (abs (/ x g)))
          (abs (/ y g)))))
; accessor
(define numer car)
(define denom cdr)

; operator
(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))
(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))
(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))
(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))
(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))

; method
(define (print-rat x)
  (display (numer x))
  (display "/")
  (display (denom x))
  (newline))