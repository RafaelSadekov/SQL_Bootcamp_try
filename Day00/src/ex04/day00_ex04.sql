SELECT
	NAME || ' (age:' || AGE || ',gender:''' || GENDER || ''',address:''' || ADDRESS || ''')' AS PERSON_INFORMATION
FROM
	PERSON
ORDER BY
	PERSON_INFORMATION ASC;