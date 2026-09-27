-- Задание 01 — Audit of incoming updates

CREATE OR REPLACE FUNCTION fnc_trg_person_update_audit()
    RETURNS TRIGGER AS
$$ 
	BEGIN
		insert into person_audit (created, type_event, row_id, name, age, gender, address)
		values (current_timestamp, 'U', old.id, old.name, old.age, old.gender, old.address);
		return old;
	END;
$$
    LANGUAGE plpgsql;

CREATE TRIGGER trg_person_update_audit
    AFTER UPDATE
    ON person
    FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_update_audit();



UPDATE person
SET name = 'Bulat'
WHERE id = 10;

UPDATE person
SET name = 'Damir'
WHERE id = 10;

select *
from person_audit;
