-- Подзапросы

-- Найти авторов, которые написали более 3 книг
SELECT * FROM author
LEFT JOIN author_has_book AS ahb ON ahb.id_author = author.id_author
GROUP BY author.id_author
HAVING COUNT(*) > 3

-- Осторожно! На каждую запись из основного запроса будет делатся по 2 запроса к таблице author
SELECT 
	author.id_author, 
	(SELECT first_name FROM author AS a WHERE author.id_author = a.id_author) AS first_name,
	(SELECT last_name FROM author AS a WHERE author.id_author = a.id_author) AS last_name
FROM author
LEFT JOIN author_has_book AS ahb ON ahb.id_author = author.id_author
GROUP BY author.id_author
HAVING COUNT(*) > 3

-- Лучший вариант
SELECT * FROM author
WHERE id_author IN (
    SELECT id_author FROM author_has_book 
    GROUP BY id_author
    HAVING COUNT(*) > 3
);



-- Найти все книги у которых есть экземпляр в библиотеке
-- Осторожно! Коррелирующий подзапрос
SELECT * FROM book
WHERE EXISTS (
	SELECT * FROM copy
	WHERE copy.id_book = book.id_book
)

-- Не коррелирующий подзапрос
SELECT * FROM book
WHERE id_book IN (
	SELECT id_book FROM copy
)

-- Найти все книги у которых нет экземпляра в библиотеке
SELECT * FROM book
WHERE NOT EXISTS (
	SELECT * FROM copy
	WHERE copy.id_book = book.id_book
)

SELECT * FROM book
WHERE id_book NOT IN (
	SELECT id_book FROM copy
)

SELECT * FROM author
WHERE NOT EXISTS (
    SELECT * FROM author_has_book 
    WHERE author.id_author = author_has_book.id_author
);


SELECT * FROM author
WHERE id_author NOT IN (
    SELECT DISTINCT id_author FROM author_has_book
);


