-- Напишите оператор SQL, чтобы увидеть, как рестораны группируются по посещениям
-- и заказам и объединяются по названию ресторана.
-- Вы можете использовать внутренний SQL из упражнения 02 (Рестораны по посещениям и по заказам) без каких-либо ограничений на количество строк.
-- Кроме того, добавьте следующие правила. Вычислите сумму заказов и посещений соответствующей пиццерии
-- (обратите внимание, что не все ключи пиццерий представлены в обеих таблицах).
-- Отсортируйте результаты по столбцу total_count в порядке убывания и по столбцу имени в порядке возрастания. Взгляните на пример данных ниже.
 WITH 
     visits AS
    (SELECT pi.name AS pizzeria_name,
            count(*) AS count,
            'visit' AS action_type
     FROM person_visits pv
     JOIN pizzeria pi ON pi.id = pv.pizzeria_id
     GROUP BY pi.name),
     orders AS
    (SELECT pi.name AS pizzeria_name,
            count(*) AS count,
            'order' AS action_type
     FROM person_order po
     JOIN menu me ON me.id = po.menu_id
     JOIN pizzeria pi ON pi.id = me.pizzeria_id
     GROUP BY pi.name),
      combined AS
    (SELECT *
     FROM visits
     UNION all 
     SELECT *
     FROM orders)
SELECT pizzeria_name AS name,
       sum(count) AS total_count
FROM combined
GROUP BY pizzeria_name
ORDER BY total_count DESC,
         pizzeria_name;