/*
Создать B-дерево индекс для каждого внешнего ключа в базе данных. 
Имена индексов должны соответствовать шаблону idx_{table_name}_{column_name}.
*/
-- Создание индекса для внешнего ключа в таблице person_visits
CREATE INDEX idx_person_visits_person_id ON person_visits(person_id);
CREATE INDEX idx_person_visits_pizzeria_id ON person_visits(pizzeria_id);

-- Создание индекса для внешнего ключа в таблице person_order
CREATE INDEX idx_person_order_person_id ON person_order(person_id);
CREATE INDEX idx_person_order_menu_id ON person_order(menu_id);

-- Создание индекса для внешнего ключа в таблице menu
CREATE INDEX idx_menu_pizzeria_id ON menu(pizzeria_id);
