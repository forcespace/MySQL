-------------------------------------------------------------------------
				/* Оператор вставки INSERT */
-------------------------------------------------------------------------

-- Записываем строку в таблицу `author`
INSERT INTO `author`             -- Ключевое слово INTO можно не использовать.
    (first_name, last_name) -- Указание порядка записи данных.
VALUES
    ('Alexander', 'Pushkin'); -- Вводимые данные.
    
-- Можно явно изменить порядок записываемых даных.
INSERT INTO `author`
    (last_name, first_name) -- Указание порядка записи данных.
VALUES
    ('Pushkin', 'Alexander'); -- Вводимые данные.

INSERT INTO `author`
-- Указание порядка записи данных отсутствует, значит используем порядок по умолчанию.
VALUES
    (1000, 'Alexander', 'Pushkin'); -- Вводимые данные.
-- В атрибут с auto_increment можно записать значение

INSERT INTO `author`
-- Указание порядка записи данных отсутствует, значит используем порядок по умолчанию.
VALUES
    ('Alexander', 'Pushkin', 1001); -- Вводимые данные (Ошибка очередности ввода!).

INSERT INTO `author`
VALUES
-- Допускается оставлять пустыми поля помеченные ограничением NULL 
    (1002, NULL, 'Pushkin'); -- Вводимые данные.
    
INSERT INTO `author`
VALUES 
 -- Нельзя оставлять пустыми поля помеченные ограничением NOT NULL
    (NULL, 'Alexander', NULL); -- Вводимые данные.

INSERT INTO `author`
    (first_name, last_name) 
VALUES -- Допускается вводить несколько строк одновременно
    ('Alexander', 'Pushkin'),
    ('Alexander', 'Pushkin II');

INSERT INTO `author` 
VALUES -- Указание порядка записи данных для несколиких строк не обязательно
    (1005, 'Alexander', 'Pushkin III'),
    (1006, 'Alexander', 'Pushkin IV');
    
DELETE FROM author 
WHERE
    last_name LIKE 'Pushkin%';