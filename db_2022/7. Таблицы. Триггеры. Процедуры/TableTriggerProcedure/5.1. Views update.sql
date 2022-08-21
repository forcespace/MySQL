use library

DROP VIEW IF EXISTS dbo.issuance_detail
GO  

-- �������� View. ��������� ���������� � �������.
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

-- ���������� ������ �� view. �����
UPDATE issuance_detail
SET issue_date = DATEADD(day, 1, [issue_date]) 
WHERE id_issuance = 1

-- ���������� ������ 2. �����
BEGIN  TRANSACTION

UPDATE issuance_detail
SET book = 'New Book Name'
WHERE id_issuance = 1

SELECT * FROM book
WHERE id_book IN (
	SELECT id_book FROM copy 
	JOIN issuance ON copy.id_copy = issuance.id_copy
	WHERE id_issuance = 1
)
ROLLBACK

-- ���������� ������ 3. 
-- ������. ������ ��������� ��������� �������.
-- Update or insert of view or function 'issuance_detail' failed because it contains a derived or constant field.
UPDATE issuance_detail
SET reader = 'New Reader Name'
WHERE id_issuance = 1


-- �������� ������ ����� View. 
-- ������. 
-- View or function 'issuance_detail' is not updatable because the modification affects multiple base tables.
DELETE FROM issuance_detail WHERE id_issuance = 1