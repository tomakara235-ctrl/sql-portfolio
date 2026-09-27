-- Задание 09 - Explicit type transformation
-- Для каждого address: formula = max(age) - (min(age)/max(age)), average = avg(age)
-- comparison = (formula > average) -> true/false
-- ORDER BY address

select address, round(max(age) - (min(age)/max(age::numeric)), 2) as formula, round(avg(age),2) as average, 
case when round(max(age) - (min(age)/max(age::numeric)), 2) > round(avg(age),2) then true 
else false  end as comparison
from person
group by address 
order by 1;