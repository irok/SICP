(define nil '())
(define (my-for-each proc args)
  (let iter ((lists args))
    (cond ((null? lists) #t)
          (else
           (proc (car lists))
           (iter (cdr lists))))))
(my-for-each (lambda (x) (display x) (newline))
             (list 57 321 88))
