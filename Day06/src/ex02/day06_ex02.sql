-- Напишите оператор SQL, который возвращает заказы с фактической ценой и ценой со скидкой, 
-- применяемой для каждого человека в соответствующей пиццерии, 
-- отсортированные по имени человека и названию пиццы. 

WITH pizza_order_details AS (
    SELECT
        po.person_id,
        pe.name,
        me.pizza_name,
        me.price,
        me.pizzeria_id,
        pi.name AS pizzeria_name
    FROM person_order po
    INNER JOIN menu me ON me.id = po.menu_id
    INNER JOIN person pe ON pe.id = po.person_id
    INNER JOIN pizzeria pi ON pi.id = me.pizzeria_id
)
SELECT
    pod.name,
    pod.pizza_name,
    pod.price,
    round(pod.price - pod.price * (pd.discount / 100)) AS discounted_price,
    pod.pizzeria_name
FROM person_discounts pd
INNER JOIN pizza_order_details pod ON pd.person_id = pod.person_id
    AND pd.pizzeria_id = pod.pizzeria_id
ORDER BY pod.name, pod.pizza_name;

