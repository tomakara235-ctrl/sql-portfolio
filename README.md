# SQL — портфолио

Решения трека SQL Bootcamp в Школе 21 на PostgreSQL: от базовых запросов до индексов,
уровней изоляции транзакций, функций с триггерами и основ хранилищ данных.
Каждое упражнение — отдельный `.sql` файл.

**Навыки:** SELECT · JOIN · операции над множествами · CTE и рекурсивные запросы · DML ·
VIEW и MATERIALIZED VIEW · индексы и EXPLAIN ANALYZE · ограничения и последовательности ·
агрегация (GROUP BY, HAVING) · транзакции и уровни изоляции · PL/pgSQL, функции, триггеры

## Проекты

👥 — командный проект.

| № | Проект | Главное |
|---|---|---|
| 01 | [Основы SELECT](SQLB01_Basics) | фильтрация, сортировка, CASE, подзапросы |
| 02 | [Выборка из нескольких таблиц](SQLB02_Retrieving_data) | UNION / INTERSECT / EXCEPT, IN и EXISTS |
| 03 | [JOIN на практике](SQLB03_Joins) | LEFT и FULL JOIN, CTE, generate_series |
| 04 | [Изменение данных](SQLB04_DML) | INSERT и UPDATE с подзапросами |
| 05 | [Представления](SQLB05_Views) | VIEW, MATERIALIZED VIEW, REFRESH |
| 06 | [Задача коммивояжёра](SQLB06_Salesman_problem) 👥 | WITH RECURSIVE |
| 07 | [Индексы](SQLB07_Indexes) | составные, функциональные, уникальные индексы; EXPLAIN ANALYZE |
| 08 | [Развитие схемы БД](SQLB08_Schema_changes) | CHECK, SEQUENCE, COMMENT ON |
| 09 | [Агрегация и аналитика](SQLB09_OLAP) | GROUP BY, HAVING, FULL OUTER JOIN |
| 10 | [Уровни изоляции](SQLB10_Isolation_levels) | lost update, phantom read, deadlock — со скриншотами двух сессий |
| 11 | [Функции и триггеры](SQLB11_Functions_and_triggers) | PL/pgSQL, аудит через триггеры |
| 12 | [Основы DWH](SQLB12_DWH_currency) 👥 | пересчёт балансов по курсам валют |

Схема учебной базы — [model.sql](SQLB01_Basics/model.sql).

---

Портфолио по бизнес / системному анализу: [business-analyst-portfolio](https://github.com/tomakara235-ctrl/business-analyst-portfolio)
