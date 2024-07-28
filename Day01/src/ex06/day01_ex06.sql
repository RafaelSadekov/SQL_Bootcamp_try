-- вернемся к упражнению № 03 и изменим нашу инструкцию SQL, 
-- чтобы она возвращала имена людей вместо идентификаторов, 
-- и изменим порядок по дате действия в порядке возрастания, 
-- а затем по имени человека в порядке убывания. 
-- Взгляните на примеры данных, приведенные ниже.
SELECT
	ACTION_DATE,
	(
		SELECT NAME
		FROM PERSON
		WHERE ID = COMMON.PERSON_ID
	) AS PERSON_NAME
FROM
	(
		SELECT ORDER_DATE AS ACTION_DATE, PERSON_ID
		FROM PERSON_ORDER
		INTERSECT
		SELECT	VISIT_DATE AS ACTION_DATE, PERSON_ID
		FROM PERSON_VISITS
	) AS COMMON
ORDER BY
	ACTION_DATE ASC,
	PERSON_NAME DESC;