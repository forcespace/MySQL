USE bank

-- Пример 1. Отсутствует невоспроизводимое чтение

-- 2.
BEGIN TRANSACTION

UPDATE account
SET balance = balance + 5
WHERE id = 1

COMMIT


-- Пример 2. Фантомные чтения

-- 2.
BEGIN TRANSACTION

INSERT
INTO	 account (owner, balance)
VALUES	
	(N'Андрей Андреев', 100)
GO

COMMIT