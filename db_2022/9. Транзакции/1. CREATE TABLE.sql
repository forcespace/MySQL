USE bank

CREATE TABLE account
	(
	id int IDENTITY (1, 1) PRIMARY KEY,
	owner nvarchar (100) NOT NULL,
	balance money NOT NULL DEFAULT (0)
	)

GO

INSERT
INTO	account (owner, balance)
VALUES	
	(N'���� ������', 100),
	(N'���� ������', 100)

GO

TRUNCATE TABLE account

GO