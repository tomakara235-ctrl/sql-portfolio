-- Задание 03 — Generic Audit

DROP TRIGGER trg_person_delete_audit ON person;
DROP TRIGGER trg_person_update_audit ON person;
DROP TRIGGER trg_person_insert_audit ON person;

DROP FUNCTION fnc_trg_person_delete_audit();
DROP FUNCTION fnc_trg_person_update_audit();
DROP FUNCTION fnc_trg_person_insert_audit();

TRUNCATE person_audit;

CREATE OR REPLACE FUNCTION fnc_trg_person_audit()
    RETURNS TRIGGER AS
$$
begin
	if TG_OP = 'INSERT' then
			insert into person_audit(created, type_event, row_id, name, age, gender, address)
			values(current_timestamp, 'I', new.id, new.name, new.age, new.gender, new.address);
			return new;
		elsif TG_OP = 'UPDATE' then
			insert into person_audit(created, type_event, row_id, name, age, gender, address)
			values(current_timestamp, 'U', old.id, old.name, old.age, old.gender, old.address);
			return old;
		else
			insert into person_audit(created, type_event, row_id, name, age, gender, address)
			values(current_timestamp, 'D', old.id, old.name, old.age, old.gender, old.address);
			return old;
		end if;
		return null;
end;
$$
    LANGUAGE plpgsql;

CREATE TRIGGER trg_person_audit
    AFTER INSERT OR UPDATE OR DELETE
    ON person
    FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_audit();

INSERT INTO person(id, name, age, gender, address)
VALUES (10, 'Damir', 22, 'male', 'Irkutsk');

UPDATE person
SET name = 'Bulat'
WHERE id = 10;

UPDATE person
SET name = 'Damir'
WHERE id = 10;

DELETE
FROM person
WHERE id = 10;

select *
from person_audit;
