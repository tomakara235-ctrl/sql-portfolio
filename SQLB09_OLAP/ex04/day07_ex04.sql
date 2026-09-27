-- Задание 04 — Clause for groups
-- name и count_of_visits, только если count_of_visits > 3
-- ЗАПРЕЩЕНО: WHERE -> использовать HAVING

select p.name, COUNT(*) count_of_visits
from  person_visits pv
join person p  on pv.person_id = p.id 
group by p.name 
having count(*)>3;
