-- 5.1 Добавить внешние ключи
create index booking_client_id_client_fk
    on client (id_client);
alter table booking
    add constraint booking_client_id_client_fk
        foreign key (id_client) references client (id_client);

create index room_hotel_id_hotel_fk
    on hotel (id_hotel);
alter table room
    add constraint room_hotel_id_hotel_fk
        foreign key (id_hotel) references hotel (id_hotel);

create index room_in_booking_booking_id_booking_fk
    on booking (id_booking);
alter table room_in_booking
    add constraint room_in_booking_booking_id_booking_fk
        foreign key (id_booking) references booking (id_booking);

create index room_room_category_id_room_category_fk
    on room_category (id_room_category);
alter table room
    add constraint room_room_category_id_room_category_fk
        foreign key (id_room_category) references room_category (id_room_category);

create index room_in_booking_room_id_room_fk
    on room (id_room);
alter table room_in_booking
    add constraint room_in_booking_room_id_room_fk
        foreign key (id_room) references room (id_room);

-- 5.2 Выдать информацию о клиентах гостиницы “Космос”, проживающих в номерах категории “Люкс” на 1 апреля 2019г.
SELECT room_in_booking.id_booking,
       client.id_client,
       client.name,
       client.phone,
       hotel.name,
       room_category.name,
       checkin_date,
       checkout_date
FROM room_in_booking
         INNER JOIN booking ON booking.id_booking = room_in_booking.id_booking
         INNER JOIN client ON client.id_client = booking.id_client
         INNER JOIN room ON room.id_room = room_in_booking.id_room
         INNER JOIN room_category ON room.id_room_category = room_category.id_room_category
         INNER JOIN hotel ON hotel.id_hotel = room.id_hotel
WHERE hotel.name = 'Космос'
  AND room_category.name = 'Люкс'
  AND checkin_date >= '2019-04-01'
  AND checkout_date < '2019-04-01';

-- 5.3 Дать список свободных номеров всех гостиниц на 22 апреля.
SELECT * FROM room
         WHERE id_room NOT IN (
         SELECT room.id_room FROM room_in_booking
             INNER JOIN room ON room.id_room = room_in_booking.id_room
             WHERE '2019-04-22' >= room_in_booking.checkin_date
               AND '2019-04-22' < room_in_booking.checkout_date
)
ORDER BY id_room, id_hotel;

-- 5.4 Дать количество проживающих в гостинице “Космос” на 23 марта по каждой категории номеров
SELECT room_category.name, COUNT(room_category.name) as cnt
FROM room_in_booking
         INNER JOIN booking ON booking.id_booking = room_in_booking.id_booking
         INNER JOIN room ON room.id_room = room_in_booking.id_room
         INNER JOIN room_category ON room.id_room_category = room_category.id_room_category
         INNER JOIN hotel ON hotel.id_hotel = room.id_hotel
WHERE hotel.name = 'Космос'
  AND checkin_date <= '2019-03-23'
  AND checkout_date > '2019-03-23'
GROUP BY room_category.id_room_category, room_category.name;

-- 5.5 Дать список последних проживавших клиентов по всем комнатам гостиницы “Космос”, выехавшим в апреле с указанием даты выезда.
-- # SELECT mr.number, c.name, c.phone, rc.name, mrib.checkout_date
-- # FROM room_in_booking mrib
-- #          INNER JOIN room mr on mrib.id_room = mr.id_room
-- #          INNER JOIN booking b ON b.id_booking = mrib.id_booking
-- #          INNER JOIN client c ON c.id_client = b.id_client
-- #          INNER JOIN room_category rc ON mr.id_room_category = rc.id_room_category
-- #          INNER JOIN
-- #      (
-- #      SELECT DISTINCT MAX(CONCAT(rib.checkout_date, r.id_room)) AS max_room_date_out
-- #       FROM room r
-- #                INNER JOIN room_in_booking rib ON r.id_room = rib.id_room
-- #                INNER JOIN hotel h ON h.id_hotel = r.id_hotel
-- #       WHERE h.name = 'Космос'
-- #         AND rib.checkout_date >= '2019-04-01'
-- #         AND rib.checkout_date < '2019-04-30'
-- #       GROUP BY r.id_room
-- #       ) subq ON CONCAT(mrib.checkout_date, mr.id_room) = subq.max_room_date_out;

