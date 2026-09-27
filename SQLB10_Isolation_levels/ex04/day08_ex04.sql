
-- Session #1 step 1
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-- Session #1 step 2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Session #2 step 1
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-- Session #2 step 2
UPDATE pizzeria SET rating = 3.0 WHERE name = 'Pizza Hut';

-- Session #2 step 3
COMMIT;

-- Session #1 step 3
-- второй SELECT в той же транзакции — видит то же самое значение, что и первый (снимок SERIALIZABLE)
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Session #1 step 4
COMMIT;
