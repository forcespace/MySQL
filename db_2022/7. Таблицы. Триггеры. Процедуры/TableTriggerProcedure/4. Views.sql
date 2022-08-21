use library

-- удаление View
DROP VIEW IF EXISTS dbo.issuance_detail
GO  

-- создание View. Детальная информация о выдачах.
CREATE VIEW issuance_detail AS
SELECT [id_issuance]
      , r.last_name + ' ' + r.first_name as reader
      , b.name as book
      ,[issue_date]
      ,[release_date]
      ,[deadline_date]
  FROM [issuance] AS i
  LEFT JOIN reader AS r ON i.id_reader = r.id_reader
  LEFT JOIN copy AS c ON c.id_copy = i.id_copy
  LEFT JOIN book AS b ON b.id_book = c.id_book
GO

-- извлечение данных
SELECT * FROM issuance_detail
