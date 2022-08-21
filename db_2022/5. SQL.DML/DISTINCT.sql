-- DISTINCT

SELECT * FROM book

SELECT DISTINCT name FROM book

-- количество уникальных книг в библиотеке
SELECT COUNT(DISTINCT name) as book_count FROM book

-- уникальные пары
SELECT DISTINCT id_book, name FROM book

-- нахождение уникальных
SELECT name 
FROM book
GROUP BY name