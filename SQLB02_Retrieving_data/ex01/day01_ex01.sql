--Измени SQL-запрос из "Задания 00" следующим образом:
--Удали столбец object_id
--Измени порядок сортировки: сначала выведи данные из таблицы person (по object_name), 
--затем из таблицы menu (также по object_name) - как показано в примере ниже
--Сохрани дублирующиеся строки.

SELECT name AS object_name
FROM person
UNION ALL
SELECT pizza_name
FROM menu
ORDER BY object_name;