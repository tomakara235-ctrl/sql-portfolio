--Напиши SQL-запрос, который вернет список пиццерий, 
--которые посещал Андрей, но из которых он не делал заказов.
--Результат должен быть отсортирован по названию пиццерии.

select pz.name as pizzeria_name from pizzeria pz 
join person_visits pv on pv.pizzeria_id = pz.id 
join person pe on pe.id = pv.person_id 
join person_order po on po.person_id = pe.id 
where pe.name = 'Andrey' and  NOT EXISTS (
    SELECT 1
    FROM person_order po
    JOIN menu m ON po.menu_id = m.id
    WHERE po.person_id = pe.id
      AND m.pizzeria_id = pz.id
  )
  ORDER BY pizzeria_name;