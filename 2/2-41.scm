(define nil '())
(define (square n) (* n n))

; is equals to sum of list?
(define (is-equals-to-sum-of-list? n)
  (lambda (seq) (= n (accumulate + 0 seq))))

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

; 2.41 (no name...)
(define (proc-2-41 n s)
  (filter (is-equals-to-sum-of-list? s) (unique-triads n)))
