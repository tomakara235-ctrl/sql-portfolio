--Найди имена всех мужчин из Москвы или Самары, 
--которые заказывали пиццу с пепперони, грибами или оба вида сразу.
--Отсортируй результат по именам в обратном алфавитном порядке.
--Пример ожидаемого результата приведен ниже.

select distinct pe.name from person pe
join person_order po on po.person_id = pe.id 
join menu m on m.id = po.menu_id 
where (pe.address = 'Moscow'or pe.address = 'Samara') and (m.pizza_name LIKE '%pepperoni%'
    OR m.pizza_name LIKE '%mushroom%') and pe.gender = 'male'
order by pe.name desc;