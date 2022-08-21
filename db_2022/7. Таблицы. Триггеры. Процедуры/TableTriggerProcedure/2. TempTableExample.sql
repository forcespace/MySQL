use library

/* Найти информацию о читателе, количество прочитанных книг, сколько дней потребовалось на чтение */
SELECT 
	i.id_reader,
	(SELECT first_name FROM reader r WHERE r.id_reader = i.id_reader) AS first_name,
	(SELECT last_name FROM reader r WHERE r.id_reader = i.id_reader) AS last_name,
	(SELECT reader_num FROM reader r WHERE r.id_reader = i.id_reader) AS reader_num,
	COUNT(i.id_copy) AS book_cnt,
	SUM( (DATEDIFF(day, i.issue_date, i.release_date)) ) AS total_days
 FROM issuance i 
 GROUP BY i.id_reader
 
-- Создаем временную таблицу
CREATE TABLE #reader_rating (
	id int,
	first_name varchar(50),
	last_name varchar(50),
	reader_num varchar(50),
	book_cnt int,
	total_days int,
)

-- Вставляем данные
INSERT #reader_rating (id, book_cnt, total_days)
SELECT 
	i.id_reader,
	COUNT(i.id_copy) AS book_cnt,
	SUM( (DATEDIFF(day, i.issue_date, i.release_date)) ) AS total_days
 FROM issuance i 
 GROUP BY i.id_reader

 -- Читаем в этой сессии, но не сможем в другой сессии
SELECT * FROM #reader_rating ORDER BY id 

 -- Дополняем таблицу информацией
UPDATE #reader_rating 
SET #reader_rating.first_name = r.first_name, #reader_rating.last_name = r.last_name, #reader_rating.reader_num = r.reader_num
FROM reader AS r 
WHERE #reader_rating.id = r.id_reader

-- Удаляем данный из таблицы
DELETE FROM #reader_rating

-- Удаляем временную таблицу
DROP TABLE #reader_rating