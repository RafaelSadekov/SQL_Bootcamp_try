-- Давайте продолжим реализацию нашего шаблона аудита для таблицы person. 
-- Просто определите триггер trg_person_update_audit и 
-- соответствующую триггерную функцию fnc_trg_person_update_audit 
-- для обработки всего трафика UPDATE в таблице person. 
-- Нам следует сохранить СТАРЫЕ состояния всех значений атрибутов.

CREATE OR REPLACE FUNCTION fnc_trg_person_update_audit()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO person_audit (created, type_event, row_id, name, age, gender, address)
    VALUES (now(), 'U', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_update_audit
AFTER UPDATE ON person
FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_update_audit();

UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;

-- SELECT * FROM person_audit