--Найди имена всех женщин, которые заказывали и пепперони, и сырную пиццу 
--(в любое время и в любых пиццериях).
--Отсортируй результат по именам в алфавитном порядке.


SELECT DISTINCT pe.name
FROM person pe
JOIN person_order po1 ON po1.person_id = pe.id
JOIN menu m1 ON m1.id = po1.menu_id AND m1.pizza_name LIKE '%pepperoni%'
JOIN person_order po2 ON po2.person_id = pe.id
JOIN menu m2 ON m2.id = po2.menu_id AND m2.pizza_name LIKE '%cheese%'
WHERE pe.gender = 'female'
ORDER BY pe.name;