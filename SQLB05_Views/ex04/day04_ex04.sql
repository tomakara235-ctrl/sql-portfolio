-- Задание 04: Создать представление с симметрической разностью
-- (R − S) ∪ (S − R), где R = 2022-01-02, S = 2022-01-06

CREATE VIEW v_symmetric_union AS
(
    SELECT person_id
    FROM person_visits
    WHERE visit_date = '2022-01-02'
    EXCEPT
    SELECT person_id
    FROM person_visits
    WHERE visit_date = '2022-01-06'
)
UNION
(
    SELECT person_id
    FROM person_visits
    WHERE visit_date = '2022-01-06'
    EXCEPT
    SELECT person_id
    FROM person_visits
    WHERE visit_date = '2022-01-02'
)
ORDER BY person_id;