use library

-- ������� ������� 
CREATE TABLE test_table (
	a int,
	b int,
	c int
)

-- ��������� �� �������
INSERT
INTO		test_table
VALUES	
	(1, 1, 1),
	(2, 1, 1),
	(3, 1, 1),
	(4, 2, 1),
	(5, 2, 1),
	(6, 2, 1),
	(7, 3, 1),
	(8, 3, 1),
	(9, 3, 1),
	(10, 3, 1)

-- ��������� ������ � ��������� �������� ����������
SELECT * FROM test_table WHERE b = 3

-- ��������� ������ � ���������, ��� ��������� ����������
CREATE UNIQUE CLUSTERED INDEX [PK_test_table-a] ON [dbo].[test_table]
(
	[a] ASC
)

DROP TABLE IF EXISTS test_table