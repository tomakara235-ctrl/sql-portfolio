-- Задание 08: Очистить базу данных
-- Удаляем все созданные в проекте Day 04 объекты

DROP VIEW IF EXISTS v_persons_female;
DROP VIEW IF EXISTS v_persons_male;
DROP VIEW IF EXISTS v_generated_dates;
DROP VIEW IF EXISTS v_symmetric_union;
DROP VIEW IF EXISTS v_price_with_discount;

DROP MATERIALIZED VIEW IF EXISTS mv_dmitriy_visits_and_eats;