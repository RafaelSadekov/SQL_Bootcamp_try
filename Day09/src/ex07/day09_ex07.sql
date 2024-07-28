-- Напишите функцию func_minimum на SQL или pl/pgsql (на ваше усмотрение), 
-- которая имеет входной параметр, представляющий собой массив чисел, 
-- и функция должна возвращать минимальное значение. 
-- Чтобы проверить себя и вызвать функцию, 
-- вы можете сделать оператор, подобный приведенному ниже.

CREATE OR REPLACE FUNCTION func_minimum(VARIADIC arr NUMERIC[])
RETURNS NUMERIC AS $$
BEGIN
    RETURN (SELECT min(value) FROM unnest(arr) AS value);
END;

$$ LANGUAGE plpgsql;

SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);
