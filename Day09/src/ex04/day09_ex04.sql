-- Как вы помните, мы создали два представления базы данных, 
-- чтобы отделить данные из таблиц людей по признаку пола. 
-- Определите две функции SQL (обратите внимание, а не функции pl/pgsql) 
-- с именами: fnc_persons_female (должен возвращать лиц женского пола), 
-- fnc_persons_male (должен возвращать лиц мужского пола). 
-- Чтобы проверить себя и вызвать функцию, вы можете сделать 
-- такое заявление (Потрясающе! С функцией можно работать как с виртуальной таблицей!):

CREATE OR REPLACE FUNCTION fnc_persons_female()
RETURNS TABLE(id bigint, name varchar, age integer, gender varchar, address varchar) AS $$
SELECT id, name, age, gender, address
FROM person
WHERE gender = 'female';
$$ LANGUAGE sql STABLE;

CREATE OR REPLACE FUNCTION fnc_persons_male()
RETURNS TABLE(id bigint, name varchar, age integer, gender varchar, address varchar) AS $$
SELECT id, name, age, gender, address
FROM person
WHERE gender = 'male';
$$ LANGUAGE sql STABLE;

SELECT * FROM fnc_persons_male();

SELECT * FROM fnc_persons_female();