use library

/* ����� ���������� � ��������, ���������� ����������� ����, ������� ���� ������������� �� ������ */
SELECT 
	i.id_reader,
	(SELECT first_name FROM reader r WHERE r.id_reader = i.id_reader) AS first_name,
	(SELECT last_name FROM reader r WHERE r.id_reader = i.id_reader) AS last_name,
	(SELECT reader_num FROM reader r WHERE r.id_reader = i.id_reader) AS reader_num,
	COUNT(i.id_copy) AS book_cnt,
	SUM( (DATEDIFF(day, i.issue_date, i.release_date)) ) AS total_days
 FROM issuance i 
 GROUP BY i.id_reader
 
-- ������� ��������� �������
CREATE TABLE #reader_rating (
	id int,
	first_name varchar(50),
	last_name varchar(50),
	reader_num varchar(50),
	book_cnt int,
	total_days int,
)

-- ��������� ������
INSERT #reader_rating (id, book_cnt, total_days)
SELECT 
	i.id_reader,
	COUNT(i.id_copy) AS book_cnt,
	SUM( (DATEDIFF(day, i.issue_date, i.release_date)) ) AS total_days
 FROM issuance i 
 GROUP BY i.id_reader

 -- ������ � ���� ������, �� �� ������ � ������ ������
SELECT * FROM #reader_rating ORDER BY id 

 -- ��������� ������� �����������
UPDATE #reader_rating 
SET #reader_rating.first_name = r.first_name, #reader_rating.last_name = r.last_name, #reader_rating.reader_num = r.reader_num
FROM reader AS r 
WHERE #reader_rating.id = r.id_reader

-- ������� ������ �� �������
DELETE FROM #reader_rating

-- ������� ��������� �������
DROP TABLE #reader_rating