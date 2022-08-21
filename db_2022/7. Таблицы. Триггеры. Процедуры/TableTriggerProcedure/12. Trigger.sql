use library

-- �������� ��������
CREATE TRIGGER issuance_check
ON issuance
AFTER INSERT, UPDATE
AS
    IF (ROWCOUNT_BIG() = 0)
    RETURN;
    -- ��������� ������������� ���������� �������
    IF EXISTS (SELECT * FROM issuance WHERE issue_date > deadline_date)
    BEGIN  
        -- ������ ������ � ���������� ���������
        RAISERROR ('issue_date could not be greater then deadline_date', 16, 1);  
        ROLLBACK TRANSACTION;  
        RETURN   
    END;  
GO 

-- ������� ������� ������
INSERT INTO issuance
	([id_copy], [id_reader], [issue_date], [release_date], [deadline_date])
VALUES
	(2, 3, '2020-04-01', '2020-04-10', '2020-03-01')
GO

-- ���������/���������� ��������
DISABLE TRIGGER issuance_check ON issuance
GO

ENABLE TRIGGER issuance_check ON issuance
GO

-- �������� ��������
DROP TRIGGER issuance_check