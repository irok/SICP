; for list
(define (origin-frame f) (list-ref f 0))
(define (edge1-frame f) (list-ref f 1))
(define (edge2-frame f) (list-ref f 2))

; for cons
(define (origin-frame f) (car f))
(define (edge1-frame f) (car (cdr f)))
(define (edge2-frame f) (cdr (cdr f)))
