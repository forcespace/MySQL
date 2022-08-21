
-- Выполняем построчно и смотрим результат
USE bank

BEGIN TRANSACTION

DELETE
FROM	account

SELECT	*
FROM	account

ROLLBACK


SELECT	*
FROM	account