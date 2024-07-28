-- Измените оператор SQL из упражнения 00 и верните имя человека (а не идентификатор). 
-- Дополнительный пункт: нам нужно видеть только 4 лучших человека с максимальным количеством посещений 
-- в каждой пиццерии, отсортированных по имени человека. См. пример выходных данных ниже.

SELECT  person.name AS name, count(*) AS count_of_visits
FROM person_visits
JOIN person ON person_visits.person_id = person.id
GROUP BY name
ORDER BY count_of_visits DESC, name
LIMIT 4;