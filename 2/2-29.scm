(define nil '())

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

; a
(define (left-branch mobile)
  (car mobile))
(define (right-branch mobile)
  (car (cdr mobile)))
(define (branch-length branch)
  (car branch))
(define (branch-structure branch)
  (car (cdr branch)))

; b
(define (total-weight mobile)
  (if (number? mobile)
      mobile
      (+ (total-weight (branch-structure (left-branch mobile)))
         (total-weight (branch-structure (right-branch mobile))))))

; c
(define (balanced? mobile)
  (if (number? mobile)
      #t
      (let ((LB (left-branch mobile))
            (RB (right-branch mobile)))
        (and (= (branch-power LB)
                (branch-power RB))
             (balanced? (branch-structure LB))
             (balanced? (branch-structure RB))))))
(define (branch-power branch)
  (* (branch-length branch)
     (total-weight (branch-structure branch))))

; data
(define m1 (make-mobile
            (make-branch 1 2)
            (make-branch 3 (make-mobile
                            (make-branch 4 5)
                            (make-branch 6 7)))))
; (total-weight m1) -> 14
; (balanced? m1) -> #f

(define m2 (make-mobile
            (make-branch 1 (make-mobile
                            (make-branch 4 2)
                            (make-branch 2 4)))
            (make-branch 2 (make-mobile
                            (make-branch 2 1)
                            (make-branch 1 (make-mobile
                                            (make-branch 7 1)
                                            (make-branch 7 1)))))))
; (total-weight m2) -> 9
; (balanced? m2) -> #t