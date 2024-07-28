-- SQL, которая возвращает пропущенные дни с 1 по 10 января 2022 года (включая все дни)
-- для посещений пользователями с идентификаторами 1 или 2 (т.е. дни, пропущенные обоими).
-- Пожалуйста, упорядочивайте по дням посещения в порядке возрастания.
-- Ниже приведены примеры данных с названиями столбцов. missing_date
SELECT date::date AS missing_date
FROM generate_series(
        '2022-01-01'::timestamp, '2022-01-10'::timestamp, '1 day'
    ) AS date
    LEFT JOIN (
        SELECT visit_date
        FROM person_visits
        WHERE
            person_id IN (1, 2)
    ) AS visits ON date::date = visits.visit_date
    --- используется для создания серии чисел, дат или временных меток.
WHERE
    visits.visit_date IS NULL
ORDER BY missing_date ASC;