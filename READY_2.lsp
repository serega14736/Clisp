;;; 2 Определите функицонал (MAPLIST fn список) для одного списочного аргумента

(defun maplist1 (fn lst)
          (cond 
             ((null fn) nil)
             ((null lst) nil)
            
             (t(cons (funcall fn lst)   (maplist1 fn (cdr lst))))    ;->((3 2 1) (3 2) (3)) 
            ;(t(append (funcall fn lst) (maplist fn (cdr lst))))    ;->(3 2 1 3 2 3)
          )
)


;;; Test 1
(write-line "Задача 2 Test 1")
(princ ">> (1 2 3)")
(print (maplist1 'REVERSE '(1 2 3)))
(write-line "")
(write-line "")

;;; Test 2
(write-line "Задача 2 Test 2")
(princ ">> (1 2 3 4 5)")
(print (maplist1 'REVERSE '((1 2 3 4 5)))
(write-line "")
(write-line "")

;;; 10 Напишите генератор, порождающий последовательность (A), (B A), (A B A), (B A B A)

(defun generator ()
     (let ( (x 'A) (y 'B) (z ()))
         (lambda () (if (equal x (car z))
                    (setq z (cons y z))
                    (setq z (cons x z))   
                       ))
     )
 )
(setq c1 (generator))

;;; Test 1
(write-line "Задача 10 Test 1")

(print (funcall c1))
(print (funcall c1))
(print (funcall c1))
(print (funcall c1))
(print (funcall c1))
(print (funcall c1))
(print (funcall c1))
(print (funcall c1))
(print (funcall c1))
(print (funcall c1))

(write-line "")
(write-line "")
