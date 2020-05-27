--2. Определите функци, функцию, заменяющую в исходном списке все вхождения заданного значения другим.

a list from to = map 
    (\b -> if b == from
    then to else b) list
   
main = do

print $ a [1,2,3,4,1] 1 3
-- [3,2,3,4,3]

-- 13. Реализовать на языке Haskell функцию, которая, чередуя элементы списков [a, b, ...] и [1, 2, ...], образует новыи? список [a, 1, b, 2, ...].
mergelst [] x = if x == [] then x else mergelst x []
mergelst (x:xs) y = x : mergelst y xs

main = do
print $ mergelst ["1", "2", "3"] ["a", "b", "c"]
print $ mergelst ["1", "2", "3"] ["a"]
