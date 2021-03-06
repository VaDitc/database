﻿USE master
GO

CREATE DATABASE scales
GO

USE [scales]
GO
/****** Object:  Table [dbo].[DataByDays]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataByDays](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ScalesNumberID] [int] NULL,
	[Weight] [float] NULL,
	[Productivity] [float] NULL,
	[Date] [date] NULL,
 CONSTRAINT [PK_DataByDays] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DataByHours]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataByHours](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ScalesNumberID] [int] NULL,
	[Weight] [float] NULL,
	[Productivity] [float] NULL,
	[Time] [time](7) NULL,
	[Date] [date] NULL,
	[ShiftNumber] [int] NULL,
 CONSTRAINT [PK_DataByHours] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DataByMonth]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataByMonth](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ScalesNumberID] [int] NULL,
	[Weight] [float] NULL,
	[Productivity] [float] NULL,
	[NumberMonth] [int] NULL,
 CONSTRAINT [PK_DataByMonth] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DataByShift]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataByShift](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ShiftNumber] [int] NULL,
	[ScalesNumberID] [int] NULL,
	[Weight] [float] NULL,
	[Productivity] [float] NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
 CONSTRAINT [PK_ShiftData] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MeasurementData]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MeasurementData](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ScalesNumberID] [int] NULL,
	[CurrentWeight] [float] NULL,
	[CurrentProductivity] [float] NULL,
	[TimeOfMeasurement] [datetime] NULL,
 CONSTRAINT [PK_MeasurementData] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 1) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Personal]   ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personal](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Role] [int] NULL,
 CONSTRAINT [PK_Personal] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ScalesInformation]   ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScalesInformation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Scales_Number] [nvarchar](50) NULL,
	[Max_Productivity] [float] NULL,
	[IPaddress] [nvarchar](50) NULL,
	[ModbusID] [nvarchar](50) NULL,
 CONSTRAINT [PK_ScalesInformation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[DataByDays]  WITH CHECK ADD  CONSTRAINT [FK_DataByDays_ScalesInformation] FOREIGN KEY([ScalesNumberID])
REFERENCES [dbo].[ScalesInformation] ([ID])
GO
ALTER TABLE [dbo].[DataByDays] CHECK CONSTRAINT [FK_DataByDays_ScalesInformation]
GO
ALTER TABLE [dbo].[DataByHours]  WITH CHECK ADD  CONSTRAINT [FK_DataByHours_ScalesInformation] FOREIGN KEY([ScalesNumberID])
REFERENCES [dbo].[ScalesInformation] ([ID])
GO
ALTER TABLE [dbo].[DataByHours] CHECK CONSTRAINT [FK_DataByHours_ScalesInformation]
GO
ALTER TABLE [dbo].[DataByMonth]  WITH CHECK ADD  CONSTRAINT [FK_DataByMonth_ScalesInformation] FOREIGN KEY([ScalesNumberID])
REFERENCES [dbo].[ScalesInformation] ([ID])
GO
ALTER TABLE [dbo].[DataByMonth] CHECK CONSTRAINT [FK_DataByMonth_ScalesInformation]
GO
ALTER TABLE [dbo].[DataByShift]  WITH CHECK ADD  CONSTRAINT [FK_ShiftData_ScalesInformation] FOREIGN KEY([ScalesNumberID])
REFERENCES [dbo].[ScalesInformation] ([ID])
GO
ALTER TABLE [dbo].[DataByShift] CHECK CONSTRAINT [FK_ShiftData_ScalesInformation]
GO
ALTER TABLE [dbo].[MeasurementData]  WITH CHECK ADD  CONSTRAINT [FK_MeasurementData_ScalesInformation] FOREIGN KEY([ScalesNumberID])
REFERENCES [dbo].[ScalesInformation] ([ID])
GO
ALTER TABLE [dbo].[MeasurementData] CHECK CONSTRAINT [FK_MeasurementData_ScalesInformation]
GO

/****** Object:  Trigger [dbo].[del_DataByHour]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[del_DataByHours] 
ON [dbo].[DataByDays]
FOR INSERT
AS 
IF @@ROWCOUNT=1

BEGIN
declare @quantity_device int
set @quantity_device = (select count(ID) from DataByHours where Date = CAST(GETDATE() AS date))
  
if ((select datediff (MONTH, (select top (1) [Date] from DataByDays), GETDATE())) > = 1)
 begin 
	delete top (@quantity_device * 24) from DataByHours 
end  
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[del_MeasurementData] 
ON [dbo].[DataByDays]
FOR INSERT
AS 
IF @@ROWCOUNT=1

BEGIN
declare @quantity_device int
set @quantity_device = (select count(ID) from DataByHours where Date = CAST(GETDATE() AS date))
  
if ((select datediff (week, (select top (1) [Date] from DataByDays), GETDATE())) > = 1)
 begin 
	delete top (@quantity_device * 3600) from MeasurementData 
end  
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[del_Data] 
ON [dbo].[DataByMonth]
FOR INSERT
AS 
IF @@ROWCOUNT=1

BEGIN
declare @month int
set @month = (select count(ID) from DataByMonth) 
  
if ( @month >13)
 begin 
	delete top (12) from DataByMonth
	delete from DataByDays where DATEPART(Year, Date) = (select (DATEPART(Year, GETDATE())-1))
	delete from DataByHours where DATEPART(Year, Date) = (select (DATEPART(Year, GETDATE())-1))
	delete from DataByShift where DATEPART(Year, StartTime)=(select (DATEPART(Year, GETDATE())-1)) and (EndTime is not null)
	delete from MeasurementData where DATEPART(Year, TimeOfMeasurement) = (select (DATEPART(Year, GETDATE())-1))
end  
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[ins_DataByDays] 
ON [dbo].[MeasurementData]
FOR INSERT
AS 
IF @@ROWCOUNT=1

BEGIN
 declare @number_scales int
   set @number_scales = (select ScalesNumberID from MeasurementData where ID = (select max(ID) from MeasurementData))
 declare @new_weight float
	set @new_weight = (select CurrentWeight from MeasurementData where ID = (select max(ID) from MeasurementData))
declare @old_weight float
	set @old_weight = (select Weight from DataByDays where ID = (select max(ID) from DataByDays where ScalesNumberID = @number_scales))
declare @productivity float
	set @productivity = (select CurrentProductivity from MeasurementData where ID = (select max(ID) from MeasurementData)) 
declare @last_productivity float
   set @last_productivity= (select Productivity from DataByDays where ID = (select max(ID) from DataByDays where ScalesNumberID = @number_scales))
declare @new_productivity float
	set @new_productivity = (@productivity + @last_productivity)/2
declare @date date
   set @date= (select CAST(Date as date) from DataByDays where ID = (select max(ID) from DataByDays where ScalesNumberID = @number_scales))
declare @last_date date
   set @last_date = (select CAST(TimeOfMeasurement as date) from MeasurementData where ID = (select max(ID) from MeasurementData))

if (@date = @last_date)
	begin
	update DataByDays 
	set Weight = @new_weight + @old_weight where ID = (select max(ID) from DataByDays where ScalesNumberID = @number_scales)
	update DataByDays
	set Productivity = @new_productivity
	end
else
	begin 
	insert into DataByDays(Weight, Productivity,  Date, ScalesNumberID) 
	values (@new_weight, @productivity, (select CAST(GETDATE() as date)), @number_scales)
	end
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[ins_DataByHours] 
ON [dbo].[MeasurementData]
FOR INSERT
AS 
IF @@ROWCOUNT=1

BEGIN
 declare @time_now int
	set @time_now = (select DATEPART(HOUR, TimeOfMeasurement) from MeasurementData where ID = (select max(ID) from MeasurementData))
declare @shift_number int	
	if (@time_now between 8 and 19)
		set @shift_number = 1
	else
		set @shift_number = 2
 
 declare @number_scales int
   set @number_scales = (select ScalesNumberID from MeasurementData where ID = (select max(ID) from MeasurementData))
 declare @new_weight float
	set @new_weight = (select CurrentWeight from MeasurementData where ID = (select max(ID) from MeasurementData))
declare @old_weight float
	set @old_weight = (select Weight from DataByHours where ID = (select max(ID) from DataByHours where ScalesNumberID = @number_scales))

declare @time time
   set @time= (select CAST(Time as time) from DataByHours where ID = (select max(ID) from DataByHours where ScalesNumberID = @number_scales))
declare @last_time datetime
   set @last_time = (select CAST(TimeOfMeasurement as time) from MeasurementData where ID = (select max(ID) from MeasurementData))
declare @date date
   set @date= (select CAST(Date as date) from DataByHours where ID = (select max(ID) from DataByHours where ScalesNumberID = @number_scales))
declare @last_date date
   set @last_date = (select CAST(TimeOfMeasurement as date) from MeasurementData where ID = (select max(ID) from MeasurementData))
declare @productivity float
	set @productivity = (select CurrentProductivity from MeasurementData where ID = (select max(ID) from MeasurementData)) 
declare @last_productivity float
   set @last_productivity= (select Productivity from DataByHours where ID = (select max(ID) from DataByHours where ScalesNumberID = @number_scales))
declare @new_productivity float
	set @new_productivity = (@productivity + @last_productivity)/2

if ((select DATEPART(HOUR, @last_time)) = (select DATEPART(HOUR, @time))) and (@date = @last_date)
	begin
	update DataByHours 
		set Weight = @new_weight + @old_weight where ID = (select max(ID) from DataByHours where ScalesNumberID = @number_scales)
	update DataByHours 
		set Productivity = @new_productivity
	end
else
	begin 
	insert into DataByHours(ScalesNumberID, Weight, Productivity, Time, Date, ShiftNumber) 
	values (@number_scales, @new_weight, @productivity, (select CAST(GETDATE() as time)), (select CAST(GETDATE() as date)), @shift_number)
	end
END
GO

/****** Object:  Trigger [dbo].[ins_DataByMonth]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[ins_DataByMonth] 
ON [dbo].[MeasurementData]
FOR INSERT
AS 
IF @@ROWCOUNT=1

BEGIN
declare @number_scales int
   set @number_scales = (select ScalesNumberID from MeasurementData where ID = (select max(ID) from MeasurementData))
declare @new_weight float
	set @new_weight = (select CurrentWeight from MeasurementData where ID = (select max(ID) from MeasurementData))
declare @old_weight float
	set @old_weight = (select Weight from DataByMonth where ID = (select max(ID) from DataByMonth where ScalesNumberID = @number_scales))
declare @month int
   set @month= (select NumberMonth from DataByMonth where ID = (select max(ID) from DataByMonth where ScalesNumberID = @number_scales))
declare @last_month int
   set @last_month = (select DATEPART(MONTH, TimeOfMeasurement) from MeasurementData 
					where ID = (select max(ID) from MeasurementData))
declare @productivity float
set @productivity = (select CurrentProductivity from MeasurementData where ID = (select max(ID) from MeasurementData)) 

declare @last_productivity float
   set @last_productivity= (select Productivity from DataByMonth where ID = (select max(ID) from DataByMonth where ScalesNumberID = @number_scales))
declare @new_productivity float
	set @new_productivity = (@productivity + @last_productivity)/2

if (@month = @last_month)
	begin
	update DataByMonth 
	set Weight = @new_weight + @old_weight where ID = (select max(ID) from DataByMonth where ScalesNumberID = @number_scales)
	update DataByMonth
	set Productivity = @new_productivity
	end
else
	begin 
	insert into DataByMonth(ScalesNumberID, Weight, Productivity, NumberMonth ) 
	values (@number_scales, @new_weight, @productivity, (select DATEPART(MONTH, GETDATE())))
	end
END
GO
/****** Object:  Trigger [dbo].[ins_DataByShift]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[ins_DataByShift] 
ON [dbo].[MeasurementData]
FOR INSERT
AS 
IF @@ROWCOUNT=1

BEGIN
declare @time_now int
	set @time_now = (select DATEPART(HOUR, TimeOfMeasurement) from MeasurementData where ID = (select max(ID) from MeasurementData))
declare @shift_number int	
	if (@time_now between 8 and 19)
		set @shift_number = 1
	else
		set @shift_number = 2
declare @scales_number int
   set @scales_number = (select ScalesNumberID from MeasurementData where ID = (select max(ID) from MeasurementData))
declare @new_weight float
	set @new_weight = (select CurrentWeight from MeasurementData where ID = (select max(ID) from MeasurementData))
declare @old_weight float
	set @old_weight = (select Weight from DataByShift where ID = (select max(ID) from DataByShift where ScalesNumberID = @scales_number))
declare @last_shift_number int
   set @last_shift_number = (select ShiftNumber from DataByShift where ID = (select max(ID) from DataByShift where ScalesNumberID = @scales_number))
declare @date date
   set @date= (select CAST(StartTime as date) from DataByShift where ID = (select max(ID) from DataByShift where ScalesNumberID = @scales_number))
declare @last_date date
   set @last_date = (select CAST(TimeOfMeasurement as date) from MeasurementData where ID = (select max(ID) from MeasurementData))
declare @productivity float
	set @productivity = (select CurrentProductivity from MeasurementData where ID = (select max(ID) from MeasurementData)) 
declare @last_productivity float
   set @last_productivity= (select Productivity from DataByShift where ID = (select max(ID) from DataByShift where ScalesNumberID = @scales_number))
declare @new_productivity float
	set @new_productivity = (@productivity + @last_productivity)/2

if (@last_shift_number = @shift_number)
			begin
				update DataByShift 
				set Weight = @new_weight + @old_weight where ID = (select max(ID) from DataByShift where ScalesNumberID = @scales_number)
				update DataByShift
				set Productivity = @new_productivity
			end
		else
			begin 
				update DataByShift	
				set EndTime = GETDATE() where ID = (select max(ID) from DataByShift where (ScalesNumberID = @scales_number) and (EndTime is null))
				
				insert into DataByShift(ShiftNumber, ScalesNumberID, Weight, Productivity, StartTime) values (@shift_number, @scales_number, @new_weight, @productivity, GETDATE())
	end
END
GO
