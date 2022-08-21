use library

-- создание процедуры
CREATE PROCEDURE reader_procedure
AS   
    SELECT *
    FROM reader
GO

-- вызов процедуры
EXECUTE reader_procedure

-- удаление процедуры
IF OBJECT_ID('reader_procedure','P') IS NOT NULL
	DROP PROC reader_procedure
GO