-- Напишите оператор SQL, который возвращает количество заказов, среднюю цену,
-- максимальную цену и минимальную цену пиццы, продаваемой каждой пиццерией.
-- Результат следует отсортировать по названию пиццерии. См. пример данных ниже.
-- Округлите среднюю цену до двух плавающих чисел.

SELECT
    p.name,
    COUNT(*) AS count_of_orders,
    ROUND(AVG(m.price), 2) AS average_price,
    MAX(m.price) AS max_price,
    MIN(m.price) AS min_price
FROM
    pizzeria p
    JOIN menu m ON p.id = m.pizzeria_id
    JOIN person_order po ON m.id = po.menu_id
GROUP BY
    p.name
ORDER BY p.name;