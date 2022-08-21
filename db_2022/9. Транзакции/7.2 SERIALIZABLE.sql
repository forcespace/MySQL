USE bank

-- 2.
BEGIN TRANSACTION

INSERT
INTO	account (owner, balance)
VALUES	
	(N'Андрей Андреев', 100)
GO

COMMIT