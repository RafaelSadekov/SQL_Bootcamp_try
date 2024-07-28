-- Напишите оператор SQL, чтобы просмотреть 3 любимых ресторана по посещениям и заказам в списке
-- (добавьте столбец action_type со значениями «заказ» или «посещение»,
-- это зависит от данных из соответствующей таблицы).
-- Результат должен быть отсортирован по возрастанию по столбцу action_type и по убыванию по столбцу count.

WITH
    visits AS (
        SELECT pi.name, COUNT(pizzeria_id) AS count, 'visit' AS action_type
        FROM person_visits AS pv
            JOIN pizzeria pi ON pv.pizzeria_id = pi.id
        GROUP BY
            name
        LIMIT 3
    ),
    orders AS (
        SELECT pi.name, COUNT(pi.name) AS count, 'order' AS action_type
        FROM
            person_order po
            JOIN menu m ON po.menu_id = m.id
            JOIN pizzeria pi ON m.pizzeria_id = pi.id
        GROUP BY
            name
        LIMIT 3
    )
SELECT *
FROM visits
UNION
SELECT *
FROM orders
ORDER BY action_type, count DESC;