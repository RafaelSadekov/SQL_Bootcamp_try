-- к упражнению № 01, пожалуйста, перепишите ваш SQL, используя шаблон CTE (Common Table Expression). 
-- Пожалуйста, перейдите к разделу CTE вашего "генератора дней". 
-- Результат должен выглядеть аналогично упражнению №01.
WITH date_series AS (
    SELECT generate_series(
            '2022-01-01'::timestamp,
            '2022-01-10'::timestamp,
            '1 day'
        )::date AS date
),
visits AS (
    SELECT visit_date
    FROM person_visits
    WHERE person_id IN (1, 2)
)
SELECT date_series.date AS missing_date
FROM date_series
    LEFT JOIN visits ON date_series.date = visits.visit_date
WHERE visits.visit_date IS NULL
ORDER BY missing_date ASC;
