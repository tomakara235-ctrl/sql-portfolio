--Найди имена всех женщин старше 25 лет и отсортируй результат по имени. 
--Пример вывода приведен ниже.

select name from person WHERE gender = 'female'
  AND age > 25
ORDER BY name;