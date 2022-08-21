USE bank

SET	XACT_ABORT ON

BEGIN TRANSACTION
	UPDATE	account
	SET			balance = balance - 5
	WHERE	id = 1

	UPDATE	account
	SET			balance = balance + 5
	WHERE	id = 2

	-- SELECT 5/0

COMMIT

GO

SELECT	*
FROM account

-- отменить действия транзакции
ROLLBACK