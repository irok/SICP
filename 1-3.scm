(define (square x)
  (* x x))
(define (sum-of-three-squares x y z)
  (+ (square x) (square y) (square z)))
(define (smallest-number x y z)
  (if (<= x y)
      (if (<= x z)
          x
          z)
      (if (<= y z)
          y
          z)))
(define (sum-of-squares-of-two-large-number x y z)
  (- (sum-of-three-squares x y z)
     (square (smallest-number x y z))))