-- SQL из "Упражнения 00", удалив столбец object_id. 
-- Затем измените порядок по object_name для части данных из таблицы person, 
-- а затем из таблицы menu (как показано в примере ниже). 
-- Пожалуйста, сохраните дубликаты!
(SELECT
	NAME AS OBJECT_NAME
FROM
	PERSON
ORDER BY
	OBJECT_NAME)
UNION ALL -- сохроняем дубликаты
(SELECT
	PIZZA_NAME AS OBJECT_NAME
FROM
	MENU
ORDER BY
	PIZZA_NAME);