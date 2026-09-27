--Зафиксируй новые посещения ресторана Domino's Денисом и Ириной 24 февраля 2022 года.
--Внимание: выполнение этого задания может привести к некорректному изменению данных. 
--Ты можешь восстановить исходную структуру базы данных
--с данными - файл лежит в папке Materials и повторно выполнить скрипты из заданий 07, 08.


INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES 
(
    (SELECT MAX(id) + 1 FROM person_visits),
    (SELECT id FROM person WHERE name = 'Denis'),
    (SELECT id FROM pizzeria WHERE name = 'Dominos'),
    '2022-02-24'
),
(
    (SELECT MAX(id) + 1 FROM person_visits) + 1,
    (SELECT id FROM person WHERE name = 'Irina'),
    (SELECT id FROM pizzeria WHERE name = 'Dominos'),
    '2022-02-24'
);

