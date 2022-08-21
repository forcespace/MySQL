use library

-- Разные виды JOIN

SELECT * FROM author_has_book ahb
INNER LOOP JOIN book b ON b.id_book = ahb.id_book

SELECT * FROM author_has_book ahb
INNER MERGE JOIN book b ON b.id_book = ahb.id_book

SELECT * FROM author_has_book ahb
INNER HASH JOIN book b ON b.id_book = ahb.id_book

SELECT * FROM author_has_book ahb
INNER JOIN book b ON b.id_book = ahb.id_book