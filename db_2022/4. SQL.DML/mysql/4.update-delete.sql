-- ���������� ������ � ������� author
INSERT INTO `author`             -- �������� ����� INTO ����� �� ������������.
    (first_name, last_name) -- �������� ������� ������ ������.
VALUES
    ('Alexander', 'Pushkin'); -- �������� ������.
    
--------------------------------------------------------------------------
--	      �������� UPDATE (���������(����������) ������ � �������)
--------------------------------------------------------------------------

UPDATE `author`
SET first_name = 'Alexander I' -- �������� ��� ����,
WHERE last_name = 'Pushkin'	-- ��� ������� 'Pushkin'

SELECT * FROM `author` ORDER BY id_author DESC;


INSERT INTO `author`
VALUES (1002, NULL, 'Pushkin V'); 

-- �������� �������� �������� ����� � ���������� ��������
UPDATE `author`
SET first_name = 'Alexander',
	last_name = 'Pushkin'
WHERE id_author = 1002

SELECT * FROM `author` ORDER BY id_author DESC;


UPDATE `author`
SET first_name =  -- ���� �� ������ ���������� WHERE, �� ���������� ���� ������� �� ��������� ��������

SELECT * FROM `author`;

--------------------------------------------------------------------------
--	          �������� DELETE (�������� ������ �� �������)
--------------------------------------------------------------------------

-- ������� ���� ������������� ��� ������� Alexander
DELETE `author` 
WHERE first_name = 'Alexander';
SELECT * FROM `author`;

-- �������� ���� ������ �� ������� � ������� DELETE.
DELETE `author`;
SELECT * FROM `author`;

-- ��� �������� ���� ������ �� ������� ����� ������������ - TRUNCATE TABLE,
-- ��� ��� TRUNCATE ������� ���������� �� ���� ������� ��� ����������� DELETE.
TRUNCATE TABLE `author`;
SELECT * FROM `author`;