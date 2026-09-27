-- Задание 06 — Restaurant metrics
-- Для каждой пиццерии: count_of_orders, average_price (round 2), max_price, min_price
-- ORDER BY name

SELECT pz.name, 
COUNT(*) as count_of_orders, 
ROUND(AVG(m.price),2) as average_price, 
max(m.price) as max_price, 
min(m.price ) as min_price
FROM person_order AS po
         JOIN menu AS m ON m.id = po.menu_id
         JOIN pizzeria AS pz ON pz.id = m.pizzeria_id
GROUP BY pz.name
ORDER BY 1;
