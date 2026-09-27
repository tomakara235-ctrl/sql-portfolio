select pizza_name, p.name as pizzeria_name, price  from menu m
join pizzeria p on p.id = m.pizzeria_id 
 where m.pizza_name LIKE '%pepperoni%'
    OR m.pizza_name LIKE '%mushroom%'
ORDER BY
    pizza_name,
    pizzeria_name;