
USE bank

-- Транзакция #2
BEGIN TRANSACTION
UPDATE account SET balance = 20 WHERE id = 2;
UPDATE account SET balance = 47 WHERE id = 1;
COMMIT;
