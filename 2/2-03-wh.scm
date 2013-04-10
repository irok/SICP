; rectangle
(define make-rectangle cons)
(define width car)
(define height cdr)
(define (perimeter rect)
  (* 2 (+ (width rect) (height rect))))
(define (area rect)
  (* (width rect) (height rect)))
