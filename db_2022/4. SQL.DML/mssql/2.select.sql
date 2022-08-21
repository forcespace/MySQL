--------------------------------------------------------------------------
--                     Выборка данных. Запрос SELECT 
--------------------------------------------------------------------------

-- Производим выборку всех данных из таблицы [author].
SELECT * FROM [author]; 

-- Производим выборку данных из столбца first_name, таблицы [author]
SELECT first_name FROM [author]; 

-- Производим выборку данных из столбца last_name, таблицы [author]
SELECT last_name FROM [author]; 

-- Производим выборку данных из столбцов first_name и last_name, таблицы [author]
SELECT first_name, last_name FROM [author];

--------------------------------------------------------------------------
--                         Конструкция WHERE. 
--------------------------------------------------------------------------
-- Производим выборку всех данных из таблицы book, где значения ячеек столбца id_book равны 10.
SELECT * FROM book 
WHERE id_book = 10; -- В конструкции WHERE применена операция сравнения (=)

-- Производим выборку всех данных из таблицы book, где значения ячеек столбца id_book меньше 10.
SELECT * FROM book 
WHERE id_book < 10; -- В конструкции WHERE применена операция сравнения (<)

-- Производим выборку всех данных из таблицы book, 
-- где значения ячеек столбца id_book лежат в диапазоне от 1 до 3 (включительно).
SELECT * FROM book 
WHERE id_book BETWEEN 1 AND 3; -- В конструкции WHERE применена операция проверки диапазона.

-- Производим выборку данных из таблицы book,
-- где значения ячеек столбца publication_year равно 1915 или 1925.
SELECT * FROM book 
WHERE publication_year = 1915 OR publication_year = 1925; -- Логическая операция "ИЛИ"

-- Производим выборку всех данных из таблицы book, 
-- где значения ячеек столбца publication_year лежат в диапазоне от 1915 до 1925 (включительно).
SELECT * FROM book 
WHERE publication_year BETWEEN 1915 AND 1925; -- В конструкции WHERE применена операция проверки диапазона.

-- Производим выборку данных из столбцов name и publication_year, таблицы book,
-- где значения ячеек столбца publication_year равно 1915 и значения ячеек столбца name равно 'Future Of The Nation'.
SELECT name, publication_year FROM book 
WHERE publication_year = 1915 AND name = 'Future Of The Nation'; -- Логическая операция "И"

-- Производим выборку данных из столбцов name и publication_year, таблицы book,
-- где значения ячеек столбца publication_year не равно 1925
SELECT name, publication_year FROM book 
WHERE NOT publication_year = 1925; -- Логическая операция "НЕ"


INSERT INTO [author]
VALUES ( NULL, 'Pushkin'); -- Вводимые данные.

-- Производим выборку данных,
-- где значения ячеек столбца first_name не равно NULL
SELECT * FROM [author] 
WHERE first_name IS NULL; 

-- Производим выборку данных из столбцов name и publication_year, таблицы book,
-- где значения ячеек столбца name соответствуют шаблону	'Future'
SELECT name, publication_year FROM book 
WHERE name LIKE 'Future'; -- LIKE - операция проверки соответствия заданному шаблону - 'Future'

SELECT name, publication_year FROM book 
WHERE name = 'Future';

-- Производим выборку данных из столбцов name и publication_year, таблицы book,
-- где значения ячеек столбца name соответствуют шаблону	'Fut%'

SELECT name, publication_year FROM book 
WHERE name LIKE 'Fut'; -- Вывод всех карт, имя типа которых начинается на  'Fut', 
						   -- знак % обозначет произвольное количество символов после Fut.

SELECT name, publication_year FROM book 
WHERE name = 'Fut%';  -- Выборка пустая потому что такого значения как 'Fut%' нет в таблице
						  
-- Производим выборку данных из столбцов name и publication_year, таблицы book,
-- где значения ячеек столбца name соответствуют шаблону	'Lord Of Drea__'
SELECT name, publication_year FROM book 
WHERE name LIKE 'Lord Of Dre__'; -- _ - нижнее подчеркивание определяет любой один символ после Lord Of Dre 

-- Производим выборку данных из столбцов name и publication_year, таблицы book,
-- где значения ячеек столбца name соответствуют шаблону	'Lord Of Drea_'
SELECT name, publication_year FROM book 
WHERE name LIKE 'Lord Of Drea_'; -- почему выборка пустая?

-- Производим выборку данных из столбцов name и publication_year, таблицы book,
-- где значения ячеек столбца name соответствуют шаблону	'Lord Of Dre_d'
SELECT name, publication_year FROM book 
WHERE name LIKE 'Lord Of Dre_d';

-- Производим выборку данных из столбцов name и publication_year, таблицы book,
-- где значения ячеек столбца name соответствуют шаблону	'%ist%'
SELECT name, publication_year FROM book 
WHERE name LIKE '%ist%';

-- Производим выборку всех данных из таблицы book, 
-- где значения ячеек столбца publication_year равняются одному из значений ряда (1900, 1901, 1902)
SELECT * FROM book WHERE publication_year IN (1900, 1901, 1902); -- IN (1900, 1901, 1902) определяет значения publication_year равные 1900 или 1901 или 1902 

SELECT * FROM book
WHERE publication_year = 1900 OR publication_year = 1901 OR publication_year = 1902;

-- Оператор LIMIT позволяет вывести указанное число строк из таблицы. Оператор LIMIT записывается всегда в конце запроса.
SELECT TOP 5 * FROM book;
