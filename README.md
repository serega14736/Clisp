## Clisp ##

## 15. Определите функцию, вычисляющую скалярное произведение векторов, заданных списками целых чисел. ##

```lisp
(defun scalar(v1 v2)
      (cond
          ((null v1) 0)
          (t (+ (* (car v1) (car v2)) (scalar(cdr v1) (cdr v2))))
       )
)
(print(scalar '(4 2 3) '(7 3 7)))
55

(print(scalar '(0 1 2) '(1 1 1)))
3
```

## 19. Определите функцию (ЛУКОВИЦА n), строящую N-уровневый вложенный список, элементом которого на самом глубоком уровне является N ##

``` lisp
(defun luc (n &optional (s n) ) 
    (cond 
        ((eq n 0) s)
        (t(luc (- n 1) (list s)))
    ) 
) 

(print (luc 1))
(1) 

(print (luc 5))
(((((5))))) 

(print (luc 0))
0
```
