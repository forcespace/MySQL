use library

-- �������� ��������� c �����������
CREATE PROCEDURE reader_procedure_with_params
	@startId AS INT,
	@endId AS INT,
	@total_cnt AS INT OUTPUT
AS
    SELECT *
    FROM reader
	WHERE id_reader >= @startId AND id_reader <= @endId

	SELECT @total_cnt = @@ROWCOUNT;
GO

-- ����� ��������� � �����������
DECLARE @cnt AS INT = NULL;

EXECUTE reader_procedure_with_params @startId = 1, @endId = 1000, @total_cnt = @cnt OUTPUT;

SELECT @cnt AS total_rows

-- �������� ���������
IF OBJECT_ID('reader_procedure_with_params','P') IS NOT NULL
	DROP PROC reader_procedure_with_params
GO