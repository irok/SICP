(define (average x y) (/ (+ x y) 2.0))

; segment
(define make-segment cons)
(define start-segment car)
(define end-segment cdr)
(define (midpoint-segment seg)
  (make-point
    (average (x-point (start-segment seg)) (x-point (end-segment seg)))
    (average (y-point (start-segment seg)) (y-point (end-segment seg)))))

; point
(define make-point cons)
(define x-point car)
(define y-point cdr)

; method
(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")")
  (newline))
