-- DISTINCT

SELECT * FROM book

SELECT DISTINCT name FROM book

-- ���������� ���������� ���� � ����������
SELECT COUNT(DISTINCT name) as book_count FROM book

-- ���������� ����
SELECT DISTINCT id_book, name FROM book

-- ���������� ����������
SELECT name 
FROM book
GROUP BY name