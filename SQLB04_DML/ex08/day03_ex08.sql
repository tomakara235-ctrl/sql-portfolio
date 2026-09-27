--Добавьте новую пиццу с названием «sicilian pizza» 
--(с ID, рассчитанным как «максимальный существующий ID + 1») 
--по цене 900 рублей в ресторан «Dominos» 
--(используйте подзапрос для получения идентификатора пиццерии).


INSERT INTO menu (id, pizzeria_id, pizza_name, price)
VALUES ((SELECT MAX(id) + 1 FROM menu),
    (SELECT id FROM pizzeria WHERE name = 'Dominos'), 'sicilian pizza', 900);