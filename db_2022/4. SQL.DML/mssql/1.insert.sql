-------------------------------------------------------------------------
				/* Оператор вставки INSERT */
-------------------------------------------------------------------------

SELECT * FROM [author]

-- Записываем строку в таблицу [author]
INSERT INTO [author]             
    (first_name, last_name) -- Указание порядка записи данных.
VALUES
    ('Alexander', 'Pushkin'); -- Вводимые данные.
    
-- Можно явно изменить порядок записываемых даных.
INSERT INTO [author]
    (last_name, first_name) -- Указание порядка записи данных.
VALUES
    ('Pushkin', 'Alexander'); -- Вводимые данные.

INSERT INTO [author]
-- Указание порядка записи данных отсутствует, значит используем порядок по умолчанию.
VALUES
    ('Alexander', 'Pushkin'); -- Вводимые данные.
-- В атрибут с auto_increment можно записать значение

INSERT INTO [author]
VALUES
-- Допускается оставлять пустыми поля помеченные ограничением NULL 
    (NULL, 'Pushkin'); -- Вводимые данные.
    
INSERT INTO [author]
VALUES 
 -- Нельзя оставлять пустыми поля помеченные ограничением NOT NULL
    ('Alexander', NULL); -- Вводимые данные.

INSERT INTO [author]
    (first_name, last_name) 
VALUES -- Допускается вводить несколько строк одновременно
    ('Alexander', 'Pushkin'),
    ('Alexander', 'Pushkin II');

INSERT INTO [author] 
VALUES -- Указание порядка записи данных для несколиких строк не обязательно
    ('Alexander', 'Pushkin III'),
    ('Alexander', 'Pushkin IV');

DELETE FROM author 
WHERE
    last_name LIKE 'Pushkin%';