 
-- Session #1 step 0
SHOW TRANSACTION ISOLATION LEVEL;
 
-- Session #2 step 0
SHOW TRANSACTION ISOLATION LEVEL;
 
-- Session #1 step 1
BEGIN;
 
-- Session #2 step 1
BEGIN;
 
-- Session #1 step 2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
 
-- Session #2 step 2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
 
-- Session #1 step 3
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';
 
-- Session #2 step 3
-- ожидает снятия блокировки строки, пока Session #1 не закоммитит
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
 
-- Session #1 step 4
COMMIT;
 
-- Session #2 step 4
COMMIT;
 
-- Session #1 step 5
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
 
-- Session #2 step 5
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
 