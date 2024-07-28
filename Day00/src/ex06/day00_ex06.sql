SELECT
	(
		SELECT
			NAME
		FROM
			PERSON
		WHERE
			ID = PO.PERSON_ID
	) AS NAME,
	(
		CASE
			WHEN (
				SELECT
					NAME
				FROM
					PERSON
				WHERE
					ID = PO.PERSON_ID
			) = 'Denis' THEN TRUE
			ELSE FALSE
		END
	) AS CHECK_NAME
	-- CASE WHEN проверяет, является ли имя человека "Denis"
FROM
	PERSON_ORDER PO
WHERE
	(
		PO.MENU_ID = 13
		OR PO.MENU_ID = 14
		OR PO.MENU_ID = 18
	)
	AND PO.ORDER_DATE = '2022-01-07';