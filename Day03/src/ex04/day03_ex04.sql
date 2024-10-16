(
    SELECT p2.name AS pizzeria_name
    FROM person p
    INNER JOIN person_order pv ON p.id = pv.person_id
    INNER JOIN menu m ON m.id = pv.menu_id
    INNER JOIN pizzeria p2 ON p2.id = m.pizzeria_id
    WHERE p.gender = 'female'
    EXCEPT
    SELECT p2.name
    FROM person p
    INNER JOIN person_order pv ON p.id = pv.person_id
    INNER JOIN menu m ON m.id = pv.menu_id
    INNER JOIN pizzeria p2 ON p2.id = m.pizzeria_id
    WHERE p.gender = 'male'
)
UNION
(
    SELECT p2.name
    FROM person p
    INNER JOIN person_order pv ON p.id = pv.person_id
    INNER JOIN menu m ON m.id = pv.menu_id
    INNER JOIN pizzeria p2 ON p2.id = m.pizzeria_id
    WHERE p.gender = 'male'
    EXCEPT
    SELECT p2.name
    FROM person p
    INNER JOIN person_order pv ON p.id = pv.person_id
    INNER JOIN menu m ON m.id = pv.menu_id
    INNER JOIN pizzeria p2 ON p2.id = m.pizzeria_id
    WHERE p.gender = 'female'
)
ORDER BY 1;
