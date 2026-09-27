-- Задание 04 — Database View VS Database Function
CREATE OR REPLACE FUNCTION fnc_persons_female()
    RETURNS TABLE
            (
                id      person.id%TYPE,
                name    person.name%TYPE,
                age     person.age%TYPE,
                gender  person.gender%TYPE,
                address person.address%TYPE
            )
AS
$$
SELECT id, name, age, gender, address
FROM person
WHERE gender = 'female';
$$ LANGUAGE SQL;

CREATE OR REPLACE FUNCTION fnc_persons_male()
    RETURNS TABLE
            (
                id      person.id%TYPE,
                name    person.name%TYPE,
                age     person.age%TYPE,
                gender  person.gender%TYPE,
                address person.address%TYPE
            )
AS
$$
SELECT id, name, age, gender, address
FROM person
WHERE gender = 'male';
$$ LANGUAGE SQL;

select * from fnc_persons_male();
select * from fnc_persons_female();
