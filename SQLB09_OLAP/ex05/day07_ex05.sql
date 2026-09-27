-- Задание 05 — Person's uniqueness
-- Уникальные имена людей, сделавших хотя бы 1 заказ
-- ЗАПРЕЩЕНО: GROUP BY, UNION/множества -> использовать DISTINCT + JOIN
-- ORDER BY name

SELECT DISTINCT p.name FROM person p 
JOIN person_order po ON po.person_id = p.id  
ORDER BY p.name;
