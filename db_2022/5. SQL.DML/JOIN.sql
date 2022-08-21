-- INNER JOIN
-- Все книги в библиотеке
SELECT * FROM copy
-- INNER JOIN book ON copy.id_book = book.id_book
JOIN book ON copy.id_book = book.id_book

-- получим тот же самый результат
SELECT * FROM book
JOIN copy ON copy.id_book = book.id_book

SELECT * FROM copy ORDER BY id_book
SELECT * FROM book

SELECT book.id_book, id_copy, name FROM copy
JOIN book ON copy.id_book = book.id_book


-- Декартово произведение
-- Не работает в MSSQL
SELECT * FROM book
JOIN copy
GO

-- Не работает в MSSQL
SELECT * FROM book
JOIN copy USING(id_book)
GO

-- LEFT JOIN
-- Только те книги, которые представлены в библиотеке
SELECT * FROM copy
LEFT JOIN book ON copy.id_book = book.id_book

-- Найти все книги и их копии
SELECT * FROM book
LEFT JOIN copy ON book.id_book = copy.id_book

-- Найти книги без копии в библиотеке
SELECT * FROM book
LEFT JOIN copy ON book.id_book = copy.id_book
WHERE copy.id_copy IS NULL

SELECT COUNT (DISTINCT id_book) AS copy_cnt FROM copy
SELECT COUNT (DISTINCT id_book) AS book_cnt FROM book

-- RIGHT JOIN
SELECT * FROM copy 
RIGHT JOIN book ON book.id_book = copy.id_book

SELECT * FROM book
LEFT JOIN copy ON book.id_book = copy.id_book

-- FULL OUTER JOIN
SELECT * FROM copy 
FULL OUTER JOIN book ON book.id_book = copy.id_book


-- Пример запроса более чем с 2 таблицами
-- Сколько прочитал каждый читатель
SELECT reader.id_reader, SUM(book.page_num) AS total_page FROM reader 
LEFT JOIN issuance ON reader.id_reader = issuance.id_reader
LEFT JOIN copy ON copy.id_copy = issuance.id_copy
LEFT JOIN book ON book.id_book = copy.id_book
GROUP BY reader.id_reader
ORDER BY 2 DESC