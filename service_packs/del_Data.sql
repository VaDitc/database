USE [scales]
GO
/****** Object:  Trigger [dbo].[ins_DataByHours]    Script Date: 11.02.2017 22:30:01 ******/
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