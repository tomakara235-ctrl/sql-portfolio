-- Задание 07 — Average global rating
-- Общий средний рейтинг всех ресторанов как global_rating
-- ROUND(..., 4)

select ROUND(AVG(rating), 4) as global_rating from pizzeria;