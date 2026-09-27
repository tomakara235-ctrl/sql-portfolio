--Используй SQL-запрос из Задания 01 и выведи названия пицц из пиццерии, 
--которые никто не заказывал, включая соответствующие цены.
--Результат должен быть отсортирован по названию пиццы и цене.

SELECT m.pizza_name, m.price, pi.name as pizzeria_name
FROM menu m 
join pizzeria pi on pi.id = m.pizzeria_id 
WHERE m.id NOT IN (SELECT menu_id FROM person_order WHERE menu_id IS NOT NULL)
ORDER BY m.pizza_name, m.price;