USE bank

BEGIN TRANSACTION

UPDATE	account
SET			balance = balance + 5
WHERE	id = 1

COMMIT


SELECT	*
FROM		account
WHERE	id = 1
