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

(write-line "Задача 15 Test 1")
(princ " >> '(4 2 3) '(7 3 7)")
(print(scalar '(4 2 3) '(7 3 7)))
(write-line "")

;;; Test 2

(write-line "Задача 15 Test 2")
(princ " >> '(0 1 2) '(1 1 1)")
(print(scalar '(0 1 2) '(1 1 1)))
(write-line "")

; 19
; Определите функцию (ЛУКОВИЦА n), 
; строящую N-уровневый вложенный список, 
;элементом которого на самом глубоком уровне является N.
; 5 -> (((((5)))))

(defun lis(n)
   (t_lis n n)
)
(defun t_lis(n k)
    (cond
        ((eq k 0) n)
        (t ( cons (t_lis n (- k 1)) nil))
     ))
;;; Test 1
(write-line "Задача 19 Test 1")
(princ " >> 5 ")
(print (lis '5))
(write-line "")

;;; Test 2
(write-line "Задача 19 Test 2")
(princ " >> 0")
(print (lis '0))
(write-line "")
