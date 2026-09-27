--Напиши SQL-запрос, который вернет идентификаторы людей, 
--их имена и интервал по возрасту в виде нового вычисляемого столбца с именем interval_info, 
--согласно следующему псевдокоду:
--if (age >= 10 and age <= 20) - вернуть «interval #1»
--else if (age > 20 and age < 24) - вернуть «interval #2»
--во всех остальных случаях - вернуть «interval #3»
--И, конечно, отсортируй результат по столбцу interval_info в порядке возрастания.

SELECT 
    id, 
    name,
    CASE 
        WHEN age >= 10 AND age <= 20 THEN 'interval #1'
        WHEN age > 20 AND age < 24 THEN 'interval #2'
        ELSE 'interval #3'
    END AS interval_info
FROM person
ORDER BY interval_info;