SELECT room.id_room, room.number, client.name, last_visited
FROM room,
     (SELECT room.id_room, MAX(room_in_booking.checkout_date) as last_visited
      FROM room
               JOIN room_in_booking ON room_in_booking.id_room = room.id_room
               JOIN hotel ON room.id_hotel = hotel.id_hotel
      WHERE room_in_booking.checkout_date >= '2019-04-01'
        AND room_in_booking.checkout_date < '2019-04-30'
        AND hotel.name = 'Космос'
      GROUP BY)


-- 5.6 Продлить на 2 дня дату проживания в гостинице “Космос” всем клиентам комнат категории “Бизнес”, которые заселились 10 мая.
UPDATE room_in_booking
    INNER JOIN booking ON booking.id_booking = room_in_booking.id_booking
    INNER JOIN client ON client.id_client = booking.id_client
    INNER JOIN room ON room.id_room = room_in_booking.id_room
    INNER JOIN room_category ON room.id_room_category = room_category.id_room_category
    INNER JOIN hotel ON hotel.id_hotel = room.id_hotel
SET checkout_date=DATE_ADD(checkout_date, INTERVAL 2 DAY)
WHERE hotel.name = 'Космос'
  AND room_category.name = 'Бизнес'
  AND checkin_date = '2019-05-10';

SELECT room_in_booking.id_booking,
       client.id_client,
       client.name,
       client.phone,
       hotel.name,
       room_category.name,
       checkin_date,
       checkout_date
FROM room_in_booking
         INNER JOIN booking ON booking.id_booking = room_in_booking.id_booking
         INNER JOIN client ON client.id_client = booking.id_client
         INNER JOIN room ON room.id_room = room_in_booking.id_room
         INNER JOIN room_category ON room.id_room_category = room_category.id_room_category
         INNER JOIN hotel ON hotel.id_hotel = room.id_hotel
WHERE hotel.name = 'Космос'
  AND room_category.name = 'Бизнес'
  AND checkin_date = '2019-05-10';

-- 5.7 Найти все "пересекающиеся" варианты проживания. Правильное состояние: не может быть забронирован один номер на одну дату несколько раз,
-- т.к. нельзя заселиться нескольким клиентам в один номер.
-- Записи в таблице room_in_booking с id_room_in_booking = 5 и 2154 являются примером неправильного состояния, которые необходимо найти.
-- Результирующий кортеж выборки должен содержать информацию о двух конфликтующих номерах.
SELECT rinb1.id_room_in_booking, rinb2.id_room_in_booking, rinb1.id_room
FROM room_in_booking rinb1,
     room_in_booking rinb2
WHERE rinb1.checkin_date <= rinb2.checkin_date
  AND rinb1.checkout_date > rinb2.checkin_date
  AND rinb1.id_room = rinb2.id_room
  AND rinb1.id_room_in_booking != rinb2.id_room_in_booking
ORDER BY id_room;

-- select * from room_in_booking where id_room_in_booking IN (5, 2154);

-- 5.8 Создать бронирование в транзакции.
SET AUTOCOMMIT=0;
START TRANSACTION;

INSERT INTO client (name, phone)
VALUES
    (
     'Иванов Иван Иванович',
     '7(987)987-98-87'
     );

INSERT INTO booking (id_client, booking_date)
VALUES (
        LAST_INSERT_ID(),
        CURDATE()
        );

INSERT INTO room_in_booking (id_booking, id_room, checkin_date, checkout_date)
VALUES
    (
     LAST_INSERT_ID(),
     1,
     '2022-05-01',
     '2022-05-31'
     );
COMMIT;

CREATE INDEX room_id_hotel_index ON room (id_hotel);
CREATE INDEX room_in_booking_id_room_index ON room_in_booking (id_room);
CREATE INDEX room_id_room_category_index ON room (id_room_category);
CREATE INDEX room_in_booking_id_booking_index ON room_in_booking (id_booking);
CREATE INDEX booking_id_client_index ON booking (id_client);