(define (my-reverse items)
  (define (iter new old)
    (if (null? old)
        new
        (iter (cons (car old) new) (cdr old))))
  (iter null items))

(define (my-reverse2 items)
  (let iter((new null) (old items))
    (if (null? old)
        new
        (iter (cons (car old) new) (cdr old)))))
