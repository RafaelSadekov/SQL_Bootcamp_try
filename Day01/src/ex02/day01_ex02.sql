-- SQL, которая возвращает уникальные 
-- названия пицц из таблицы меню и сортирует 
-- их по столбцу pizza_name в порядке убывания. 
-- Пожалуйста, обратите внимание на раздел "Запрещено".
-- DISTINCT, GROUP BY, HAVING, any type of JOINs
SELECT
	PIZZA_NAME
FROM
	MENU
UNION -- без all убирает дубликаты
SELECT
	PIZZA_NAME
FROM
	MENU
ORDER BY
	PIZZA_NAME DESC;