USE [scales]
GO
/****** Object:  Table [dbo].[DataByDays]    Script Date: 28.01.2017 16:20:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataByDays](
	[ID] [int] NOT NULL,
	[Date] [datetime] NULL,
	[Weight] [float] NULL,
	[ScaleNumberID] [int] NULL,
 CONSTRAINT [PK_DataByDays] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DataByHours]    Script Date: 28.01.2017 16:20:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataByHours](
	[ID] [int] NOT NULL,
	[ScalesNumberID] [int] NULL,
	[Weight] [float] NULL,
	[Time] [time](7) NULL,
	[Date] [date] NULL,
 CONSTRAINT [PK_DataByHours] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DataByMonth]    Script Date: 28.01.2017 16:20:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataByMonth](
	[ID] [int] NOT NULL,
	[ScalesNumberID] [int] NULL,
	[Weight] [float] NULL,
	[NumberMonth] [int] NULL,
 CONSTRAINT [PK_DataByMonth] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DataByShift]    Script Date: 28.01.2017 16:20:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataByShift](
	[ID] [int] NOT NULL,
	[ShiftNumber] [int] NULL,
	[ScalesNumberID] [int] NULL,
	[Weight] [float] NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
 CONSTRAINT [PK_ShiftData] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MeasurementData]    Script Date: 28.01.2017 16:20:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MeasurementData](
	[ID] [int] NOT NULL,
	[ScalesNumberID] [int] NULL,
	[CurrentSpeed] [float] NULL,
	[CurrentWeight] [float] NULL,
	[CurrentProductivity] [float] NULL,
	[TimeOfMeasurement] [datetime] NULL,
 CONSTRAINT [PK_MeasurementData] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ScalesInformation]    Script Date: 28.01.2017 16:20:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScalesInformation](
	[ID] [int] NOT NULL,
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
ALTER TABLE [dbo].[DataByDays]  WITH CHECK ADD  CONSTRAINT [FK_DataByDays_ScalesInformation] FOREIGN KEY([ScaleNumberID])
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
