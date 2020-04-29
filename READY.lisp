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



