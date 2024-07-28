-- SQL, которая возвращает дату заказа из таблицы person_order 
-- и соответствующее имя пользователя (имя и возраст указаны в формате, 
-- указанном в примере данных ниже), который сделал заказ из таблицы person. 
-- Добавьте сортировку по обоим столбцам в порядке возрастания.
SELECT
	PO.ORDER_DATE,
	CONCAT(P.NAME, ' (age: ', P.AGE, ')') AS PERSON_INFORMATION -- позволяет объединить имя и возраст человека в одну строку.
FROM
	PERSON_ORDER PO
	JOIN PERSON P ON PO.PERSON_ID = P.ID
ORDER BY
	PO.ORDER_DATE ASC,
	PERSON_INFORMATION ASC;