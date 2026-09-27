--Определи название пиццерии, которую Дмитрий посетил 8 января 2022 года, 
--где он мог заказать пиццу дешевле 800 рублей.

select pi.name from pizzeria pi 
join menu m on pi.id = m.pizzeria_id 
join person_visits pv on pv.pizzeria_id = pi.id 
join person pe on pe.id = pv.person_id 
where pe.name = 'Dmitriy' and pv.visit_date = '2022-01-08' and m.price < 800