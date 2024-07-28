WITH tmp AS
    (SELECT pizzeria.name AS pizzeria_name,
            gender
     FROM pizzeria
     INNER JOIN person_visits AS pv ON pizzeria.id = pv.pizzeria_id
     INNER JOIN person ON pv.person_id = person.id)
    (SELECT tmp.pizzeria_name
     FROM tmp
     WHERE gender = 'female'
     EXCEPT ALL SELECT tmp.pizzeria_name
     FROM tmp
     WHERE gender = 'male')
UNION ALL
    (SELECT tmp.pizzeria_name
     FROM tmp
     WHERE gender = 'male'
     EXCEPT ALL SELECT tmp.pizzeria_name
     FROM tmp
     WHERE gender = 'female')
ORDER BY pizzeria_name;

