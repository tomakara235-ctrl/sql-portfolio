select distinct person_id from person_visits 
where (visit_date BETWEEN '2022-01-06' AND '2022-01-09') or pizzeria_id=2
ORDER BY person_id DESC;
