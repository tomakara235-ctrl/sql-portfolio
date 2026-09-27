-- Задание 02: функциональный индекс по имени человека в верхнем регистре
CREATE INDEX idx_person_name
    ON person (UPPER(name));

-- Доказательство использования индекса
SET enable_seqscan = OFF;

EXPLAIN ANALYZE
SELECT *
FROM person
WHERE UPPER(name) = 'DENIS';

--SET enable_seqscan = ON;