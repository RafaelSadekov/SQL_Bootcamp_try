-- Мы знаем личные адреса из наших данных. Предположим, что этот человек посещает только пиццерии своего города.
-- Напишите оператор SQL, который возвращает адрес, название пиццерии и сумму заказов человека.
-- Результат следует отсортировать по адресу, а затем по названию ресторана.

SELECT pe.address, pi.name, COUNT(po.id) AS count_of_orders
FROM
    person pe
    JOIN person_order po ON pe.id = po.person_id
    JOIN menu m ON po.menu_id = m.id
    JOIN pizzeria pi ON m.pizzeria_id = pi.id
GROUP BY
    pe.address,
    pi.name
ORDER BY pe.address, pi.name;