(define nil '())

(define (my-reverse items)
  (define (iter new old)
    (if (null? old)
        new
        (iter (cons (car old) new) (cdr old))))
  (iter nil items))

(define (my-reverse2 items)
  (let iter((new nil) (old items))
    (if (null? old)
        new
        (iter (cons (car old) new) (cdr old)))))
