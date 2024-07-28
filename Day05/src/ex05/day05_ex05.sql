-- Создайте частично уникальный индекс BTree с именем idx_person_order_order_date 
-- в таблице person_order для атрибутов person_id и Menu_id с 
-- частичной уникальностью для столбца order_date для даты «01.01.2022».

CREATE UNIQUE INDEX idx_person_order_order_date
ON person_order (person_id, menu_id)
WHERE order_date = '2022-01-01';

SET enable_seqscan = OFF;

EXPLAIN ANALYZE
SELECT person_id, menu_id, order_date
FROM person_order
WHERE person_id = 1 AND menu_id = 1 AND order_date = '2022-01-01';


