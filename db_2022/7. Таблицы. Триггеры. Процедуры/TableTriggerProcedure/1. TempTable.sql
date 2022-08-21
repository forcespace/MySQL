use library

-- ������� ��������� ��������� �������
CREATE TABLE #localtemp (
	id int,
	name varchar(50)
)

DROP TABLE #localtemp
GO

-- ������ ������ �� ��������� �������
-- ��������� � ������ ���������� �� ���������
SELECT * FROM #localtemp

-- ����������� ������ �� ��������� �������
INSERT INTO #localtemp 
VALUES (1, 'Hello World!')


-- ������� ��������� ��������� �������
CREATE TABLE ##globaltemp (
	id int,
	name varchar(50)
)

-- ������ ������ �� ��������� �������
-- ��������� � ������ ���������� ���������
SELECT * FROM ##globaltemp
