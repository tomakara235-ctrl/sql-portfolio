
-- Session #1 step 1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- Session #1 step 2
SELECT SUM(rating) FROM pizzeria;

-- Session #2 step 1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- Session #2 step 2
INSERT INTO pizzeria (id, name, rating) VALUES (11, 'Kazan Pizza 2', 4);

-- Session #2 step 3
COMMIT;

-- Session #1 step 3
-- второй SUM в той же транзакции — видит то же самое значение, что и первый (снимок REPEATABLE READ)
SELECT SUM(rating) FROM pizzeria;

-- Session #1 step 4
COMMIT;

-- Session #1 step 5
-- новый запрос уже вне транзакции — видит актуальные данные, включая вставку Session #2
SELECT SUM(rating) FROM pizzeria;
