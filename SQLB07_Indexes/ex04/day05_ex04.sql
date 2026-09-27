CREATE unique INDEX idx_menu_unique
	ON menu (pizzeria_id, pizza_name);

SET enable_seqscan = OFF;
EXPLAIN analyze
SELECT pizzeria_id, pizza_name
FROM menu
where pizzeria_id = 3 AND pizza_name = 'supreme pizza';

--SET enable_seqscan = ON;