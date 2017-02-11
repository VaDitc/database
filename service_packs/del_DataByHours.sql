USE [scales]
GO
/****** Object:  Trigger [dbo].[ins_DataByHours]    Script Date: 11.02.2017 22:30:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[del_DataByHour] 
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