-- Задание 01 — Let's see real names
-- То же, что ex00, но выводим name вместо person_id
-- Только топ-4 по количеству визитов, ORDER BY name

SELECT p.name, COUNT(*) AS count_of_visits
FROM person_visits AS pv
         JOIN person AS p ON p.id = pv.person_id
GROUP BY p.name
ORDER BY 2 DESC, 1 ASC
LIMIT 4;

