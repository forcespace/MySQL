use library

-- �������� View
DROP VIEW IF EXISTS dbo.reader_rating
GO  

CREATE VIEW reader_rating 
WITH SCHEMABINDING
AS
SELECT 
	r.id_reader, 
	(SELECT ri.last_name + ' ' + ri.first_name FROM dbo.reader AS ri 
		WHERE ri.id_reader = r.id_reader) AS name,
	COUNT(*) AS  quantity
FROM dbo.reader AS r
LEFT JOIN dbo.issuance AS i ON i.id_reader = r.id_reader
GROUP BY r.id_reader

GO

SELECT * FROM reader_rating

-- �������� ������� �������
DROP TABLE issuance


-- �������� View
DROP VIEW IF EXISTS dbo.reader_rating
GO

-- ������� ��������������� �������������
CREATE VIEW reader_rating 
WITH SCHEMABINDING
AS
SELECT 
    -- ��������� ����������
	r.id_reader, r.first_name, r.last_name,
	-- ���������� COUNT_BIG
	COUNT_BIG(*) AS  quantity
FROM dbo.reader AS r
-- �������� ������ INNER JOIN
INNER JOIN dbo.issuance AS i ON i.id_reader = r.id_reader
GROUP BY r.id_reader, r.first_name, r.last_name

-- ������� ������ ��� �������������
CREATE UNIQUE CLUSTERED INDEX IU_reader_rating_id_reader 
	ON reader_rating(id_reader)

-- ��������� ���� ���������� �������
SELECT * FROM reader_rating