--Напиши SQL-запрос, который возвращает список:
--названия пицц,
--цены на пиццы,
--названия пиццерий,
--даты посещений
--для клиента Kate с ценами в диапазоне от 800 до 1000 рублей.
--Упорядочить результаты по названию пиццы, цене и названию пиццерии.

select m.pizza_name, m.price, pz.name as pizzeria_name,	pv.visit_date
from menu m join person_visits pv  using (pizzeria_id)
join pizzeria pz on pv.pizzeria_id = pz.id
join person pe on pv.person_id = pe.id
WHERE pe.name = 'Kate' 
  AND m.price BETWEEN 800 AND 1000
ORDER BY m.pizza_name, m.price, pz.name;