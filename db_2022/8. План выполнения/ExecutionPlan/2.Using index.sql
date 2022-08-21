USE hotel
GO

-- Запрос без индекса
SELECT * FROM [room_in_booking] WHERE id_booking = 20
-- 0.01

-- Добавим индекс по читателю
CREATE NONCLUSTERED INDEX [IX_room_in_booking_id-booking] ON [dbo].[room_in_booking]
(
	[id_booking] ASC
)

SELECT * FROM [room_in_booking] WHERE id_booking = 20

-- При чтении большого количества строк индекс не используется
SELECT * FROM [room_in_booking] WHERE id_booking > 20

DROP INDEX [IX_room_in_booking_id-booking] ON [dbo].[room_in_booking]


-- Добавим индекс с включенными атрибутами
SELECT id_booking, id_room FROM [room_in_booking] WHERE id_booking = 20

CREATE NONCLUSTERED INDEX [IX_room_in_booking_id-booking_id-room] ON [dbo].[room_in_booking]
(
	[id_booking] ASC
) INCLUDE([id_room])

DROP INDEX [IX_room_in_booking_id-booking_id-room] ON [dbo].[room_in_booking]


-- JOIN с разными индексами

SELECT * FROM booking b
JOIN room_in_booking rib ON rib.id_booking = b.id_booking
WHERE rib.id_room IN (20, 21, 22)

CREATE NONCLUSTERED INDEX [IX_room_in_booking_id-booking] ON [dbo].[room_in_booking]
(
	[id_booking] ASC
)
DROP INDEX [IX_room_in_booking_id-booking] ON [dbo].[room_in_booking]

CREATE NONCLUSTERED INDEX [IX_room_in_booking_id-room_id-booking] ON [dbo].[room_in_booking]
(
	[id_room] ASC,
	[id_booking] ASC
)
DROP INDEX [IX_room_in_booking_id-room_id-booking] ON [dbo].[room_in_booking]