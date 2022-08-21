use library

-- объявляем переменную
DECLARE @cnt INT;

-- присвоение значения переменной
SET @cnt = 3;

-- чтение через SELECT
SELECT @cnt 


-- использование переменной в запросе
DECLARE @id INT;
SET @id = 3

SELECT * FROM reader WHERE id_reader = @id