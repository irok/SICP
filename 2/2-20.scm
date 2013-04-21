(define (same-parity first . rest)
  (define parity (remainder first 2))
  (let iter ((result (list first)) (items rest))
    (if (null? items)
        result
        (iter
         (if (= (remainder (car items) 2) parity)
             (append result (list (car items)))
             result)
         (cdr items)))))

            