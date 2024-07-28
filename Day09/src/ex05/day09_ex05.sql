-- Похоже, что две функции из упражнения 04 требуют более общего подхода. 
-- Прежде чем продолжить, удалите эти функции из базы данных. 
-- Напишите общую функцию SQL (обратите внимание, а не функцию pl/pgsql) 
-- под названием fnc_persons. Эта функция должна иметь параметр IN pgender 
-- со значением по умолчанию = «женский». Чтобы проверить себя и вызвать функцию, 
-- вы можете сделать такой оператор 

DROP FUNCTION IF EXISTS fnc_persons_female;
DROP FUNCTION IF EXISTS fnc_persons_male;

CREATE OR REPLACE FUNCTION fnc_persons(pgender varchar DEFAULT 'female')
RETURNS TABLE(id bigint, name varchar, age integer, gender varchar, address varchar) AS $$
SELECT id, name, age, gender, address
FROM person
WHERE gender = pgender;
$$ LANGUAGE sql STABLE;

SELECT * FROM fnc_persons(pgender := 'male');

SELECT * FROM fnc_persons();


