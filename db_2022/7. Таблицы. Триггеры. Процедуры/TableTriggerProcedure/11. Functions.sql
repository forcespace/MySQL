use library

-- создание табличной функции
CREATE FUNCTION reader_issuance ( @id_reader INT )
RETURNS TABLE
AS
RETURN
    SELECT * FROM issuance
	WHERE id_reader = @id_reader
GO

-- использование функции
SELECT * FROM reader_issuance(100)
WHERE id_issuance = 132

-- удаление функции
DROP FUNCTION reader_issuance;
GO





-- создание скалярной функции
CREATE FUNCTION reader_rating_func (@id_reader INT)
RETURNS int
BEGIN
	DECLARE @rating INT;

	SELECT @rating = COUNT(*) FROM issuance 
	WHERE id_reader = @id_reader
	GROUP BY id_reader

	RETURN(@rating);
END;
GO

-- использование функции
SELECT *, [dbo].reader_rating_func(id_reader) as rating FROM reader

-- удаление функции
DROP FUNCTION reader_rating_func;
GO
