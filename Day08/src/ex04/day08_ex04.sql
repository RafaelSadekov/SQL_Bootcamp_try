-- Давайте проверим один из известных шаблонов базы данных «Неповторяемое чтение», но на уровне изоляции SERIALIZABLE. 
-- Графическое изображение этой аномалии вы можете увидеть на картинке. 
-- Горизонтальная красная линия представляет окончательные результаты после всех последовательных шагов для обеих сессий.
-- Начало Установите уровень изоляции транзакций Session #1:
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- Начало Установите уровень изоляции транзакций Session #2:
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- SELECT Session #1:
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- First SELECT
-- UPDATE and COMMIT Session #2:
UPDATE pizzeria SET rating = 3.0 WHERE name = 'Pizza Hut';
COMMIT;
-- SELECT and COMMIT Session #1:
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Second SELECT
COMMIT;

-- Изменения теперь видны Session #1:
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
-- Изменения теперь видны Session #2:
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

