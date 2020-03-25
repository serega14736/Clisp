## Clisp ##

## 15. Определите функцию, вычисляющую скалярное произведение векторов, заданных списками целых чисел. ##

```lisp
(defun scalar(v1 v2)
      (cond
          ((null v1) 0)
          (t (+ (* (car v1) (car v2)) (scalar(cdr v1) (cdr v2))))
       )
)
```
```lisp
(print(scalar '(4 2 3) '(7 3 7)))
55

(print(scalar '(0 1 2) '(1 1 1)))
3
```

## 18. Определите предикат, проверяющий, является ли аргумент одноуровневым списком. ##
```lisp
(defun spisok(lst)
      (cond
         ((null lst) "список одноуровневый")
          ((atom (car lst))(spisok(cdr lst)))
          ("список не одноуровневый")
       )
)
```

```lisp
(print(spisok '((3))))
"список не одноуровневый" 

(print(spisok '(1 (5) ((9)))))
"список не одноуровневый" 

(print(spisok '(1 2 3)))
"список одноуровневый" 
```

## 19. Определите функцию (ЛУКОВИЦА n), строящую N-уровневый вложенный список, элементом которого на самом глубоком уровне является N ##

``` lisp
(defun luc (n &optional (s n) ) 
    (cond 
        ((eq n 0) s)
        (t(luc (- n 1) (list s)))
    ) 
) 
```

```lisp
(print (luc 1))
(1) 

(print (luc 5))
(((((5))))) 

(print (luc 0))
0
```

## 22. Определите функцию, которая обращает список (а b с) и разбивает его на уровни (((с) b) а). ##

```lisp
(defun func-level(lst)
      (cond
         ((null(cdr  lst)) (cons (car lst) ()))
          ((list (func-level (cdr lst)) (car lst) ))
       )
)
```

```lisp
(print(func-level '( 1 2  3 4 5 6  7 8  9 )))
(((((((((9) 8) 7) 6) 5) 4) 3) 2) 1) 
```
## 9. Определите функцию, разделяющую исходный список на два подсписка. В первый из них должны попасть элементы с нечетными номерами, во второй — элементы с четными номерами. ##

```lisp 
(defun list-sublist(lst)
(cond
	((null (cdr lst)) (list lst))
	(t 
		((lambda (lst1)
		(list
			(cons (car lst) (car lst1))
			(cons (cadr lst) (cadr lst1))))
		(list-sublist (cddr lst)))
	)
)
)
```

```lisp 
(print(list-sublist`(1 2 3)))
((1 3) (2)) 

(print(list-sublist`(1 2 3 4 5 6 7 8)))
((1 3 5 7) (2 4 6 8)) 
```
