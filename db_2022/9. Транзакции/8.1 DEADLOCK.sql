
USE bank

-- Транзакция #1
BEGIN TRANSACTION
UPDATE account SET balance = 45 WHERE id = 1;
UPDATE account SET balance = 19 WHERE id = 2;
COMMIT;