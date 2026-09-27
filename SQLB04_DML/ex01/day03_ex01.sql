--Найди все идентификаторы меню, которые никто не заказывал.
--Результат должен быть отсортирован по идентификатору.

SELECT id AS menu_id
FROM menu
WHERE id NOT IN (SELECT menu_id FROM person_order WHERE menu_id IS NOT NULL)
ORDER BY menu_id;

