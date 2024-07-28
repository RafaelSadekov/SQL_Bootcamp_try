-- Напишите оператор SQL, который возвращает имя человека
-- и соответствующее количество посещений любой пиццерии,
-- если человек посетил более 3 раз (> 3).
SELECT person.name, COUNT(*) AS count_of_visits
FROM person_visits
    JOIN person ON person.id = person_visits.person_id
GROUP BY
    person.name
HAVING
    COUNT(*) > 3
ORDER BY count_of_visits DESC;