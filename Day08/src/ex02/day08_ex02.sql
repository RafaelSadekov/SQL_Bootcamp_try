-- Давайте рассмотрим один из известных шаблонов базы данных «Аномалия потерянного обновления», но на уровне изоляции REPEATABLE READ. 
-- Графическое изображение этой аномалии вы можете увидеть на картинке. 
-- Горизонтальная красная линия означает окончательные результаты после всех последовательных шагов для обеих сессий.
-- Начало Установите уровень изоляции транзакций Session #1:
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- Начало Установите уровень изоляции транзакций Session #2:
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- SELECT Session #1:
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
-- SELECT Session #2:
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
-- UPDATE Session #1:
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';
-- UPDATE Session #2:
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
-- Публикация изменений Session #1:
COMMIT;
-- Публикация изменений Session #2:
COMMIT;

-- Изменения теперь видны Session #1:
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
-- Изменения теперь видны Session #2:
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

