WITH t1 AS (
    SELECT generate_series::DATE AS missing_date
    FROM generate_series('2022-01-01'::DATE, '2022-01-10'::DATE, '1 day')
)
SELECT missing_date
FROM t1
left join person_visits pv
    on t1.missing_date= pv.visit_date  and (person_id = 1 or  person_id = 2)
    WHERE pv.visit_date IS NULL
ORDER BY missing_date;