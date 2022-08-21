USE bank

-- Пример 1. Отсутствие грязного чтения
-- 1
BEGIN TRANSACTION

UPDATE account
SET balance = balance + 5
WHERE id = 1

-- 3
ROLLBACK



-- Пример 2. Невоспроизводимое чтение

-- Писатели блокируют читателей

-- 2.
BEGIN TRANSACTION

UPDATE account
SET balance = balance + 5
WHERE id = 1

COMMIT
