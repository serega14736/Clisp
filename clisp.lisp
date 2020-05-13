;;; ———————————————————————————————————————————————————— Зачтены —————————————————————————————————————————————————————————————

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


;;; 45 Задача
;;; Определить расстояние между двумя точками. У символа (названия города) определены свойства x и y,
;;; необходимо вычислить расстояние между двумя городами.
;;; struct city {
;;;   float x, y;
;;; }
;;; length_city (city, city) -> float

(defun length_city (city-a city-b)
    (sqrt (+
        (expt
            (- (get city-a 'x) (get city-b 'x))
        2)
        (expt
            (- (get city-a 'y) (get city-b 'y))
        2)
    ))
)
(defun distance-city (name x y)
        (setf (get name 'x) x)
        (setf (get name 'y) y)
)


;;; Test 1
(write-line "Задача 45 Test 1")
(princ ">> {0, 5} {7, 0}")
(distance-city 'city1 0 5)
(distance-city 'city2 7 0)
(print (length_city 'city1 'city2))
(write-line "")
(write-line "")

;;; Test 2
(write-line "Задача 45 Test 2")
(princ ">> {32, 19} {58, 26}")
(distance-city 'city1 32 19)
(distance-city 'city2 58 26)
(print (length_city 'city1 'city2))
(write-line "")
(write-line "")


;;; 15 Задача
;;; Определите функцию, вычисляющую скалярное произведение векторов, заданных списками целых чисел.
;;; (4 2 3) (7 3 7) -> 55

(defun scalar(v1 v2)
      (cond
          ((null v1) 0)
          (t (+ (* (car v1) (car v2)) (scalar(cdr v1) (cdr v2))))
       )
)

;;; Test 1
(write-line "Задача 15 Test 1")
(princ " >> (4 2 3) (7 3 7)")
(print(scalar '(4 2 3) '(7 3 7)))
(write-line "")
(write-line "")

;;; Test 2
(write-line "Задача 15 Test 2")
(princ " >> (0 1 2) (1 1 1)")
(print(scalar '(0 1 2) '(1 1 1)))
(write-line "")
(write-line "")



;;; 19 Задача
;;; Определите функцию (ЛУКОВИЦА n), строящую N-уровневый вложенный список, элементом которого на самом глубоком уровне является N.
;;; 5 -> (((((5)))))

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
(write-line "")


;;; Test 2
(write-line "Задача 19 Test 2")
(princ " >> 0")
(print (lis '0))
(write-line "")
(write-line "")


;;; 18 Задача
;;; Определите предикат, проверяющий, является ли аргумент одноуровневым списком.
;;;  ((3)) -> "список не одноуровневый"

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
(write-line "")

;;; Test 2
(write-line "Задача 18 Test 2")
(princ " >> (1 2 3) ")
(print(spisok '(1 2 3)))
(write-line "")
(write-line "")


;;; 9 Задача
;;; Определите функцию, разделяющую исходный список на два подсписка. 
;;; В первый из них должны попасть элементы с нечетными номерами, 
;;; во второй — элементы с четными номерами.
;;; (1 2 3) -> ((1 3) (2))

(defun sub-lists(lst)
      (cond
         ((null lst) '(() ()))
         ( (evenp (car lst)) (cons (car (sub-lists(cdr lst))) (cons (cons (car lst)   (cadr (sub-lists(cdr lst))))())))
         (t(cons (cons (car lst) (car (sub-lists(cdr lst))))   (cdr (sub-lists(cdr lst)))))
       )
)
;;; Test 1
(write-line "Задача 9 Test 1")
(princ " >> (1 2 3) ")
(print(sub-lists`(1 2 3)))
(write-line "")
(write-line "")


;;; Test 2
(write-line "Задача 9 Test 1")
(princ " >> (1 2 3 4 5 6 7 8) ")
(print(sub-lists`(1 2 3 4 5 6 7 8)))
(write-line "")
(write-line "")

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


----------------------------------------------------- 2 БЛОК ------------------------------------------------------------------
;;; 4 Задача
;;; Определите функциональный предикат (КАЖДЫй пред список), 
;;; который истинен в том и только в том случае, когда, 
;;; являющейся функциональным аргументом предикат пред истинен 
;;; для всех элементов списка список.

(defun prov(lst)
(null
(mapcan
(lambda (x)
(if (funcall #'numberp x) nil (list t))
)lst
)
)
)

;;; Test 1
(write-line "Задача 4 Test 1")
(princ " >> (1 2 a)")
(print (prov '(1 2 a)))
(write-line "")
(write-line "")

;;; Test 2
(write-line "Задача 4 Test 2")
(princ " >> (1 2 2)")
(print (prov '(1 2 2)))
(write-line "")
(write-line "")


;;; 6 Задача
;;; Определите фильтр (УДАЛйЬ-ЕСЛИ пред список), удаляющий из списка список
;;; все элементы, которые обладают свойством, наличие которого проверяет предикат пред.

(defun del (lst)
(mapcan (lambda(x)
(if (funcall 'numberp x) nil (list x))) lst)
)

;;; Test 1
(write-line "Задача 6 Test 1")
(princ " >> ( 1 3 4 a)")
(print(del '( 1 3 4 a)))
(write-line "")
(write-line "")

;;; Test 2
(write-line "Задача 6 Test 2")
(princ " >> ( 1 3 4 1 4 10 b)")
(print(del '( 1 3 4 1 4 10 b)))
(write-line "")
(write-line "")

;;; 8 Задача
;;; Напишите генератор натуральных чисел: 0, 1, 2, 3, 4, 5, ...

(defun generator ()
(let
((numb -1))
(lambda () (setq numb (+ numb 1)))
)
)
(setq c1 (generator))

(defun self (&rest rest)
(append '(self) rest)
)

;;; Test 1
(write-line "Задача 8 Test 1")
(princ " >> (funcall c1)")
(print (funcall c1))
(print (funcall c1))
(print (funcall c1))
(print (funcall c1))
(print (funcall c1))
(print (funcall c1))
(write-line "")
(write-line "")

;;; 14 Задача
;;; Определите функцию, которая возвращает в 
;;; качестве значения форму своего определения (DEFUN).

(defun progg (&rest rest)
'(defun progg (&rest rest))
)

;;; Test 1
(write-line "Задача 14 Test 1")
(princ " >> (progg 'a 'b)")
(print (progg 'a 'b))
(write-line "")
(write-line "")

