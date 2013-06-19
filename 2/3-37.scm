(define nil '())
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

; dot product
(define (dot-product v w)
  (accumulate + 0 (map * v w)))

; matrix * vector
(define (matrix-*-vector m v)
  (map (lambda (w) (dot-product v w)) m))

; transpose
(define (transpose mat)
  (accumulate-n cons nil mat))

; matrix * matrix
(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (v) (matrix-*-vector cols v)) m)))

; data
(define vec1 (list 1 4 2))
(define vec2 (list 3 2 5))
(define mat1 (list (list 1 2 3) (list 4 5 6) (list 3 2 1)))
(define mat2 (list (list 5 1 2) (list 3 3 1) (list 1 2 1)))

(dot-product vec1 vec2)
; 21

(matrix-*-vector mat1 vec1)
; (15 36 13)

(transpose mat2)
; ((5 3 1) (1 3 2) (2 1 1))

(matrix-*-matrix mat1 mat2)
; ((14 13 7) (41 31 19) (22 11 9))