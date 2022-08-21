--------------------------------------------------------------------------
--				����������� ORDER BY - ����������� ��...
--------------------------------------------------------------------------

-- ���������� ������� ������
-- ��� ������ ����������� �� ������� first_name, ������� `author`
SELECT first_name, last_name 
FROM `author`
ORDER BY first_name;  -- ����������� �� �����.

-- ���������� ������� ������
-- ��� ������ ����������� �� ������� last_name, ������� `author`
SELECT *
FROM `author`
ORDER BY last_name;  -- ����������� �� last_name

-- ���������� ������� ������  
-- ��� ������ ����������� �� �������� last_name � first_name, ������� `author`
SELECT *
FROM `author`
ORDER BY last_name, first_name;  -- C���������� �� ����� � �������

-- ���������� ������� ������
-- ��� ������ ����������� �� ������� first_name, ������� `author`
SELECT *
FROM `author`
ORDER BY first_name ASC; -- ���������� �� �����������. ASC - �� ���������.

-- ���������� ������� ������,
-- ��� ������ ����������� � ������� ��������, �� ������� first_name
SELECT *
FROM `author`
ORDER BY first_name DESC; -- ���������� �� ��������.

-- ���������� ������� ������
-- ��� ������ ����������� �� ������� first_name, ������� `author`
SELECT first_name, last_name 
FROM `author`
ORDER BY 1;  -- ����������� �� �����.