USE [scales]
GO
/****** Object:  Trigger [dbo].[ins_DataByHours]    Script Date: 05.02.2017 17:49:47 ******/
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
 declare @number_scales int
   set @number_scales = (select ScalesNumberID from MeasurementData 
					where ID = (select max(ID) from MeasurementData))
 declare @new_weight float
	set @new_weight = (select CurrentWeight from MeasurementData where ID = (select max(ID) from MeasurementData))
declare @old_weight float
	set @old_weight = (select Weight from DataByHours where ID = (select max(ID) from DataByHours where ScalesNumberID = @number_scales))

declare @time time
   set @time= (select CAST(Time as time) from DataByHours 
					where ID = (select max(ID) from DataByHours where ScalesNumberID = @number_scales))
declare @last_time datetime
   set @last_time = (select CAST(TimeOfMeasurement as time) from MeasurementData 
					where ID = (select max(ID) from MeasurementData))
declare @date date
   set @date= (select CAST(Date as date) from DataByHours 
					where ID = (select max(ID) from DataByHours where ScalesNumberID = @number_scales))
declare @last_date date
   set @last_date = (select CAST(TimeOfMeasurement as date) from MeasurementData 
					where ID = (select max(ID) from MeasurementData))

if ((select DATEPART(HOUR, @last_time)) = (select DATEPART(HOUR, @time))) and (@date = @last_date)
	begin
	update DataByHours 
	set Weight = @new_weight + @old_weight where ID = (select max(ID) from DataByHours where ScalesNumberID = @number_scales)
	end
	
	
else
	begin 
	insert into DataByHours(ScalesNumberID, Weight, Time, Date) 
	values (@number_scales, @new_weight, (select CAST(GETDATE() as time)), (select CAST(GETDATE() as date)))
	end

END
