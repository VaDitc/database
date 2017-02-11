USE [scales]
GO
/****** Object:  Trigger [dbo].[ins_DataByShift]    Script Date: 11.02.2017 13:30:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create TRIGGER [dbo].[ins_DataByShift] 
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
   set @scales_number = (select ScalesNumberID from MeasurementData 
					where ID = (select max(ID) from MeasurementData))
 declare @new_weight float
	set @new_weight = (select CurrentWeight from MeasurementData where ID = (select max(ID) from MeasurementData))
declare @old_weight float
	set @old_weight = (select Weight from DataByShift where ID = (select max(ID) from DataByShift where ScalesNumberID = @scales_number))

declare @last_shift_number int
   set @last_shift_number = (select ShiftNumber from DataByShift where ID = (select max(ID) from DataByShift where ScalesNumberID = @scales_number))

declare @date date
   set @date= (select CAST(StartTime as date) from DataByShift 
					where ID = (select max(ID) from DataByShift where ScalesNumberID = @scales_number))
declare @last_date date
   set @last_date = (select CAST(TimeOfMeasurement as date) from MeasurementData 
					where ID = (select max(ID) from MeasurementData))
if (@last_shift_number = @shift_number)
			begin
				update DataByShift 
				set Weight = @new_weight + @old_weight where ID = (select max(ID) from DataByShift where ScalesNumberID = @scales_number)
			end
		else
			begin 
				update DataByShift	
				set EndTime = GETDATE() where ID = (select max(ID) from DataByShift where (ScalesNumberID = @scales_number) and (EndTime is null))
				
				insert into DataByShift(ShiftNumber, ScalesNumberID, Weight, StartTime) values (@shift_number, @scales_number, @new_weight, GETDATE())
				
				--update DataByShift	
				--set EndTime = GETDATE() where ID = (select max(ID) from DataByShift where (ScalesNumberID = @scales_number) and (EndTime is null))
	end
END
