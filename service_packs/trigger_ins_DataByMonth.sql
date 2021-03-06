USE [scales]
GO
/****** Object:  Trigger [dbo].[ins_DataByMonth]    Script Date: 11.02.2017 20:08:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER TRIGGER [dbo].[ins_DataByMonth] 
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
	set @old_weight = (select Weight from DataByMonth where ID = (select max(ID) from DataByMonth where ScalesNumberID = @number_scales))


declare @month int
   set @month= (select NumberMonth from DataByMonth 
					where ID = (select max(ID) from DataByMonth where ScalesNumberID = @number_scales))
declare @last_month int
   set @last_month = (select DATEPART(MONTH, TimeOfMeasurement) from MeasurementData 
					where ID = (select max(ID) from MeasurementData))
declare @productivity float
set @productivity = (select CurrentProductivity from MeasurementData where ID = (select max(ID) from MeasurementData)) 

declare @last_productivity float
   set @last_productivity= (select Productivity from DataByMonth 
					where ID = (select max(ID) from DataByMonth where ScalesNumberID = @number_scales))
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
