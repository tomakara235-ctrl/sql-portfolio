--Напиши SQL-запрос, который:
--Возвращает уникальные названия пицц из таблицы menu
--Сортирует результаты по столбцу pizza_name в порядке убывания
--Перед началом работы обязательно ознакомься с разделом «Запрещено».

SELECT pizza_name FROM menu
union 
SELECT pizza_name FROM menu
ORDER BY pizza_name DESC;