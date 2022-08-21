-- UNION

-- Найдем всех людей
SELECT id_reader as id_person, first_name, last_name FROM reader
UNION
SELECT id_author as id_person, first_name, last_name FROM author


-- Чтобы отличать людей можно добавить им тип
SELECT id_reader as id_person, first_name, last_name, 1 AS person_type FROM reader
UNION
SELECT id_author as id_person, first_name, last_name, 2 AS person_type FROM author