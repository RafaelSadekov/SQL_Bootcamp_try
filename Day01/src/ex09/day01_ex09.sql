-- 2 инструкции SQL, которые возвращают список пиццерий, которые не посещались людьми, 
-- использующими IN для первой и EXISTS для второй.
SELECT NAME
FROM PIZZERIA
WHERE
	ID NOT IN (
		SELECT PIZZERIA_ID
		FROM PERSON_VISITS
	);
--- идентиф. не присутствуют в подзапросе

SELECT NAME
FROM PIZZERIA P
WHERE NOT EXISTS (
		SELECT 1
		FROM PERSON_VISITS PV
		WHERE PV.PIZZERIA_ID = P.ID
	);
--- Как только находится одна такая строка, подзапрос завершается.