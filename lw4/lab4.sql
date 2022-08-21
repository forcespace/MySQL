-- 4.3.1 INSERT
--  a
-- без указания списка полей INSERT INTO table_name VALUES (value1, value2, value3, ...);
INSERT INTO `order`
values (DEFAULT, '2021-08-23', 'Potapov', 2, 3);
-- b
-- с указанием списка полей INSERT INTO table_name (column1, column2, column3, ...) VALUES (value1, value2, value3, ...);
INSERT INTO item_order (id_item, id_order)
VALUES (15, 10);
-- с
-- с чтением значения из другой таблицы INSERT INTO table2 (column_name(s)) SELECT column_name(s) FROM table1;
INSERT INTO worker_2
    (name, telephone, position)
SELECT name, telephone, position
FROM worker;

-- 4.3.2 DELETE
-- a
-- Всех записей
DELETE
from worker_2;
-- b
-- По условию DELETE FROM table_name WHERE condition;
DELETE
FROM category
WHERE name like 'weapon%';

-- 4.3.3 UPDATE
-- a
-- Всех записей
UPDATE item
SET cost = cost + 10;
-- b
-- По условию обновляя один атрибут UPDATE table_name SET column1 = value1, column2 = value2, ... WHERE condition;
UPDATE item
SET cost = cost + 12
WHERE item.name like 'PC';
-- c
-- По условию обновляя несколько атрибутов UPDATE table_name SET column1 = value1, column2 = value2, ... WHERE condition;
UPDATE item
SET cost = cost + 11,
    sale = true
WHERE item.name like 'PC';

-- 4.3.4 SELECT
-- a
-- С набором извлекаемых атрибутов (SELECT atr1, atr2 FROM...);
SELECT name
FROM worker;
-- b
-- Со всеми атрибутами (SELECT * FROM...);
SELECT *
FROM worker;
-- c
-- С условием по атрибуту (SELECT * FROM ... WHERE atr1 = value);
SELECT name
FROM worker
WHERE position
          LIKE 'administrator';

-- 4.3.5 SELECT ORDER BY + TOP (LIMIT)
-- a
-- С сортировкой по возрастанию ASC + ограничение вывода количества записей
SELECT *
FROM item
ORDER BY cost
LIMIT 10;
-- b
-- С сортировкой по убыванию DESC
SELECT *
FROM item
ORDER BY cost DESC;
-- c
-- С сортировкой по двум атрибутам + ограничение вывода количества записей
SELECT *
FROM item
WHERE sale = 0
ORDER BY cost ASC
LIMIT 5;
-- d
-- С сортировкой по первому атрибуту, из списка извлекаемых
SELECT name
FROM category
ORDER BY 1;

-- 4.3.6 Работа с датами
-- Необходимо, чтобы одна из таблиц содержала атрибут с типом DATETIME. Например, таблица авторов может содержать дату рождения автора.
-- a
-- WHERE по дате
SELECT *
FROM `order`
WHERE date >= '2021-01-01';
-- b
-- WHERE дата в диапазоне
SELECT *
FROM `order`
WHERE date >= '2021-01-01'
  AND date <= '2021-02-01';
-- c
-- Извлечь из таблицы не всю дату, а только год. Например, год рождения автора.
-- Для этого используется функция YEAR ( https://docs.microsoft.com/en-us/sql/t- sql/functions/year-transact-sql?view=sql-server-2017 )
SELECT YEAR(date)
FROM `order`;

-- 4.3.7 Функции агрегации
-- a
-- Посчитать количество записей в таблице
SELECT count(*)
FROM item;
-- b
-- Посчитать количество уникальных записей в таблице
SELECT COUNT(DISTINCT position)
FROM worker;
-- с
-- Вывести уникальные значения столбца
SELECT DISTINCT position
FROM worker;
-- d
-- Найти максимальное значение столбца
SELECT MAX(cost)
FROM item;
-- e
-- Найти минимальное значение столбца
SELECT MIN(cost)
FROM item;
-- f
-- Написать запрос COUNT() + GROUP BY
SELECT client_name, COUNT(client_name) as count
FROM `order`
GROUP BY client_name;

-- 4.3.8 SELECT GROUP BY + HAVING
-- Написать 3 разных запроса с использованием GROUP BY + HAVING.
-- Для каждого запроса написать комментарий с пояснением, какую информацию извлекает запрос. Запрос должен быть осмысленным, т.е. находить информацию, которую можно использовать.
-- a
SELECT client_name, COUNT(client_name) as count
FROM `order`
GROUP BY client_name
HAVING count > 1;
-- b
SELECT id_shop, COUNT(id_shop) as count
FROM `order`
GROUP BY id_shop
HAVING count > 2;
-- с
SELECT id_worker, COUNT(id_worker) as count
FROM `order`
GROUP BY id_worker
HAVING count > 3;

-- 4.3.9 SELECT JOIN
-- a
-- LEFT JOIN двух таблиц и WHERE по одному из атрибутов
SELECT date, client_name, name, address, ceo
FROM `order`
         LEFT JOIN shop on `order`.id_shop = shop.id_shop
WHERE address = 'Y-Ola';
-- b
-- RIGHT JOIN. Получить такую же выборку, как и в 3.9 a
SELECT date, client_name, name, address, ceo
FROM `order`
         RIGHT JOIN shop on shop.id_shop = `order`.id_shop
WHERE address = 'Y-Ola';
-- c
-- LEFT JOIN трех таблиц + WHERE по атрибуту из каждой таблицы
SELECT date, client_name, i2.cost, i2.name
FROM `order`
         LEFT JOIN item_order i on `order`.id_order = i.id_order
         LEFT JOIN item i2 on i2.id_item = i.id_item
WHERE i2.name = 'steering wheel';
-- d
-- INNER JOIN двух таблиц
SELECT *
FROM `order`
         INNER JOIN item_order i on `order`.id_order = i.id_order
         INNER JOIN item i2 on i.id_item = i2.id_item;

-- 4.10
-- a
-- Написать запрос с условием WHERE IN (подзапрос)
SELECT *
FROM item
WHERE id_item IN (SELECT id_item
                  FROM item_order
                  GROUP BY id_item
                  HAVING COUNT(*) > 1);
-- b
-- Написать запрос SELECT atr1, atr2, (подзапрос) FROM ...
SELECT id_item,
       cost,
       name,
       (SELECT id_order FROM item_order WHERE id_order = 8)
FROM item;
-- c
-- Написать запрос вида SELECT * FROM (подзапрос)
SELECT *
FROM (SELECT date, client_name FROM `order` WHERE date BETWEEN '2022-01-01 00:00:00' AND CURDATE()) as order1;
-- d
-- Написать запрос вида SELECT * FROM table JOIN (подзапрос) ON ...
SELECT *
FROM `order`
         JOIN (SELECT * FROM item WHERE sale = 0) AS order1 ON `order`.id_order = order1.id_item;