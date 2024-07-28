-- Теперь давайте посмотрим на функции pl/pgsql. 
-- Создайте, пожалуйста, функцию pl/pgsql fnc_person_visits_and_eats_on_date
--  на основе оператора SQL, которая будет искать названия пиццерий, 
--  которые посещал человек (параметр IN pperson со значением по умолчанию «Дмитрий») 
--  и где он мог купить пиццу дешевле заданной суммы в рублях 
--  ( Параметр IN pprice со значением по умолчанию 500) 
--  на заданную дату (параметр IN pdate со значением по умолчанию 8 января 2022 г.). 
--  Чтобы проверить себя и вызвать функцию, вы можете сделать оператор, 
--  подобный приведенному ниже.

CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(
    IN pperson VARCHAR DEFAULT 'Dmitriy',
    IN pprice NUMERIC DEFAULT 500,
    IN pdate DATE DEFAULT '2022-01-08'
) RETURNS TABLE (pizzeria_name VARCHAR) AS $$
BEGIN
    RETURN QUERY
    SELECT p.name AS pizzeria_name
    FROM pizzeria p
    JOIN menu m ON p.id = m.pizzeria_id
    JOIN person_visits pv ON p.id = pv.pizzeria_id
    JOIN person pe ON pe.id = pv.person_id
    WHERE pe.name = pperson
      AND m.price < pprice
      AND pv.visit_date = pdate;
END;
$$ LANGUAGE plpgsql;


SELECT * FROM fnc_person_visits_and_eats_on_date(pprice := 800);
SELECT * FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna', pprice := 1300, pdate := '2022-01-01');

