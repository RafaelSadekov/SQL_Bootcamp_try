-- SQL, которая возвращает общие строки для атрибутов order_date, 
-- person_id из таблицы person_order с одной стороны и visit_date, person_id 
-- из таблицы person_visits с другой стороны (смотрите пример ниже). 
-- Другими словами, давайте найдем идентификаторы людей, которые посетили пиццу и 
-- заказали ее в один и тот же день. На самом деле, пожалуйста, добавьте заказ 
-- по дате действия в порядке возрастания, а затем по идентификатору персоны 
-- в порядке убывания.

SELECT
	ORDER_DATE AS ACTION_DATE,
	PERSON_ID
FROM
	PERSON_ORDER
INTERSECT --Пересечения
SELECT
	VISIT_DATE AS ACTION_DATE,
	PERSON_ID
FROM
	PERSON_VISITS
ORDER BY
	ACTION_DATE ASC,
	PERSON_ID DESC;