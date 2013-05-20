(define nil '())

(define (same-parity first . rest)
  (cons first
        (my-filter (lambda (x) (even? (bitwise-xor first x))) rest)))

(define (my-filter proc items)
  (if (null? items)
      nil
      (if (proc (car items))
          (cons (car items) (my-filter proc (cdr items)))
          (filter proc (cdr items)))))