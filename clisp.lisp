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
; Определите функцию (ЛУКОВИЦА n), строящую N-уровневый вложенный список, элементом которого на самом глубоком уровне является N.
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

;18 
;Определите предикат, проверяющий, является ли аргумент одноуровневым списком.
; ((3)) -> "список не одноуровневый"

(defun spisok(lst)
      (cond
         ((null lst) "список одноуровневый")
          ((atom (car lst))(spisok(cdr lst)))
          ("список не одноуровневый")
       )
)

;;; Test 1
(write-line "Задача 18 Test 1")
(princ " >> ((3)) ")
(print(spisok '((3))))
(write-line "")

(write-line "Задача 18 Test 2")
(princ " >> '(1 2 3) ")
(print(spisok '(1 2 3)))
(write-line "")

;22
;Определите функцию, которая обращает список (а b с) и разбивает его на уровни (((с) b) а).
;( 1 2  3 4 5 6 7 8  9 ) -> (((((((((9) 8) 7) 6) 5) 4) 3) 2) 1) 
(defun func-level(lst)
      (cond
         ((null(cdr  lst)) (cons (car lst) ()))
          ((list (func-level (cdr lst)) (car lst) ))
       )
)

;;; Test 1
(write-line "Задача 22 Test 1")
(princ " >> '( 1 2  3 4 5 6  7 8  9 ) ")
(print(func-level '( 1 2  3 4 5 6  7 8  9 )))
(write-line "")
