-- SQL, которая вернет весь список имен людей, которые посещали
-- (или не посещали) пиццерии в период с 1 по 3 января 2022 года,
-- с одной стороны, и весь список названий пиццерий, которые были посещены
-- (или не посещались), с другой стороны. Ниже приведен пример данных с требуемыми названиями столбцов.
-- Пожалуйста, обратите внимание на замену нулевых значений "-" в
-- столбцах person_name и pizzeria_name. Пожалуйста, также укажите порядок для всех 3 столбцов.
SELECT
    COALESCE(person.name, '-') AS person_name,
    visits.visit_date,
    COALESCE(pizzeria.name, '-') AS pizzeria_name
FROM (
        SELECT
            person_id,
            visit_date,
            pizzeria_id
        FROM person_visits
        WHERE
            visit_date BETWEEN '2022-01-01' AND '2022-01-03'
    ) AS visits
    FULL JOIN person ON visits.person_id = person.id
    FULL JOIN pizzeria ON visits.pizzeria_id = pizzeria.id
ORDER BY
    person_name,
    visit_date,
    pizzeria_name;