COMMENT ON TABLE person_discounts IS 'Таблица хранит персональные скидки для каждого клиента в каждом ресторане пиццерии.';

COMMENT ON COLUMN person_discounts.id IS 'Уникальный идентификатор записи.';

COMMENT ON COLUMN person_discounts.person_id IS 'Идентификатор клиента, связанный с таблицей person.';

COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Идентификатор пиццерии, связанный с таблицей pizzeria.';

COMMENT ON COLUMN person_discounts.discount IS 'Скидка в процентах для клиента в определенной пиццерии.';



SELECT count(*) = 5 as check FROM pg_description WHERE objoid = 'person_discounts'::regclass