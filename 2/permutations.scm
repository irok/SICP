(define nil '())

; accumulate
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

; enumerate-interval
(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))

; flatmap
(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

; my-remove
(define (my-remove item sequence)
  (filter (lambda (x) (not (= x item)))
          sequence))

; permutations
(define (permutations s)
  (if (null? s)
      (list nil)
      (flatmap (lambda (x)
                 (map (lambda (p) (cons x p))
                      (permutations (my-remove x s))))
               s)))
