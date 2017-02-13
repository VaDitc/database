USE [scales]
GO
/****** Object:  StoredProcedure [dbo].[ins_MeasurementData]    Script Date: 04.02.2017 21:36:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ins_MeasurementData]
	 @Weight FLOAT,
	 @ScalesNumber INT,
	 @Productivity FLOAT
 AS
 
BEGIN
	SET NOCOUNT ON;
	insert into MeasurementData (ScalesNumberID, CurrentWeight, CurrentProductivity, TimeOfMeasurement)
	values (@ScalesNumber, @Weight, @Productivity, getdate())
    SET NOCOUNT OFF;
END
