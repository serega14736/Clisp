;;; 1. Определите макрос, который возвращает свой вызов.

(defmacro self () ''(self))

(print (self))

;;; 2.Определите функицонал (MAPLIST fn список) для одного списочного аргумента
(defmacro top(s)
    `(prog1
        (setq top (car ,s))
        (setq ,s (cdr ,s))
    )
)


;;; Test 1
(write-line "Задача 2 Test 1")
(setq stack `(1 2 3))

(print (top stack))
(print (top stack))
(print (top stack))
(print (top stack))

(write-line "")
(write-line "")

;;; 3. Определите лисповскую форму (IF условие p q) в виде макроса.

(defmacro iff (cond a b)
    `(if ,cond ,a ,b))

;;; Test 1
(write-line "Задача 3 Test 1")
(princ " >> (= 3 11) 'equal 'notEqual")
(print (iff (= 3 11) 'equal 'notEqual))
(write-line "")

;;; Test 2
(write-line "Задача 3 Test 2")
(princ " >> (= 1 1) 'equal 'notEqual")
(print (iff (= 1 1) 'equal 'notEqual))

(write-line "")
(write-line "")
