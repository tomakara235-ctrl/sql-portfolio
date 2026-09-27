--Зарегистрируй новые заказы "greek pizza" для всех клиентов 25 февраля 2022 года.
--Внимание: выполнение этого задания может привести к некорректному изменению данных. 
--Ты можешь восстановить исходную структуру базы данных
--с данными - файл лежит в папке Materials и 
--повторно выполнить скрипты из заданий 07, 08, 09, 10, 11.

INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT 
    (SELECT MAX(id) FROM person_order) + ROW_NUMBER() OVER (),
    p.id,
    (SELECT id FROM menu WHERE pizza_name = 'greek pizza'),
    '2022-02-25'
FROM person p;