(define (split transform1 transform2)
  (define (new-split painter n)
    (if (= n 0)
        painter
        (let ((smaller (new-split painter (- n 1))))
          (transform1 painter (transform2 smaller smaller)))))
  new-split)
