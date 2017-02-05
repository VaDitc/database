
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

if (@month = @last_month)
	begin
	update DataByMonth 
	set Weight = @new_weight + @old_weight where ID = (select max(ID) from DataByMonth where ScalesNumberID = @number_scales)
	end
	
	
else
	begin 
	insert into DataByMonth(ScalesNumberID, Weight, NumberMonth ) 
	values (@number_scales, @new_weight, (select DATEPART(MONTH, GETDATE())))
	end

END
