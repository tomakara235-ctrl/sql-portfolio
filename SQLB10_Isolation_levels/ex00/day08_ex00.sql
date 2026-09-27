
-- Session #1 step 1
BEGIN;
UPDATE pizzeria
SET rating = 5
WHERE name = 'Pizza Hut';

SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';

-- Session #2 step 1
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';

-- Session #1 step 2
COMMIT;

-- Session #2 step 2
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';