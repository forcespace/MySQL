USE bank

-- ������ 1. ����������� ����������������� ������

-- 2.
BEGIN TRANSACTION

UPDATE account
SET balance = balance + 5
WHERE id = 1

COMMIT


-- ������ 2. ��������� ������

-- 2.
BEGIN TRANSACTION

INSERT
INTO	 account (owner, balance)
VALUES	
	(N'������ �������', 100)
GO

COMMIT