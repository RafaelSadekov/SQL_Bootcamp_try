-- Найдите имена людей, живущих по одному и тому же адресу. Убедитесь, что результат отсортирован по имени 1-го человека,
-- имени 2-го человека и общему адресу.
-- Что названия ваших столбцов совпадают с названиями столбцов, person_name1	person_name2 common_address
SELECT
    p1.name AS person_name1,
    p2.name AS person_name2,
    p1.address AS common_address
FROM person p1
    JOIN person p2 ON p1.address = p2.address
    AND p1.id > p2.id
ORDER BY
    person_name1,
    person_name2,
    common_address;

-- где адреса совпадают (p1.address = p2.address), и используем условие p1.id > p2.id,
-- чтобы избежать дублирования и обеспечить, что каждая пара будет выбрана только один раз.