-- перепишите инструкцию SQL из упражнения №07, используя конструкцию NATURAL JOIN. 
-- Результат должен быть таким же, как в упражнении №07.
SELECT
	PO.ORDER_DATE,
	CONCAT(P.NAME, ' (Age: ', P.AGE, ')') AS PERSON_INFORMATION
FROM
	(
		SELECT ORDER_DATE, PERSON_ID
		FROM PERSON_ORDER
	) PO
	NATURAL JOIN ( --- автоматически соединяет таблицы по всем столбцам с одинаковыми именами
		SELECT ID AS PERSON_ID, NAME, AGE
		FROM PERSON
	) P
ORDER BY
	PO.ORDER_DATE ASC,
	PERSON_INFORMATION ASC;

