USE bank

--DBCC USEROPTIONS

-- Пример 1. Отсутствует невоспроизводимое чтение

SET	TRANSACTION ISOLATION LEVEL
	REPEATABLE READ

-- 1.
BEGIN TRANSACTION

SELECT * FROM account
WHERE id = 1

-- 3.
-- WAIT пример грязного чтения
SELECT * FROM account
WHERE id = 1

COMMIT


-- Пример 2. Фантомные чтения

-- 1.
SET	TRANSACTION ISOLATION LEVEL
	REPEATABLE READ
	
BEGIN TRANSACTION

SELECT	SUM(balance)
FROM		account

-- 3.
SELECT	SUM(balance)
FROM		account

COMMIT