;;; Задача 3 
;;; Определите функцию, заменяющую в исходном списке все вхождения заданного значения другим.
;;; (1 1 10 3 1 5 2 7 1 8) -> (2 2 10 3 2 5 2 7 2 8) 

(defun rep (lst pattern replaceWith)
	(
    	(lambda(head tail)
    	
            (cond 
        		(
        			(null lst)
        			nil
        		)
        	    (
        	        (eq head pattern) 
        		    (cons replaceWith (rep tail pattern replaceWith))
        		)
    		    (t
    		        (cons head (rep tail pattern replaceWith))
    		    )
    		)
    	)
    	(car lst)(cdr lst)
	)
)

;;; Test 1
(write-line "Задача 3 Test 1")
(princ " >> (1 1 10 3 1 5 2 7 1 8) ")
(print (rep '(1 1 10 3 1 5 2 7 1 8) 1 '2))
(write-line "")
(write-line "")

;;; Test 2
(write-line "Задача 3 Test 2")
(princ " >> (12 1 31 1 1 18) ")
(print (rep '(12 1 31 1 1 18) 1 'a))
(write-line "")
(write-line "")

;;; Задача 30
;;; Запрограммируйте интерпретатор ВЫЧИСЛИ, который преобразует инфиксную запись 
;;; операций в префиксную и возвращает значение выражения.
;;; > ((-3 + 5) * 3) -> 6

(defun prefix (lst)
   (cond 
		((null lst) nil)
		((atom lst) lst)
		(t
			(list 
				(prefix (cadr lst))
				(prefix (car lst))
				(prefix (caddr lst))
			)
		)
	)
)

(defun calculate (lst)
	(eval (prefix lst))
)


;;; Test 1
(write-line "Задача 30 Test 1")
(princ " >> ((-3 + 5) * 3) ")
(print (calculate '((-3 + 5) * 3)))
(write-line "")
(write-line "")

;;; Test 2
(write-line "Задача 30 Test 2")
(princ " >> ((2 - 5 ) *  5 ) ")
(print (calculate '((2 - 5 ) *  5 )))
(write-line "")
(write-line "")

