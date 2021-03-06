USE [scales]
GO
/****** Object:  Trigger [dbo].[ins_DataByDays]    Script Date: 11.02.2017 20:07:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER TRIGGER [dbo].[ins_DataByDays] 
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

declare @productivity float
set @productivity = (select CurrentProductivity from MeasurementData where ID = (select max(ID) from MeasurementData)) 

declare @last_productivity float
   set @last_productivity= (select Productivity from DataByDays 
					where ID = (select max(ID) from DataByDays where ScalesNumberID = @number_scales))
declare @new_productivity float
set @new_productivity = (@productivity + @last_productivity)/2


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
	update DataByDays
	set Productivity = @new_productivity
	end
	
	
else
	begin 
	insert into DataByDays(Weight, Productivity,  Date, ScalesNumberID) 
	values (@new_weight, @productivity, (select CAST(GETDATE() as date)), @number_scales)
	end

END

