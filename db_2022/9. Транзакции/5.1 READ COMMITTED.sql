USE bank

-- ������ 1. ���������� �������� ������
-- 1
BEGIN TRANSACTION

UPDATE account
SET balance = balance + 5
WHERE id = 1

-- 3
ROLLBACK



-- ������ 2. ����������������� ������

-- �������� ��������� ���������

-- 2.
BEGIN TRANSACTION

UPDATE account
SET balance = balance + 5
WHERE id = 1

COMMIT
