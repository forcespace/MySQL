use library

SET STATISTICS TIME ON
SET STATISTICS IO ON

SELECT chb.id_category, COUNT (*) FROM book b
JOIN category_has_book chb ON b.id_book = chb.id_book
WHERE b.id_book < 300
GROUP BY chb.id_category
ORDER BY 2 DESC
