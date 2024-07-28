-- Для этой задачи используйте командную строку базы данных PostgreSQL (psql). 
-- Вам необходимо проверить, как ваши изменения будут опубликованы в базе данных для других пользователей базы данных. 
-- На самом деле нам нужны две активные сессии (т.е. 2 параллельные сессии в командной строке). 
-- Прежде чем запускать задачу, убедитесь, что ваша база данных находится на стандартном уровне изоляции. 
-- Просто запустите следующий оператор SHOW TRANSACTION ISOLATION LEVEL и результат должен быть «прочитан зафиксирован». 
-- Если нет, установите уровень изоляции фиксации чтения явно на уровне сеанса.

-- Начало Установите уровень изоляции транзакций Session #1:
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';
COMMIT;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
-- Начало Установите уровень изоляции транзакций Session #2:
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
COMMIT;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

