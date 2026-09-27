--Напиши SQL-запрос, который возвращает отсутствующие даты с 1 по 10 января 2022 года 
--(включительно) для посещений людьми с идентификаторами 1 и 2 — то есть дни, пропущенные обоими.
--Отсортируй результат по дате посещения в порядке возрастания.
--Изучи образец ожидаемого результата ниже.

SELECT
    generated_date::date AS missing_date
FROM
    generate_series(
        '2022-01-01'::date,
        '2022-01-10'::date,
        interval '1 day'
    ) AS generated_date
LEFT JOIN person_visits pv
    ON pv.visit_date = generated_date and (pv.person_id = 1 OR pv.person_id = 2)
WHERE
      pv.visit_date IS NULL
ORDER BY
    missing_date;