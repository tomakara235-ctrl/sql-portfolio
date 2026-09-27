-- Задание 07 — Different view to find a Minimum

CREATE OR REPLACE FUNCTION func_minimum(VARIADIC arr NUMERIC[])
    returns numeric as $$
	select min(val) from unnest(arr) as val;
$$ LANGUAGE SQL;

SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);