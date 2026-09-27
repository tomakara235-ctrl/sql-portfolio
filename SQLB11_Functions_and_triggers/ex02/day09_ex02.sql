-- Задание 02 — Audit of incoming deletes

CREATE OR REPLACE FUNCTION fnc_trg_person_delete_audit()
    RETURNS TRIGGER AS
$$
BEGIN
	insert into person_audit(created, type_event, row_id, name, age, gender, address)
		values (current_timestamp, 'D', old.id, old.name, old.age, old.gender, old.address);
		return null;
END;
$$
    LANGUAGE plpgsql;

CREATE TRIGGER trg_person_delete_audit
    AFTER DELETE
    ON person
    FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_delete_audit();

DELETE
FROM person
WHERE id = 10;

select *
from person_audit;