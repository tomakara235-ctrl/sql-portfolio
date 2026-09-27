--Напиши SQL-запрос, который:
--Находит пересечение данных по:
--Дате заказа (order_date) и ID человека (person_id) из таблицы person_order
--Дате визита (visit_date) и ID человека (person_id) из таблицы person_visits
--См. пример ниже. Проще говоря, тебе нужно найти идентификаторы людей, 
--которые в один и тот же день и посетили заведение, и сделали заказ пиццы.
--При этом результат следует отсортировать сначала по дате действия (action_date) 
--в порядке возрастания, а затем по person_id — в порядке убывания.

SELECT order_date AS action_date, person_id FROM person_order
INTERSECT
SELECT visit_date, person_id FROM person_visits;