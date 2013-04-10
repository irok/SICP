; rectangle
(define make-rectangle cons)
(define left-top-rectangle car)
(define right-bottom-rectangle cdr)
(define (width rect)
  (abs (- (x-point (right-bottom-rectangle rect))
       (x-point (left-top-rectangle rect)))))
(define (height rect)
  (abs (- (y-point (right-bottom-rectangle rect))
       (y-point (left-top-rectangle rect)))))
(define (perimeter rect)
  (* 2 (+ (width rect) (height rect))))
(define (area rect)
  (* (width rect) (height rect)))

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
