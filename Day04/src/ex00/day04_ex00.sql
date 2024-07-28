-- Создание вирт базу для женщин
CREATE VIEW v_persons_female AS
SELECT id, name, age, gender, address
FROM person
WHERE gender = 'female';

-- Создание вирт базу  для мужчин
CREATE VIEW v_persons_male AS
SELECT id, name, age, gender, address
FROM person
WHERE gender = 'male';
