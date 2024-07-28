-- Прежде чем продолжить, напишите оператор SQL, который возвращает пиццу и 
-- соответствующие названия пиццерий. (сортировка не требуется).

SELECT
    m.pizza_name,
    p.name AS pizzeria_name
FROM
    menu m
JOIN
    pizzeria p ON m.pizzeria_id = p.id;
    
-- Отключение последовательного сканирования Please pay attention to "Index Only Scan" scanning!
SET enable_seqscan = OFF;

-- Давайте докажем, что ваши индексы работают для вашего SQL. 
-- Примером доказательства является вывод команды EXPLAIN ANALYZE. 

EXPLAIN ANALYZE
SELECT
    m.pizza_name,
    p.name AS pizzeria_name
FROM
    menu m
JOIN
    pizzeria p ON m.pizzeria_id = p.id;
