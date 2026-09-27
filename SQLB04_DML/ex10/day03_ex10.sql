--Зарегистрируй новые заказы от Дениса и Ирины 24 февраля 2022 года 
--на новое блюдо меню — «sicilian pizza».
--Внимание: выполнение этого задания может привести к некорректному изменению данных. 
--Ты можешь восстановить исходную структуру базы данных
--с данными - файл лежит в папке Materials и повторно выполнить скрипты из заданий 07, 08, 09.

INSERT INTO person_order (id, person_id, menu_id, order_date)
VALUES 
(
    (SELECT MAX(id) + 1 FROM person_order),
    (SELECT id FROM person WHERE name = 'Denis'),
    (SELECT id FROM menu WHERE pizza_name = 'sicilian pizza'),
    '2022-02-24'
),
(
    (SELECT MAX(id) + 1 FROM person_order) + 1,
    (SELECT id FROM person WHERE name = 'Irina'),
    (SELECT id FROM menu WHERE pizza_name = 'sicilian pizza'),
    '2022-02-24'
);