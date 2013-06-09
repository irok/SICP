(define nil '())

(define (deep-reverse items)
  (define (iter src result)
    (cond ((null? src) result)
          ((not (pair? src)) src)
          (else
           (iter (cdr src)
                 (cons (deep-reverse (car src)) result)))))
  (iter items nil))

(define x (list (list 1 2) (list 3 4)))
x
(reverse x)
(deep-reverse x)
