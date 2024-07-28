SELECT
	ID,
	NAME,
	AGE,
	CASE
		WHEN AGE >= 10
		AND AGE <= 20 THEN 'interval #1'
		WHEN AGE > 20
		AND AGE < 24 THEN 'interval #2'
		ELSE 'interval #3'
	END AS INTERVAL_INFO
	-- CASE ... END AS INTERVAL_INFO для вычисления нового столбца interval_info
FROM
	PERSON
ORDER BY
	INTERVAL_INFO ASC;