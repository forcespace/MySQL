use library

-- ��������� ������
DECLARE reader_rating_�ursor CURSOR FAST_FORWARD FOR
  SELECT TOP 5 id_reader, COUNT(id_reader) FROM issuance
  GROUP BY id_reader
  HAVING COUNT(id_reader) > 3
  ORDER BY 2 DESC, 1 ASC;

-- ��������� ������
OPEN reader_rating_�ursor;

DECLARE
  @id_reader         AS INT      = NULL,
  @rating            AS INT      = NULL;

-- ��������� ������ �� �������
FETCH NEXT FROM reader_rating_�ursor INTO @id_reader, @rating;

-- ��������� ������
SELECT @@fetch_status

-- ������� ���������� ����������
SELECT @id_reader, @rating
GO

-- ��������� � ������� ������
CLOSE reader_rating_�ursor;
DEALLOCATE reader_rating_�ursor;