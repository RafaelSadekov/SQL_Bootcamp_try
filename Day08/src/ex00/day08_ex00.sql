-- Начало транзакции Session #1:
BEGIN;
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
-- Что изменения не видны Session #2:
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
-- Публикация изменений Session #1:
COMMIT;
-- Что изменения теперь видны Session #2:
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

