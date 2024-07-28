-- Active: 1720093014887@@127.0.0.1@5433@lusiadas
-- Создайте функциональный индекс B-дерева с именем idx_person_name для имени столбца таблицы person.
-- Индекс должен содержать имена людей в верхнем регистре.
CREATE INDEX idx_person_name ON person (UPPER(name));

SET enable_seqscan = OFF;

EXPLAIN ANALYZE
SELECT *
FROM person
WHERE UPPER(name) = 'anna';

