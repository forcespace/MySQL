--------------------------------------------------------------------------
--                     ������� ������. ������ SELECT 
--------------------------------------------------------------------------

-- ���������� ������� ���� ������ �� ������� `author`.
SELECT * FROM `author`; 

-- ���������� ������� ������ �� ������� first_name, ������� `author`
SELECT first_name FROM `author`; 

-- ���������� ������� ������ �� ������� last_name, ������� `author`
SELECT last_name FROM `author`; 

-- ���������� ������� ������ �� �������� first_name � last_name, ������� `author`
SELECT first_name, last_name FROM `author`;

--------------------------------------------------------------------------
--                         ����������� WHERE. 
--------------------------------------------------------------------------
-- ���������� ������� ���� ������ �� ������� book, ��� �������� ����� ������� id_book ����� 10.
SELECT * FROM book 
WHERE id_book = 10; -- � ����������� WHERE ��������� �������� ��������� (=)

-- ���������� ������� ���� ������ �� ������� book, ��� �������� ����� ������� id_book ������ 10.
SELECT * FROM book 
WHERE id_book < 10; -- � ����������� WHERE ��������� �������� ��������� (<)

-- ���������� ������� ���� ������ �� ������� book, 
-- ��� �������� ����� ������� id_book ����� � ��������� �� 1 �� 3 (������������).
SELECT * FROM book 
WHERE id_book BETWEEN 1 AND 3; -- � ����������� WHERE ��������� �������� �������� ���������.

-- ���������� ������� ������ �� ������� book,
-- ��� �������� ����� ������� publication_year ����� 1915 ��� 1925.
SELECT * FROM book 
WHERE publication_year = 1915 OR publication_year = 1925; -- ���������� �������� "���"

-- ���������� ������� ���� ������ �� ������� book, 
-- ��� �������� ����� ������� publication_year ����� � ��������� �� 1915 �� 1925 (������������).
SELECT * FROM book 
WHERE publication_year BETWEEN 1915 AND 1925; -- � ����������� WHERE ��������� �������� �������� ���������.

-- ���������� ������� ������ �� �������� name � publication_year, ������� book,
-- ��� �������� ����� ������� publication_year ����� 1915 � �������� ����� ������� name ����� 'Future Of The Nation'.
SELECT name, publication_year FROM book 
WHERE publication_year = 1915 AND name = 'Future Of The Nation'; -- ���������� �������� "�"

-- ���������� ������� ������ �� �������� name � publication_year, ������� book,
-- ��� �������� ����� ������� publication_year �� ����� 1925
SELECT name, publication_year FROM book 
WHERE NOT publication_year = 1925; -- ���������� �������� "��"


INSERT INTO `author`
VALUES (NULL, NULL, 'Pushkin'); -- �������� ������.

-- ���������� ������� ������,
-- ��� �������� ����� ������� first_name �� ����� NULL
SELECT * FROM `author` 
WHERE first_name IS NULL; 

-- ���������� ������� ������ �� �������� name � publication_year, ������� book,
-- ��� �������� ����� ������� name ������������� �������	'Future'
SELECT name, publication_year FROM book 
WHERE name LIKE 'Future'; -- LIKE - �������� �������� ������������ ��������� ������� - 'Future'

SELECT name, publication_year FROM book 
WHERE name = 'Future';

-- ���������� ������� ������ �� �������� name � publication_year, ������� book,
-- ��� �������� ����� ������� name ������������� �������	'Fut%'

SELECT name, publication_year FROM book 
WHERE name LIKE 'Fut%'; -- ����� ���� ����, ��� ���� ������� ���������� ��  'Fut', 
						   -- ���� % ��������� ������������ ���������� �������� ����� Fut.

SELECT name, publication_year FROM book 
WHERE name = 'Fut%';  -- ������� ������ ������ ��� ������ �������� ��� 'Fut%' ��� � �������
						  
-- ���������� ������� ������ �� �������� name � publication_year, ������� book,
-- ��� �������� ����� ������� name ������������� �������	'Lord Of Drea__'
SELECT name, publication_year FROM book 
WHERE name LIKE 'Lord Of Dre__'; -- _ - ������ ������������� ���������� ����� ���� ������ ����� Lord Of Dre 

-- ���������� ������� ������ �� �������� name � publication_year, ������� book,
-- ��� �������� ����� ������� name ������������� �������	'Lord Of Drea_'
SELECT name, publication_year FROM book 
WHERE name LIKE 'Lord Of Drea_'; -- ������ ������� ������?

-- ���������� ������� ������ �� �������� name � publication_year, ������� book,
-- ��� �������� ����� ������� name ������������� �������	'Lord Of Dre_d'
SELECT name, publication_year FROM book 
WHERE name LIKE 'Lord Of Dre_d';

-- ���������� ������� ������ �� �������� name � publication_year, ������� book,
-- ��� �������� ����� ������� name ������������� �������	'%ist%'
SELECT name, publication_year FROM book 
WHERE name LIKE '%ist%';

-- ���������� ������� ���� ������ �� ������� book, 
-- ��� �������� ����� ������� publication_year ��������� ������ �� �������� ���� (1900, 1901, 1902)
SELECT * FROM book WHERE publication_year IN (1900, 1901, 1902); -- IN (1900, 1901, 1902) ���������� �������� publication_year ������ 1900 ��� 1901 ��� 1902 

SELECT * FROM book
WHERE publication_year = 1900 OR publication_year = 1901 OR publication_year = 1902;

-- �������� LIMIT ��������� ������� ��������� ����� ����� �� �������. �������� LIMIT ������������ ������ � ����� �������.
SELECT * FROM book LIMIT 5; 

SELECT * FROM book LIMIT 5,10; -- ������ ������ 6-15
