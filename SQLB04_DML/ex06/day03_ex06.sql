--Найди совпадающие названия пицц с одинаковой ценой, но из разных пиццерий. 
--Результат должен быть отсортирован по названию пиццы.
--Ниже приведен пример данных.
--Убедись, что имена столбцов совпадают с приведенными в примере.

select m1.pizza_name, pz1.name as pizzeria_name_1, pz2.name as pizzeria_name_2, m1.price
from menu m1 join pizzeria  pz1 on pz1.id = m1.pizzeria_id 
join menu m2 ON m1.pizza_name = m2.pizza_name 
              AND m1.price = m2.price 
              AND m1.pizzeria_id < m2.pizzeria_id
JOIN pizzeria pz2 ON m2.pizzeria_id = pz2.id
ORDER BY m1.pizza_name;