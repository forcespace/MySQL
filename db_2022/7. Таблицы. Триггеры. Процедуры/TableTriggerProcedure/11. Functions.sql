use library

-- �������� ��������� �������
CREATE FUNCTION reader_issuance ( @id_reader INT )
RETURNS TABLE
AS
RETURN
    SELECT * FROM issuance
	WHERE id_reader = @id_reader
GO

-- ������������� �������
SELECT * FROM reader_issuance(100)
WHERE id_issuance = 132

-- �������� �������
DROP FUNCTION reader_issuance;
GO





-- �������� ��������� �������
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

-- ������������� �������
SELECT *, [dbo].reader_rating_func(id_reader) as rating FROM reader

-- �������� �������
DROP FUNCTION reader_rating_func;
GO
