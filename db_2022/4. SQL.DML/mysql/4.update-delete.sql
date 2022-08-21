-- Записываем строку в таблицу author
INSERT INTO `author`             -- Ключевое слово INTO можно не использовать.
    (first_name, last_name) -- Указание порядка записи данных.
VALUES
    ('Alexander', 'Pushkin'); -- Вводимые данные.
    
--------------------------------------------------------------------------
--	      Оператор UPDATE (изменение(обновление) данных в таблице)
--------------------------------------------------------------------------

UPDATE `author`
SET first_name = 'Alexander I' -- изменить имя того,
WHERE last_name = 'Pushkin'	-- чья Фамилия 'Pushkin'

SELECT * FROM `author` ORDER BY id_author DESC;


INSERT INTO `author`
VALUES (1002, NULL, 'Pushkin V'); 

-- Возможно изменять значение сразу в нескольких столбцах
UPDATE `author`
SET first_name = 'Alexander',
	last_name = 'Pushkin'
WHERE id_author = 1002

SELECT * FROM `author` ORDER BY id_author DESC;


UPDATE `author`
SET first_name =  -- Если не задана консрукция WHERE, то изменяется весь столбец на указанное значение

SELECT * FROM `author`;

--------------------------------------------------------------------------
--	          Оператор DELETE (удаление данных из таблицы)
--------------------------------------------------------------------------

-- Удалить всех пользователей имя которых Alexander
DELETE `author` 
WHERE first_name = 'Alexander';
SELECT * FROM `author`;

-- Удаление всех данных из таблицы с помощью DELETE.
DELETE `author`;
SELECT * FROM `author`;

-- Для удаления всех данных из таблицы лучше использовать - TRUNCATE TABLE,
-- так как TRUNCATE удаляет информацию из базы быстрее чем стандартный DELETE.
TRUNCATE TABLE `author`;
SELECT * FROM `author`;