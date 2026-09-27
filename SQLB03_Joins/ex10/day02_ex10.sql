--Найди имена людей, проживающих по одному адресу (в одном городе).
--Результат должен быть отсортирован в три колонки: 
--по имени первого человека, имени второго человека и общему адресу.

SELECT 
	p1.name AS person_name1,
	p2.name AS person_name2,
	p1.address AS common_addres
FROM person AS p1 INNER JOIN person AS p2
	on p1.address = p2.address
WHERE p1.id > p2.id
ORDER BY p1.name, p2.name, p1.address;