-- Давайте проверим один из известных шаблонов базы данных «Фантомное чтение», но с уровнем изоляции REPEATABLE READ. 
-- Графическое изображение этой аномалии вы можете увидеть на картинке. 
-- Горизонтальная красная линия представляет окончательные результаты после всех последовательных шагов для обеих сессий.
-- Пожалуйста, просуммируйте все рейтинги для всех пиццерий в одном режиме транзакции для Сессии №1, 
-- а затем сделайте ВСТАВКУ нового ресторана «Казань Пицца 2» с рейтингом 4 и ID=11 в Сессии №2 (в том же порядке, что и на рисунке).

-- Начало Установите уровень изоляции транзакций Session #1:
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- Начало Установите уровень изоляции транзакций Session #2:
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- Session #1:
SELECT SUM(rating) FROM pizzeria;
-- UPDATE and COMMIT Session #2:
INSERT INTO pizzeria (id, name, rating) VALUES (11, 'Kazan Pizza 2', 4);
COMMIT;
-- SELECT and COMMIT Session #1:
SELECT SUM(rating) FROM pizzeria;
COMMIT;

-- Изменения теперь видны Session #1:
SELECT SUM(rating) FROM pizzeria;
-- Изменения теперь видны Session #2:
SELECT SUM(rating) FROM pizzeria;

