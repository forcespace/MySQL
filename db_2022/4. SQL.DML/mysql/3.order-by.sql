--------------------------------------------------------------------------
--				Конструкция ORDER BY - УПОРЯДОЧИТЬ ПО...
--------------------------------------------------------------------------

-- Производим выборку данных
-- где данные упорядочены по столбцу first_name, таблицы `author`
SELECT first_name, last_name 
FROM `author`
ORDER BY first_name;  -- Упорядочить по имени.

-- Производим выборку данных
-- где данные упорядочены по столбцу last_name, таблицы `author`
SELECT *
FROM `author`
ORDER BY last_name;  -- Сортировать по last_name

-- Производим выборку данных  
-- где данные упорядочены по столбцам last_name и first_name, таблицы `author`
SELECT *
FROM `author`
ORDER BY last_name, first_name;  -- Cортировать по Имени и Фамилии

-- Производим выборку данных
-- где данные упорядочены по столбцу first_name, таблицы `author`
SELECT *
FROM `author`
ORDER BY first_name ASC; -- Сортировка по возрастанию. ASC - по умолчанию.

-- Производим выборку данных,
-- где данные упорядочены в порядке убывания, по столбцу first_name
SELECT *
FROM `author`
ORDER BY first_name DESC; -- Сортировка по убыванию.

-- Производим выборку данных
-- где данные упорядочены по столбцу first_name, таблицы `author`
SELECT first_name, last_name 
FROM `author`
ORDER BY 1;  -- Упорядочить по имени.