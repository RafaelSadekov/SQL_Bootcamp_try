-- SQL, которая возвращает разницу (minus) 
-- значений столбца person_id при сохранении дубликатов между 
-- таблицей person_order и таблицей person_visits для order_date и 
-- visit_date для 7 января 2022 года.
SELECT
	PERSON_ID
FROM
	PERSON_ORDER
WHERE
	ORDER_DATE = '2022-01-07'
EXCEPT ALL -- Находит разницу между, возвращая те значения, которые присутствуют в первом запросе, но отсутствуют во втором. 
SELECT
	PERSON_ID
FROM
	PERSON_VISITS
WHERE
	VISIT_DATE = '2022-01-07';