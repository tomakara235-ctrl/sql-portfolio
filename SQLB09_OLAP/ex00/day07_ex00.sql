-- Задание 00 — Simple aggregated information
-- person_id и count_of_visits (кол-во посещений любых пиццерий)
-- ORDER BY count_of_visits DESC, person_id ASC

SELECT person_id, COUNT(*) AS count_of_visits
FROM person_visits
GROUP BY person_id
ORDER BY 2 DESC, 1 ASC