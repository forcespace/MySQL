use library

-- �������� ���������
CREATE PROCEDURE reader_procedure
AS   
    SELECT *
    FROM reader
GO

-- ����� ���������
EXECUTE reader_procedure

-- �������� ���������
IF OBJECT_ID('reader_procedure','P') IS NOT NULL
	DROP PROC reader_procedure
GO