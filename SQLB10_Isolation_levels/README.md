# SQLB10 — Уровни изоляции транзакций

**Темы:** аномалии параллельных транзакций в двух сессиях psql: lost update, non-repeatable read, phantom read и deadlock при READ COMMITTED, REPEATABLE READ и SERIALIZABLE. Скриншоты сессий приложены.

PostgreSQL. Учебная база: пиццерии, посетители, меню и заказы (схема — в [SQLB01](../SQLB01_Basics/model.sql)).

## Решения

- [ex00/day08_ex00.sql](ex00/day08_ex00.sql)
![ex00/day08_ex00_session1.png](ex00/day08_ex00_session1.png)
![ex00/day08_ex00_session2.png](ex00/day08_ex00_session2.png)
- [ex01/day08_ex01.sql](ex01/day08_ex01.sql)
![ex01/day08_ex01_sessions.png](ex01/day08_ex01_sessions.png)
- [ex02/day08_ex02.sql](ex02/day08_ex02.sql)
![ex02/day08_ex02_sessions.png](ex02/day08_ex02_sessions.png)
- [ex03/day08_ex03.sql](ex03/day08_ex03.sql)
![ex03/day08_ex03_sessions.png](ex03/day08_ex03_sessions.png)
- [ex04/day08_ex04.sql](ex04/day08_ex04.sql)
![ex04/day08_ex04_sessions.png](ex04/day08_ex04_sessions.png)
- [ex05/day08_ex05.sql](ex05/day08_ex05.sql)
![ex05/day08_ex05_sessions.png](ex05/day08_ex05_sessions.png)
- [ex06/day08_ex06.sql](ex06/day08_ex06.sql)
![ex06/day08_ex06_sessions.png](ex06/day08_ex06_sessions.png)
- [ex07/day08_ex07.sql](ex07/day08_ex07.sql)
![ex07/day08_ex07_sessions.png](ex07/day08_ex07_sessions.png)

---
[← Ко всем проектам](../README.md)
