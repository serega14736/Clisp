;;; Задача 22
;;; Определите функцию, которая обращает список (а b с) и разбивает его на уровни (((с) b) а).
;;; (((с) b) а)

(defun more-scopes(lst)
    ((lambda (f k)
        (cond
            ((null k) lst)
            (T (list (more-scopes k) f))
        )
    ) (car lst) (cdr lst))
)

;;; Test 1
(write-line "Задача 22 Test 1")
(princ " >> (а b с) ")
(print(more-scopes '(а b с)))
(write-line "")
(write-line "")

;;; Test 2
(write-line "Задача 22 Test 2")
(princ " >> ( 1 2  3 4 5 6  7 8 9 ) ")
(print(more-scopes '( 1 2  3 4 5 6  7 8 9 )))
(write-line "")
(write-line "")

