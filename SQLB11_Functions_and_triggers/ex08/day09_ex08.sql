-- Задание 08 — Fibonacci algorithm is in a function

CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10)
RETURNS TABLE (fib_number INTEGER) AS $$
DECLARE
    fib_prev INTEGER := 0;
    fib_curr INTEGER := 1;
BEGIN
    IF pstop <= 0 THEN
        RETURN;
    END IF;
    fib_number := fib_prev;
    RETURN NEXT;
    IF pstop = 1 THEN
        RETURN;
    END IF;
    WHILE fib_curr < pstop LOOP
        fib_number := fib_curr;
        RETURN NEXT;
        fib_curr := fib_curr + fib_prev;
        fib_prev := fib_curr - fib_prev; 
    END LOOP;
END;
$$ LANGUAGE plpgsql;


select * from fnc_fibonacci(100);
select * from fnc_fibonacci();
select * from fnc_fibonacci(20);