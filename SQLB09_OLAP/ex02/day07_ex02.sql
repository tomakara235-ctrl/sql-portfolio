-- Задание 02 — Restaurants statistics
-- Топ-3 пиццерии по visits + топ-3 по orders, объединить (UNION)
-- Добавить столбец action_type ('order' / 'visit')
-- ORDER BY action_type ASC, count DESC


(SELECT pz.name, COUNT(*) as count, 'visit' AS action_type
 FROM person_visits AS pv
          JOIN pizzeria AS pz ON pz.id = pv.pizzeria_id
 GROUP BY pz.name
 ORDER BY 2 DESC
 LIMIT 3)
UNION
(SELECT pz.name, COUNT(*) as count, 'order' AS action_type
 FROM person_order AS po
          JOIN menu AS m ON m.id = po.menu_id
          JOIN pizzeria AS pz ON pz.id = m.pizzeria_id
 GROUP BY pz.name
 ORDER BY 2 DESC
 LIMIT 3)
ORDER BY action_type ASC, count desc;