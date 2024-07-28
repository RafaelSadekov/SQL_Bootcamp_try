-- Пиццерии, которые посетил Андрей
WITH visited_pizzerias AS
    ( SELECT pz.name AS pizzeria_name
     FROM person_visits pv
     INNER JOIN person p ON pv.person_id = p.id
     INNER JOIN pizzeria pz ON pv.pizzeria_id = pz.id
     WHERE p.name = 'Andrey' ), -- Пиццерии Андрей сделал заказ
ordered_pizzerias AS
    ( SELECT pz.name AS pizzeria_name
     FROM person_order po
     INNER JOIN person p ON po.person_id = p.id
     INNER JOIN menu m ON po.menu_id = m.id
     INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
     WHERE p.name = 'Andrey' ) -- Пиццерий, Андрей посетил, но не сделал заказ
SELECT pizzeria_name
FROM visited_pizzerias
EXCEPT
SELECT pizzeria_name
FROM ordered_pizzerias
ORDER BY pizzeria_name;

