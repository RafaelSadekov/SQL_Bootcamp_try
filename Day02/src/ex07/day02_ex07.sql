-- Пожалуйста, найдите название пиццерии, которую Дмитрий
-- посетил 8 января 2022 года и где можно было отведать пиццу менее чем за 800 рублей.
SELECT pz.name
FROM
    person_visits pv
    JOIN person p ON pv.person_id = p.id
    JOIN menu m ON pv.pizzeria_id = m.pizzeria_id
    JOIN pizzeria pz ON m.pizzeria_id = pz.id
WHERE
    p.name = 'Dmitriy'
    AND pv.visit_date = '2022-01-08'
    AND m.price < 800;