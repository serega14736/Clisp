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
(setq stack `(1 2 3 4 5 6))

(print (top stack))
(print (top stack))
(print (top stack))
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

;;; 4. Определите в виде макроса форму (FIF тест отр нуль полож).

(defmacro FIF (test a b p)
  `(cond
     ((< ,test 0) ,a)
     ((= ,test 0) ,b)
     (t ,p)))


;;; Test 1
(write-line "Задача 4 Test 1")
(princ " >> 1 '- '= '+")
(print (FIF 1 '- '= '+))
(write-line "")
(write-line "")

;;; Test 2
(write-line "Задача 4 Test 2")
(princ " >> -2 '- '= '+")
(print (FIF -2 '- '= '+))
(write-line "")
(write-line "")

;;; Test 3
(write-line "Задача 4 Test 2")
(princ " >> 0 '- '= '+")
(print (FIF 0 '- '= '+))
(write-line "")
(write-line "")

;;; 5. Определите в виде макроса форму (REPEAT e UNTIL p) паскалевского типа.
(defmacro repeat (a until b)
    `(if ,b nil
        (and (print ,a) (repeat ,a until ,b))
    )
)
 
(let ((i 0)) (repeat  (incf i) until (>= i 5)))
