use library

CREATE TABLE [company] (
	[id_company] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[address] [nvarchar](50) NULL,
	CONSTRAINT [PK_company] PRIMARY KEY CLUSTERED
	(
		[id_company] ASC
	)
) 

CREATE TABLE [employee] (
	[id_employee] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[id_company] [int] NULL
	CONSTRAINT [PK_employee] PRIMARY KEY CLUSTERED
	(
		[id_employee] ASC
	)
)

SET IDENTITY_INSERT [company] ON

INSERT INTO [company]
	(id_company, name)
VALUES 
	(1, N'TravelLine'),
	(2, N'iSpring'),
	(3, N'Citronium')

SET IDENTITY_INSERT [company] OFF

SELECT * FROM [company]

-- создаем внешний ключ
ALTER TABLE [dbo].[employee]  WITH CHECK ADD  CONSTRAINT [FK_employee_id-company] FOREIGN KEY([id_company])
REFERENCES [dbo].[company] ([id_company])
	ON UPDATE CASCADE
	ON DELETE CASCADE
GO

ALTER TABLE [dbo].[employee] CHECK CONSTRAINT [FK_employee_id-company]
GO

CREATE NONCLUSTERED INDEX [IX_employee_id-company] ON [employee]
(
	[id_company] ASC
)


INSERT INTO [dbo].[employee]
	(name, id_company)
VALUES 
	(N'Иван Иванов', 1),
	-- не обязательно у каждой компании должен быть сотрудник
	(N'Петр Петров', 3)
GO


INSERT INTO [dbo].[employee]
	(name, id_company)
VALUES 
	-- Получим ошибку, т.к. компании с id = 4 не существует
	(N'Вася Васильев', 4)
GO

DELETE FROM company WHERE id_company = 3

SELECT * FROM company
SELECT * FROM employee

DROP TABLE [employee]
GO

DROP TABLE [company]
GO
