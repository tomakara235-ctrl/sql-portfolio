--Найди объединение пиццерий, в которые заказы делали исключительно женщины, 
--и тех, в которые заказы делали исключительно мужчины. 
--Другими словами, определи множества пиццерий, 
--заказанных только женщинами и только мужчинами, 
--и выполни операцию UNION над этими множествами. 
--Обрати внимание, что слово «только» применяется строго к каждой гендерной группе. 
--При использовании операторов множеств (UNION, EXCEPT, INTERSECT) не включай дубликаты.
--Результат должен быть отсортирован по названию пиццерии.



SELECT DISTINCT pz.name AS pizzeria_name
FROM person_order po
JOIN menu m ON po.menu_id = m.id
JOIN pizzeria pz ON m.pizzeria_id = pz.id
JOIN person pe ON po.person_id = pe.id
WHERE pe.gender = 'female'
  AND NOT EXISTS (
    SELECT 1
    FROM person_order po2
    JOIN menu m2 ON po2.menu_id = m2.id
    JOIN person pe2 ON po2.person_id = pe2.id
    WHERE m2.pizzeria_id = pz.id
      AND pe2.gender = 'male'
  )

UNION

SELECT DISTINCT pz.name
FROM person_order po
JOIN menu m ON po.menu_id = m.id
JOIN pizzeria pz ON m.pizzeria_id = pz.id
JOIN person pe ON po.person_id = pe.id
WHERE pe.gender = 'male'
  AND NOT EXISTS (
    SELECT 1
    FROM person_order po2
    JOIN menu m2 ON po2.menu_id = m2.id
    JOIN person pe2 ON po2.person_id = pe2.id
    WHERE m2.pizzeria_id = pz.id
      AND pe2.gender = 'female'
  )

ORDER BY pizzeria_name;