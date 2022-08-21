use library

-- —оздаем локальную временную таблицу
CREATE TABLE #localtemp (
	id int,
	name varchar(50)
)

DROP TABLE #localtemp
GO

-- „итаем данные из временной таблицы
-- ѕрочитать в другом соединении не получитс€
SELECT * FROM #localtemp

-- «аписвываем данные во временную таблицу
INSERT INTO #localtemp 
VALUES (1, 'Hello World!')


-- —оздаем локальную временную таблицу
CREATE TABLE ##globaltemp (
	id int,
	name varchar(50)
)

-- „итаем данные из временной таблицы
-- ѕрочитать в другом соединении получитс€
SELECT * FROM ##globaltemp
