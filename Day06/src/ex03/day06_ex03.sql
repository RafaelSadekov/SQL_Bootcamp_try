-- Создайте уникальный индекс с несколькими столбцами (с именем idx_person_discounts_unique),
-- который предотвратит дублирование пар идентификаторов человека и пиццерии.
CREATE UNIQUE INDEX idx_person_discounts_unique
ON person_discounts (person_id, pizzeria_id);

-- простой запрос для выборки данных с использованием индекса
SET enable_seqscan TO OFF;
EXPLAIN ANALYZE
SELECT *
FROM person_discounts
WHERE person_id = 5 AND pizzeria_id = 3;
