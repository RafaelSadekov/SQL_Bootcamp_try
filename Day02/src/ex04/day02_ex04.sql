-- Найдите полную информацию о всех возможных названиях пиццерий и ценах,
-- Чтобы заказать пиццу с грибами или пепперони.
-- Затем отсортируйте результат по названию пиццы и пиццерии.
-- Ниже приведен результат выборки данных (пожалуйста, используйте те же названия столбцов в вашем SQL-запросе).
SELECT menu.pizza_name, pizzeria.name AS pizzeria_name, menu.price
FROM menu
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
WHERE
    menu.pizza_name IN (
        'mushroom pizza',
        'pepperoni pizza'
    )
ORDER BY menu.pizza_name, pizzeria.name;