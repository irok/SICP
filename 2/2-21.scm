(define nil '())
(define (square x) (* x x))

(define (square-list1 items)
  (if (null? items)
      nil
      (cons (square (car items))
            (square-list (cdr items)))))

(define (square-list2 items)
  (map square items))
