use library

-- Объявляем курсор
DECLARE reader_rating_сursor CURSOR FAST_FORWARD FOR
  SELECT TOP 5 id_reader, COUNT(id_reader) FROM issuance
  GROUP BY id_reader
  HAVING COUNT(id_reader) > 3
  ORDER BY 2 DESC, 1 ASC;

-- Открываем курсор
OPEN reader_rating_сursor;

DECLARE
  @id_reader         AS INT      = NULL,
  @rating            AS INT      = NULL;

-- Извлекаем данные из курсора
FETCH NEXT FROM reader_rating_сursor INTO @id_reader, @rating;

-- Проверяем статус
SELECT @@fetch_status

-- Смотрим содержимое переменных
SELECT @id_reader, @rating
GO

-- закрываем и удаляем курсор
CLOSE reader_rating_сursor;
DEALLOCATE reader_rating_сursor;