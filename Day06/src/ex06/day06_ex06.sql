-- Давайте создадим последовательность базы данных с именем seq_person_discounts (начиная со значения 1) 
-- и установим значение по умолчанию для атрибута id таблицы person_discounts, 
-- чтобы каждый раз автоматически брать значение из seq_person_discounts. 
-- Обратите внимание, что ваш следующий порядковый номер равен 1, 
-- в этом случае установите фактическое значение для последовательности базы данных 
-- на основе формулы «количество строк в таблице person_discounts» + 1. 
-- В противном случае вы получите ошибки об ограничении нарушения первичного ключа.

-- Создание последовательности
CREATE SEQUENCE seq_person_discounts START 1;

-- Установка значения по умолчанию для столбца id
ALTER TABLE person_discounts ALTER COLUMN id SET DEFAULT nextval('seq_person_discounts');

-- Обновление текущего значения «количество строк в таблице person_discounts» + 1. 
SELECT setval('seq_person_discounts', (SELECT COUNT(*) FROM person_discounts) + 1);

select count(*)=1 as check1, max("start_value") = 1 as check2, max("last_value") > 5 as check3 from pg_sequences where sequencename = 'seq_person_discounts'