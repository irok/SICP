(define Q1 (list 1 3 (list 5 7) 9))
(define Q2 (list (list 7)))
(define Q3 (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))

Q1
Q2
Q3

(car (cdr (car (cdr (cdr Q1)))))
(car (car Q2))
(car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr Q3))))))))))))
