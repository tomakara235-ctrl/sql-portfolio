-- Session #1 step 1
BEGIN;

-- Session #1 step 2
UPDATE pizzeria SET rating = 5 WHERE id = 1;

-- Session #2 step 1
BEGIN;

-- Session #2 step 2
UPDATE pizzeria SET rating = 5 WHERE id = 2;

-- Session #1 step 3
-- пытается захватить строку id=2, которую уже держит Session #2 — ожидание
UPDATE pizzeria SET rating = 4 WHERE id = 2;

-- Session #2 step 3
-- пытается захватить строку id=1, которую уже держит Session #1 — замкнутый круг ожидания,
-- PostgreSQL обнаруживает deadlock и прерывает эту транзакцию с ошибкой
UPDATE pizzeria SET rating = 4 WHERE id = 1;
-- ERROR: deadlock detected
-- DETAIL: Process ... waits for ShareLock on transaction ...; blocked by process ...

-- после ошибки в Session #2 её первый UPDATE (id=2) освобождается,
-- и второй UPDATE Session #1 (шаг 3, id=2) успешно завершается

-- Session #1 step 4
COMMIT;

-- Session #2 step 4
-- транзакция уже в состоянии ошибки, COMMIT автоматически становится ROLLBACK
COMMIT;
