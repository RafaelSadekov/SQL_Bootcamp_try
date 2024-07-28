-- Давайте проверим один из известных шаблонов базы данных «фантомного чтения», но с уровнем изоляции READ COMMITTED. 
-- Графическое изображение этой аномалии вы можете увидеть на картинке. 
-- Горизонтальная красная линия представляет окончательные результаты после всех последовательных шагов для обеих сессий.
-- Пожалуйста, просуммируйте все рейтинги для всех пиццерий в одном режиме транзакции для Сессии №1, 
-- а затем сделайте ВСТАВКУ нового ресторана «Казань Пицца» с рейтингом 5 и ID=10 в Сессии №2 (в том же порядке, что и на рисунке).

-- Начало Session #1:
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- Начало Session #2:
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- Session #1:
SELECT SUM(rating) FROM pizzeria;
-- UPDATE and COMMIT Session #2:
INSERT INTO pizzeria (id, name, rating) VALUES (10, 'Kazan Pizza', 5);
COMMIT;
-- SELECT and COMMIT Session #1:
SELECT SUM(rating) FROM pizzeria;
COMMIT;

-- Изменения теперь видны Session #1:
SELECT SUM(rating) FROM pizzeria;
-- Изменения теперь видны Session #2:
SELECT SUM(rating) FROM pizzeria;

