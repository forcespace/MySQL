USE bank

-- 2.
BEGIN TRANSACTION

INSERT
INTO	account (owner, balance)
VALUES	
	(N'������ �������', 100)
GO

COMMIT