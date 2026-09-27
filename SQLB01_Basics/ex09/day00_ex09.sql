--Составь запрос SELECT, который вернет имена людей 
--и названия пиццерий на основе таблицы person_visits 
--с датами посещений в период с 7 по 9 января 2022 года (включительно), 
--используя внутренний запрос в части FROM.
--Обрати внимание на структуру итогового запроса:
--SELECT (...) AS person_name ,  -- внутренний запрос в основном SELECT
  --      (...) AS pizzeria_name  -- внутренний запрос в основном SELECT
--FROM (SELECT … FROM person_visits WHERE …) AS pv -- внутренний запрос в основном FROM
--ORDER BY ...
--Добавь сортировку по имени человека в порядке возрастания 
--и по названию пиццерии в порядке убывания.


SELECT 
    (SELECT name FROM person WHERE person.id = pv.person_id) AS person_name,
    (SELECT name FROM pizzeria WHERE pizzeria.id = pv.pizzeria_id) AS pizzeria_name
FROM (SELECT * FROM person_visits WHERE visit_date BETWEEN '2022-01-07' AND '2022-01-09') AS pv
ORDER BY person_name ASC, pizzeria_name DESC;