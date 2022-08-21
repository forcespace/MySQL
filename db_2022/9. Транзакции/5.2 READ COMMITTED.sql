USE bank

-- Пример 1. Отсутствие грязного чтения
-- 2.
SET TRANSACTION ISOLATION LEVEL
    READ COMMITTED

BEGIN TRANSACTION

SELECT * FROM account
WHERE id = 1

-- 4.
COMMIT


-- Пример 2. Невоспроизводимое чтение

-- Читатели блокируют писателей

-- 1.
BEGIN TRANSACTION

SELECT * FROM account
WHERE id = 1

-- 3.
-- WAIT пример грязного чтения
SELECT * FROM account
WHERE id = 1

COMMIT