
-- Session #1 step 1
BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- Session #1 step 2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Session #2 step 1
BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- Session #2 step 2
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';

-- Session #2 step 3
COMMIT;

-- Session #1 step 3
-- второй SELECT в той же ещё не закоммиченной транзакции — видит уже новое значение
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Session #1 step 4
COMMIT;
