use library

-- Выборка данных

WITH reader_rating_cte (id, name, rating)
AS (
	SELECT 
		r.id_reader,
		(SELECT r1.first_name FROM reader AS r1 WHERE r1.id_reader = r.id_reader),
		COUNT(*)
	 FROM reader AS r
	 LEFT JOIN issuance AS i ON r.id_reader = i.id_reader
	 GROUP BY r.id_reader
)
SELECT TOP 10 * FROM reader_rating_cte ORDER BY rating DESC

GO

-- Пример обновление данных

BEGIN  TRANSACTION

WITH reader_rating_cte (id_reader, name, rating)
AS (
	SELECT 
		r.id_reader,
		(SELECT r1.first_name FROM reader AS r1 WHERE r1.id_reader = r.id_reader),
		COUNT(*)
	 FROM reader AS r
	 LEFT JOIN issuance AS i ON r.id_reader = i.id_reader
	 GROUP BY r.id_reader
)
UPDATE reader SET first_name = first_name + N' Best'
WHERE id_reader IN ( SELECT TOP 10 id_reader FROM reader_rating_cte ORDER BY rating DESC )

ROLLBACK