USE bank

-- ������ 1. ���������� �������� ������
-- 2.
SET TRANSACTION ISOLATION LEVEL
    READ COMMITTED

BEGIN TRANSACTION

SELECT * FROM account
WHERE id = 1

-- 4.
COMMIT


-- ������ 2. ����������������� ������

-- �������� ��������� ���������

-- 1.
BEGIN TRANSACTION

SELECT * FROM account
WHERE id = 1

-- 3.
-- WAIT ������ �������� ������
SELECT * FROM account
WHERE id = 1

COMMIT