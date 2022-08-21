use library

-- Изменение запроса не всегда влечет изменение плана выполнения
SELECT chb.id_category, COUNT (*) FROM book b
JOIN category_has_book chb ON b.id_book = chb.id_book
WHERE b.id_book = 1 OR b.id_book = 2 OR b.id_book = 3 OR b.id_book = 4
GROUP BY chb.id_category
ORDER BY 1 DESC

SELECT chb.id_category, COUNT (*) FROM book b
JOIN category_has_book chb ON b.id_book = chb.id_book
WHERE b.id_book IN (1, 2, 3, 4)
GROUP BY chb.id_category
ORDER BY 1 DESC

-- Порядок в JOIN 
SELECT * FROM book b
JOIN author_has_book ahb ON b.id_book = ahb.id_book
JOIN author a ON a.id_author = ahb.id_author

SELECT * FROM author_has_book ahb
JOIN book b ON b.id_book = ahb.id_book
JOIN author a ON a.id_author = ahb.id_author

SELECT * FROM author_has_book ahb
JOIN author a ON a.id_author = ahb.id_author
JOIN book b ON b.id_book = ahb.id_book

-- Условие соединения
SELECT * FROM author_has_book ahb
JOIN book b ON b.id_book = ahb.id_book
WHERE b.id_book >= 1 AND b.id_book <= 100

SELECT * FROM author_has_book ahb
JOIN book b ON b.id_book = ahb.id_book AND b.id_book >= 1 AND b.id_book <= 100
