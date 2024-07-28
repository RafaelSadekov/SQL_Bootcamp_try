-- SQL, которая возвращает идентификатор меню 
-- и названия пицц из таблицы меню, а также идентификатор пользователя 
-- и имя пользователя из таблицы person в одном глобальном списке 
-- (с именами столбцов, как показано в примере ниже), упорядоченном по object_id, 
-- а затем по столбцам object_name.
SELECT
	ID AS OBJECT_ID,
	PIZZA_NAME AS OBJECT_NAME
FROM
	MENU
UNION ALL
SELECT
	ID AS OBJECT_ID,
	NAME AS OBJECT_NAME
FROM
	PERSON
ORDER BY
	OBJECT_ID,
	OBJECT_NAME;