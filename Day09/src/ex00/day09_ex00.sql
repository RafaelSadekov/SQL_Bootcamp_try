-- Мы хотим быть сильнее с данными и не хотим терять события, связанные с изменениями. 
-- Давайте реализуем функцию аудита входящих изменений INSERT. 
-- Создайте таблицу person_audit с той же структурой, что и таблица person, но добавьте некоторые дополнительные изменения. 
-- Взгляните на таблицу ниже с описаниями для каждого столбца.

CREATE TABLE person_audit (
    created timestamp with time zone NOT NULL DEFAULT now(),
    type_event char(1) NOT NULL DEFAULT 'I' CHECK (type_event IN ('I', 'U', 'D')),
    row_id BIGINT NOT NULL,
    name VARCHAR,
    age INTEGER,
    gender VARCHAR,
    address VARCHAR
);

-- Собственно, давайте создадим триггерную функцию базы данных 
-- с именем fnc_trg_person_insert_audit, которая должна обрабатывать 
-- трафик INSERT DML и делать копию новой строки в таблице person_audit.

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO person_audit(row_id, name, age, gender, address)
    VALUES (NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Подсказка: если вы хотите реализовать триггер PostgreSQL (пожалуйста, прочитайте это в документации PostgreSQL),
--  вам необходимо создать 2 объекта: функцию триггера базы данных и триггер базы данных. 
--  Итак, определите триггер базы данных с именем trg_person_insert_audit со следующими параметрами:

CREATE TRIGGER trg_person_insert_audit
AFTER INSERT ON person
FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_insert_audit();

-- Когда вы закончите работу с объектами триггера, введите оператор 
-- INSERT в таблицу person. ВСТАВИТЬ В человека(id, имя, возраст, пол, адрес) 
-- ЗНАЧЕНИЯ (10, «Дамир», 22, «мужчина», «Иркутск»);

INSERT INTO person(id, name, age, gender, address) VALUES (10, 'Damir', 22, 'male', 'Irkutsk');


-- SELECT * FROM person_audit;