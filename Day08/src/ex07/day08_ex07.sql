-- Графическое представление тупиковой ситуации вы можете увидеть на картинке. Это похоже на «Christ-lock» между параллельными сеансами.
-- Напишите любой оператор SQL с любым уровнем изоляции (вы можете использовать настройку по умолчанию) 
-- на таблицк pizzeria, чтобы воспроизвести эту тупиковую ситуацию.

-- Начало Session #1:
BEGIN;
-- Начало Session #2:
BEGIN;
-- UPDATE pizzeria Session #1:
UPDATE pizzeria SET rating = 4 WHERE name = 'Kazan Pizza';
-- UPDATE pizzeria Session #2:
UPDATE pizzeria SET rating = 4 WHERE name = 'Kazan Pizza 2';
-- UPDATE pizzeria Session #1:
UPDATE pizzeria SET rating = 3 WHERE name = 'Kazan Pizza 2';
-- UPDATE pizzeria Session #2:
UPDATE pizzeria SET rating = 3 WHERE name = 'Kazan Pizza';
-- COMMIT pizzeria Session #1:
COMMIT;
-- COMMIT pizzeria Session #2:
COMMIT;
-- Изменения теперь видны Session #1:
SELECT SUM(rating) FROM pizzeria;

