--Найдите все названия пицц (и соответствующие названия пиццерий из таблицы menu), 
--которые заказывали Денис или Анна.
--Отсортируй результат по обеим колонкам.
--Пример вывода данных представлен ниже.

select m.pizza_name, pi.name as pizzeria_name
from menu m join pizzeria pi on pi.id = m.pizzeria_id 
join person_order po on m.id = po.menu_id 
join person pe on po.person_id = pe.id 
where pe.name like 'Denis' or pe.name like 'Anna'