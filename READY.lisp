;;; Задача 3 
;;; Определите функцию, заменяющую в исходном списке все вхождения заданного значения другим.
;;; (2 2 20 3 1 5 2 7 1 8) -> (1 1 10 3 1 5 1 7 1 8) 

(defun change (val Change list)
   (mapcar (lambda (arg)
    (cond ((eq Change arg) val) 
        (t arg))) list))

;;; Test 1
(write-line "Задача 3 Test 1")
(princ " >> (2 2 20 3 1 5 2 7 1 8) ")
(print(change 1 2 '(1 1 10 3 1 5 2 7 1 8)))    
(write-line "")
(write-line "")



