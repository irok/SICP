(define nil '())
(define (square n) (* n n))

; accumulate
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

; enumerate interval
(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))

; flatmap
(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

; unique pairs
(define (unique-pairs n)
  (flatmap
   (lambda (i)
     (map (lambda (j) (list j i))
          (enumerate-interval 1 (- i 1))))
   (enumerate-interval 2 n)))

; unique triads
(define (unique-triads n)
  (flatmap
   (lambda (i)
     (map (lambda (pair) (append pair (list i)))
          (unique-pairs (- i 1))))
   (enumerate-interval 3 n)))

; sum of list is equals to s?
(define (sum-of-list-is-equal-to-s? s)
  (lambda (seq) (= s (accumulate + 0 seq))))

; 2.41 (no name...)
(define (proc-2-41 s n)
  (filter (sum-of-list-is-equal-to-s? s) (unique-triads n)))
