-- Задание 06: Создать материализованное представление
-- Найти пиццерию, где Дмитрий был 8 января 2022 года
-- и мог съесть пиццу дешевле 800 рублей

CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT pz.name AS pizzeria_name
FROM person_visits pv
JOIN pizzeria pz ON pz.id = pv.pizzeria_id
JOIN person p ON p.id = pv.person_id
JOIN menu m ON m.pizzeria_id = pv.pizzeria_id
WHERE p.name = 'Dmitriy'
    AND pv.visit_date = '2022-01-08'
    AND m.price < 800;

--SELECT * FROM mv_dmitriy_visits_and_eats;