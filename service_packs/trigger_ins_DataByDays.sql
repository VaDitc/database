USE [scales]
GO
/****** Object:  Trigger [dbo].[ins_DataByDays]    Script Date: 05.02.2017 21:06:27 ******/
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
   set @number_scales = (select ScalesNumberID from MeasurementData 
					where ID = (select max(ID) from MeasurementData))
 declare @new_weight float
	set @new_weight = (select CurrentWeight from MeasurementData where ID = (select max(ID) from MeasurementData))
declare @old_weight float
	set @old_weight = (select Weight from DataByDays where ID = (select max(ID) from DataByDays where ScalesNumberID = @number_scales))


declare @date date
   set @date= (select CAST(Date as date) from DataByDays 
					where ID = (select max(ID) from DataByDays where ScalesNumberID = @number_scales))
declare @last_date date
   set @last_date = (select CAST(TimeOfMeasurement as date) from MeasurementData 
					where ID = (select max(ID) from MeasurementData))

if (@date = @last_date)
	begin
	update DataByDays 
	set Weight = @new_weight + @old_weight where ID = (select max(ID) from DataByDays where ScalesNumberID = @number_scales)
	end
	
	
else
	begin 
	insert into DataByDays(Weight,  Date, ScalesNumberID) 
	values (@new_weight, (select CAST(GETDATE() as date)), @number_scales)
	end

END

