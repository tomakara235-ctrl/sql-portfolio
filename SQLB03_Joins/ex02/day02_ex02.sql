--Напишите SQL-запрос, который возвращает:
--Полный список имен людей, посетивших (или не посетивших) пиццерии 
--в период с 1 по 3 января 2022 года
--Полный список названий пиццерий, которые посещались (или не посещались) в этот же период
--Ниже приведен пример данных с указанием требуемых названий колонок.
--Для NULL-значений в колонках person_name и pizzeria_name используй замену на '-'. 
--Добавь сортировку по всем трем колонкам.
SELECT
    COALESCE(person.name, '-') AS person_name,
    person_visits.visit_date,
    COALESCE(pizzeria.name, '-') AS pizzeria_name
FROM person
FULL JOIN person_visits
    ON person.id = person_visits.person_id
FULL JOIN pizzeria
    ON pizzeria.id = person_visits.pizzeria_id
WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03'
   OR visit_date IS NULL
ORDER BY
    person_name,
    visit_date,
    pizzeria_name;