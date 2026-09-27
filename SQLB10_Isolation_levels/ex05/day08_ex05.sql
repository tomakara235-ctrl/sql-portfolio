
-- Session #1 step 1
BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- Session #1 step 2
SELECT SUM(rating) FROM pizzeria;

-- Session #2 step 1
BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- Session #2 step 2
INSERT INTO pizzeria (id, name, rating) VALUES (10, 'Kazan Pizza', 5);

-- Session #2 step 3
COMMIT;

-- Session #1 step 3
-- второй SUM в той же ещё не закоммиченной транзакции — видит уже новую строку
SELECT SUM(rating) FROM pizzeria;

-- Session #1 step 4
COMMIT;
