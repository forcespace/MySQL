use library

-- удаление View
DROP VIEW IF EXISTS dbo.first_100_readers
GO  

CREATE VIEW first_100_readers AS
SELECT TOP 100 * FROM reader ORDER BY id_reader ASC

GO


SELECT * FROM first_100_readers


-- Вставляем данные. 

BEGIN  TRANSACTION

INSERT first_100_readers 
(first_name, last_name, reader_num)
VALUES
('Ivan', 'Ivanov', 38929)
GO

SELECT * FROM reader WHERE reader_num = 38929

ROLLBACK



-- удаление View
DROP VIEW IF EXISTS dbo.first_100_readers
GO  

-- создаем View с проверкой на изменение записей
CREATE VIEW first_100_readers AS
SELECT TOP 100 * FROM reader ORDER BY id_reader ASC

WITH CHECK OPTION
GO

-- получаем ошибку, т.к. новая запись не соответсвует условию выборки VIEW
-- Cannot update the view "first_100_readers" because it or a view it references was created with WITH CHECK OPTION and its definition contains a TOP or OFFSET clause.
INSERT first_100_readers 
(first_name, last_name, reader_num)
VALUES
('Ivan', 'Ivanov', 38923)

GO

DROP VIEW IF EXISTS dbo.first_100_readers
GO  