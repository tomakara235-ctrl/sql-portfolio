
-- Session #1 step 1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- Session #2 step 1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- Session #1 step 2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Session #2 step 2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Session #1 step 3
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';

-- Session #1 step 4
COMMIT;

-- Session #2 step 3
-- завершается ошибкой сериализации из-за конкурентного изменения строки Session #1
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';

-- Session #2 step 4
-- COMMIT после ошибки в транзакции автоматически становится ROLLBACK
COMMIT;

-- Session #1 step 5
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Session #2 step 5
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
