--2. Определите функци, функцию, заменяющую в исходном списке все вхождения заданного значения другим.

a list from to = map 
    (\b -> if b == from
    then to else b) list
   
main = do

print $ a [1,2,3,4,1] 1 3
-- [3,2,3,4,3]

-- 13. Реализовать на языке Haskell функцию, которая, чередуя элементы списков [a, b, ...] 
-- и [1, 2, ...], образует новыи? список [a, 1, b, 2, ...].
list [] x = if x == [] then x else list x []
list (x:xs) y = x : list y xs

main = do
print $ list ["1", "2", "3"] ["a", "b", "c"]
print $ list ["4", "1", "2"] ["x"]
--["1","a","2","b","3","c"]
--["4","x","1","2"]
