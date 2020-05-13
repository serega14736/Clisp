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
