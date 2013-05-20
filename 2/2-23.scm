(define nil '())

(define (my-for-each proc items)
  (cond ((null? items) #t)
        (else
         (proc (car items))
         (my-for-each proc (cdr items)))))
