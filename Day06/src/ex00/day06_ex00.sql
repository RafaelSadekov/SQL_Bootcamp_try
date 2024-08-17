-- Подумайте о персональных скидках для людей с одной стороны и пиццерий с другой. 
-- Необходимо создать новую реляционную таблицу (задайте имя person_discounts) 
-- со следующими правилами.
CREATE TABLE person_discounts (
     id SERIAL PRIMARY KEY,
    person_id BIGINT NOT NULL,
    pizzeria_id BIGINT NOT NULL,
    discount NUMERIC NOT NULL,
    CONSTRAINT fk_person_discounts_person_id FOREIGN KEY (person_id) REFERENCES person(id),
    CONSTRAINT fk_person_discounts_pizzeria_id FOREIGN KEY (pizzeria_id) REFERENCES pizzeria(id)
);

-- Установите атрибут id как первичный ключ 
-- (пожалуйста, посмотрите столбец id в существующих таблицах и выберите тот же тип данных).

-- Установите атрибуты person_id и pizzeria_id как внешние ключи для соответствующих таблиц 
-- (типы данных должны быть такими же, как для столбцов id в соответствующих родительских таблицах).

-- Задайте явные имена для ограничений внешнего ключа, используя шаблон 
-- fk_{table_name}_{column_name}, например fk_person_discounts_person_id.

-- Добавьте атрибут скидки, чтобы сохранить значение скидки в процентах. 
-- Помните, что значение скидки может быть числом с плавающей запятой 
-- (просто используйте числовой тип данных). 
-- Поэтому, пожалуйста, выберите соответствующий тип данных, чтобы учесть эту возможность.