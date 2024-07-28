-- Напишите функцию fnc_fibonacci на SQL или pl/pgsql (на ваше усмотрение),
-- которая имеет входной параметр pstop целочисленного типа 
-- (по умолчанию — 10), а выходные данные функции представляют 
-- собой таблицу всех чисел Фибоначчи, меньших, чем pstop.

CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop integer DEFAULT 10)
RETURNS TABLE(fib_number integer) AS $$
DECLARE
    a integer := 0;
    b integer := 1;
    fib integer;
BEGIN
    fib_number := a;
    RETURN NEXT;
    fib_number := b;
    RETURN NEXT;
    LOOP
        fib := a + b;
        EXIT WHEN fib >= pstop;
        fib_number := fib;
        RETURN NEXT;
        a := b;
        b := fib;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM fnc_fibonacci(100);  
SELECT * FROM fnc_fibonacci();    
