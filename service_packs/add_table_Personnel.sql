create table Personnel
(
	ID int not null,
	Name nvarchar(50) null,
	Password nvarchar(50) null,
	CONSTRAINT PK_Personal PRIMARY KEY CLUSTERED (ID) 
	WITH (PAD_INDEX=OFF, STATISTICS_NORECOMPUTE = OFF,IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
ON [PRIMARY]
) 
ON [PRIMARY]
go
