USE bank

--DBCC USEROPTIONS

-- ������ 1. ����������� ����������������� ������

SET	TRANSACTION ISOLATION LEVEL
	REPEATABLE READ

-- 1.
BEGIN TRANSACTION

SELECT * FROM account
WHERE id = 1

-- 3.
-- WAIT ������ �������� ������
SELECT * FROM account
WHERE id = 1

COMMIT


-- ������ 2. ��������� ������

-- 1.
SET	TRANSACTION ISOLATION LEVEL
	REPEATABLE READ
	
BEGIN TRANSACTION

SELECT	SUM(balance)
FROM		account

-- 3.
SELECT	SUM(balance)
FROM		account

COMMIT