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

; queens
(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

; empty board
(define empty-board nil)

; adjoin position
(define (adjoin-position new-row k rest-of-queens)
  (cons (list new-row k) rest-of-queens))

; safe?
(define (safe? k positions)
  (define row (car (car positions)))
  (define (safe-row-n? row-n n)
    (or (= row-n row) (= (abs (- row-n row)) n)))
  (define (safe-row? n rest)
    (cond ((null? rest) #t)
          ((safe-row-n? (car (car rest)) n) #f)
          (else
           (safe-row? (+ n 1) (cdr rest)))))
  (safe-row? 1 (cdr positions)))

