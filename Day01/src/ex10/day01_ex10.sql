-- SQL, которая возвращает список имен людей, заказавших пиццу 
-- в соответствующей пиццерии. Пример результата (с именованными столбцами) 
-- приведен ниже, и да ... пожалуйста, оформляйте заказ по 3 столбцам 
-- (person_name, pizza_name, pizzeria_name)  в порядке возрастания.
SELECT
	P.NAME AS PERSON_NAME,
	M.PIZZA_NAME AS PIZZA_NAME,
	PI.NAME AS PIZZERIA_NAME
FROM
	PERSON P
	JOIN PERSON_ORDER PO ON P.ID = PO.PERSON_ID
	JOIN MENU M ON PO.MENU_ID = M.ID
	JOIN PIZZERIA PI ON M.PIZZERIA_ID = PI.ID
ORDER BY
	PERSON_NAME ASC,
	PIZZA_NAME ASC,
	PIZZERIA_NAME ASC;