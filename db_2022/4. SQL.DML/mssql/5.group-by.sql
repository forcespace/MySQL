--------------------------------------------------------------------------
--				Агрегирование данных. Конструкция GROUP BY
--------------------------------------------------------------------------
-- Производим выборку данных из столбцов id_book и page_num, 
-- таблицы book, где значения ячеек столбца id_book
-- равняются одному из значений ряда (1, 2, 3)
SELECT id_book, page_num 
FROM book
WHERE id_book IN (1, 2, 3);

-- Производим выборку данных из столбца id_book 
-- и возвращаемого значения агрегированной функции SUM по столбцу page_num, 
-- таблицы book, где значения ячеек столбца id_book
-- равняется одному из значений ряда (1, 2, 3),
SELECT id_book, SUM(page_num) -- Агрегированная функция SUM()
FROM book
WHERE id_book IN (1, 2, 3)


SELECT SUM(page_num) -- Агрегированная функция SUM()
FROM book

SELECT publication_year, page_num 
FROM book
WHERE publication_year IN (1901, 1902, 1903);


SELECT publication_year, SUM(page_num) AS ps
FROM book
WHERE publication_year IN (1901, 1902, 1903)
GROUP BY publication_year
HAVING SUM(page_num) > 3000

SELECT publication_year, page_num, SUM(page_num)  -- Агрегированная функция SUM()
FROM book
WHERE publication_year IN (1901, 1902, 1903)
GROUP BY publication_year, page_num


-- Производим выборку данных
-- и возвращаемого значения агрегированной функции SUM по столбцу page_num, 
-- таблицы book, где значения ячеек столбца publication_year
-- равняется одному из значений ряда (1901, 1902, 1903),
-- при этом производится группировка по значениям столбца publication_year. 
-- Агрегирование - процесс обьединения элементов
SELECT publication_year, page_num, SUM(page_num)  -- Агрегированная функция SUM()
FROM book
WHERE publication_year IN (1901, 1902, 1903)
GROUP BY publication_year, page_num;

SELECT publication_year, SUM(page_num) AS total -- После ключевого слова AS задаем псевдоним(alias) для результата функции SUM().
FROM book
WHERE publication_year IN (1901, 1902, 1903)
GROUP BY publication_year; -- Агрегирование данных.


-- Производим  выборку возвращаемого значения агрегированной функции COUNT таблицы book.
SELECT COUNT([first_name]) AS author
FROM author; -- Агрегированная функция COUNT() выводит количество строк в таблице

-- Производим выборку данных из столбца ProductID и возвращаемого значения агрегированной функции COUNT,
-- таблицы issuance, при этом производится группировка по значениям столбца ProductID.
SELECT 
    publication_year, COUNT(*) AS cnt
FROM
    book
WHERE COUNT(*) > 5
GROUP BY publication_year
--------------------------------------------------------------------------

-- Производим выборку данных из столбца publication_year и возвращаемого значения агрегированной функции COUNT,
-- таблицы book, при этом производится группировка по значениям столбца publication_year,
-- где возвращаемое значение агрегированной функции COUNT больше 4.
SELECT publication_year, COUNT(*) AS [count]
FROM
    book
GROUP BY publication_year
HAVING COUNT(*) > 4;	-- HAVING - должен использоваться совместно с GROUP BY (HAVING аналогичен WHERE).
						-- HAVING - условие применяемое только к группам.
--------------------------------------------------------------------------

-- Ошибка. HAVING - должен использоваться совместно с GROUP BY.
SELECT id_book AS book
FROM book
HAVING id_book > 10; -- Неправильное использование HAVING (без GROUP BY)

-- WHERE работает до группировки, а HAVING работает вместе с группировкой.
SELECT publication_year, COUNT(page_num)
FROM book
WHERE publication_year IN (1901, 1902, 1903)
GROUP BY publication_year
HAVING COUNT(*) > 5;