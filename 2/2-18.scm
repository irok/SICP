(define (my-reverse items)
  (define (iter new old)
    (if (null? old)
        new
        (iter (cons (car old) new) (cdr old))))
  (iter null items))
