--------------------------------------------------------------------------
--				������������� ������. ����������� GROUP BY
--------------------------------------------------------------------------
-- ���������� ������� ������ �� �������� id_book � page_num, 
-- ������� book, ��� �������� ����� ������� id_book
-- ��������� ������ �� �������� ���� (1, 2, 3)
SELECT id_book, page_num 
FROM book
WHERE id_book IN (1, 2, 3);

-- ���������� ������� ������ �� ������� id_book 
-- � ������������� �������� �������������� ������� SUM �� ������� page_num, 
-- ������� book, ��� �������� ����� ������� id_book
-- ��������� ������ �� �������� ���� (1, 2, 3),
SELECT id_book, SUM(page_num) -- �������������� ������� SUM()
FROM book
WHERE id_book IN (1, 2, 3)

-- ���������� ������� ������
-- � ������������� �������� �������������� ������� SUM �� ������� page_num, 
-- ������� book, ��� �������� ����� ������� publication_year
-- ��������� ������ �� �������� ���� (1901, 1902, 1903),
-- ��� ���� ������������ ����������� �� ��������� ������� publication_year. 
-- ������������� - ������� ����������� ���������
SELECT publication_year, SUM(page_num) -- �������������� ������� SUM()
FROM book
WHERE publication_year IN (1901, 1902, 1903)
GROUP BY publication_year; 


SELECT publication_year, SUM(page_num) AS total -- ����� ��������� ����� AS ������ ���������(alias) ��� ���������� ������� SUM().
FROM book
WHERE publication_year IN (1901, 1902, 1903)
GROUP BY publication_year; -- ������������� ������.


-- ����������  ������� ������������� �������� �������������� ������� COUNT ������� book.
SELECT COUNT(*) AS books
FROM book; -- �������������� ������� COUNT() ������� ���������� ����� � �������

-- ���������� ������� ������ �� ������� ProductID � ������������� �������� �������������� ������� COUNT,
-- ������� issuance, ��� ���� ������������ ����������� �� ��������� ������� ProductID.
SELECT 
    publication_year, COUNT(*)
FROM
    book
GROUP BY publication_year
--------------------------------------------------------------------------

-- ���������� ������� ������ �� ������� publication_year � ������������� �������� �������������� ������� COUNT,
-- ������� book, ��� ���� ������������ ����������� �� ��������� ������� publication_year,
-- ��� ������������ �������� �������������� ������� COUNT ������ 4.
SELECT publication_year, COUNT(*) AS `count`
FROM
    book
GROUP BY publication_year
HAVING COUNT(*) > 4;	-- HAVING - ������ �������������� ��������� � GROUP BY (HAVING ���������� WHERE).
						-- HAVING - ������� ����������� ������ � �������.
--------------------------------------------------------------------------

-- ������. HAVING - ������ �������������� ��������� � GROUP BY.
SELECT id_book AS book
FROM book
HAVING id_book > 10; -- ������������ ������������� HAVING (��� GROUP BY)

-- WHERE �������� �� �����������, � HAVING �������� ������ � ������������.
SELECT publication_year, COUNT(page_num)
FROM book
WHERE publication_year IN (1901, 1902, 1903)
GROUP BY publication_year
HAVING COUNT(*) > 5;