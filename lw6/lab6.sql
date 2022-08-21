-- 1. Добавить внешние ключи.
ALTER TABLE `order`
    ADD constraint order_pk primary key (id_order);

ALTER TABLE company
    ADD CONSTRAINT company_pk
        PRIMARY KEY (id_company);
CREATE INDEX company_id_company_index
    ON company (id_company);
ALTER TABLE dealer
    ADD CONSTRAINT dealer_company_id_company_fk
        FOREIGN KEY (id_company) REFERENCES company (id_company);
ALTER TABLE production
    ADD CONSTRAINT production_company_id_company_fk
        FOREIGN KEY (id_company) REFERENCES company (id_company);

ALTER TABLE dealer
    ADD CONSTRAINT dealer_pk
        PRIMARY KEY (id_dealer);
CREATE INDEX dealer_id_dealer_index
    ON dealer (id_dealer);
ALTER TABLE `order`
    ADD CONSTRAINT order_dealer_id_dealer_fk
        FOREIGN KEY (id_dealer) REFERENCES dealer (id_dealer);

ALTER TABLE production
    ADD CONSTRAINT production_pk
        PRIMARY KEY (id_production);
CREATE INDEX production_id_production_index
    ON production (id_production);
ALTER TABLE `order`
    ADD CONSTRAINT order_production_id_production_fk
        FOREIGN KEY (id_production) REFERENCES production (id_production);

ALTER TABLE pharmacy
    ADD CONSTRAINT pharmacy_pk
        PRIMARY KEY (id_pharmacy);
CREATE INDEX pharmacy_id_pharmacy_index
    ON pharmacy (id_pharmacy);
ALTER TABLE `order`
    ADD CONSTRAINT order_pharmacy_id_pharmacy_fk
        FOREIGN KEY (id_pharmacy) REFERENCES pharmacy (id_pharmacy);

ALTER TABLE medicine
    ADD CONSTRAINT medicine_pk
        PRIMARY KEY (id_medicine);
CREATE INDEX medicine_id_medicine_index
    ON medicine (id_medicine);
ALTER TABLE production
    ADD CONSTRAINT production_medicine_id_medicine_fk
        FOREIGN KEY (id_medicine) REFERENCES medicine (id_medicine);

-- 6.2 Выдать информацию по всем заказам лекарства “Кордерон” компании “Аргус” с указанием названий аптек, дат, объема заказов.
SELECT m.name, c.name, p.name, DATE, quantity FROM `order`
JOIN pharmacy p ON `order`.id_pharmacy = p.id_pharmacy
JOIN production p2 ON `order`.id_production = p2.id_production
JOIN company c ON p2.id_company = c.id_company
JOIN medicine m ON m.id_medicine = p2.id_medicine
WHERE c.name='Аргус' AND m.name='Кордеон';

-- 6.3 Дать список лекарств компании “Фарма”, на которые не были сделаны заказы до 25 января.
SET @date = '2019-01-25';
SET @name = 'Фарма';
SELECT medicine.id_medicine, medicine.name
FROM medicine
         JOIN production p ON medicine.id_medicine = p.id_medicine
         JOIN company c ON c.id_company = p.id_company
WHERE c.name = 'Фарма'
  AND p.id_medicine
          NOT IN (SELECT `order`.id_production
                  FROM `order`
                  WHERE DATE < date)
GROUP BY id_medicine, NAME;

-- 6.4 Дать минимальный и максимальный баллы лекарств каждой фирмы, которая оформила не менее 120 заказов.
SELECT name, max(rating) AS max_rating, min(rating) AS min_rating, count(id_order) cnt_order
FROM production
         JOIN `order` o ON production.id_production = o.id_production
         JOIN company c ON c.id_company = production.id_company
GROUP BY c.id_company, name
HAVING count(id_order) >= 120;

-- 6.5 Дать списки сделавших заказы аптек по всем дилерам компании “AstraZeneca”. Если у дилера нет заказов, в названии аптеки проставить NULL.
SET @company = 'AstraZeneca';
SELECT pharmacy.name, c.name, d.name
FROM pharmacy
         RIGHT JOIN `order` o ON pharmacy.id_pharmacy = o.id_pharmacy
         RIGHT JOIN dealer d ON d.id_dealer = o.id_dealer
         RIGHT JOIN company c ON c.id_company = d.id_company
WHERE c.name = 'AstraZeneca';

-- 6.6 Уменьшить на 20% стоимость всех лекарств, если она превышает 3000, а длительность лечения не более 7 дней.
SET @price = 3000;
SET @countDays = 7;
update production
join medicine m on m.id_medicine = production.id_medicine
set price = price * 0.8
where price > price and cure_duration <= @countDays;

select name, price, cure_duration
from production
join medicine m on m.id_medicine = production.id_medicine
where price > 3000 and cure_duration <= 7;

-- 7 Добавить необходимые индексы.
create index company_name_index on company (name);
create index medicine_name_index on medicine (name);
create index order_date_index on `order` (date);
create index order_id_order_index on `order` (id_order);
create index medicine_cure_duration_index on medicine (cure_duration);
create index production_price_index on production (price);