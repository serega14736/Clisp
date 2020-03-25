; 15
; Определите функцию, вычисляющую скалярное произведение векторов, заданных списками целых чисел.
; (4 2 3) (7 3 7) -> 55
(defun scalar(v1 v2)
      (cond
          ((null v1) 0)
          (t (+ (* (car v1) (car v2)) (scalar(cdr v1) (cdr v2))))
       )
)
;;; Test 1
(write-line "Test 1")
(princ " >> '(4 2 3) '(7 3 7)")
(print(scalar '(4 2 3) '(7 3 7)))
(write-line "")
