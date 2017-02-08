USE [scales]
GO
/****** Object:  Table [dbo].[DataByDays]    Script Date: 08.02.2017 21:11:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataByDays](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ScalesNumberID] [int] NULL,
	[Weight] [float] NULL,
	[Productivity] [float] NULL,
	[Date] [date] NULL,
 CONSTRAINT [PK_DataByDays] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DataByHours]    Script Date: 08.02.2017 21:11:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataByHours](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ScalesNumberID] [int] NULL,
	[Weight] [float] NULL,
	[Productivity] [float] NULL,
	[Time] [time](7) NULL,
	[Date] [date] NULL,
 CONSTRAINT [PK_DataByHours] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DataByMonth]    Script Date: 08.02.2017 21:11:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataByMonth](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ScalesNumberID] [int] NULL,
	[Weight] [float] NULL,
	[Productivity] [float] NULL,
	[NumberMonth] [int] NULL,
 CONSTRAINT [PK_DataByMonth] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DataByShift]    Script Date: 08.02.2017 21:11:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataByShift](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ShiftNumber] [int] NULL,
	[ScalesNumberID] [int] NULL,
	[Weight] [float] NULL,
	[Productivity] [float] NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
 CONSTRAINT [PK_ShiftData] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MeasurementData]    Script Date: 08.02.2017 21:11:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MeasurementData](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ScalesNumberID] [int] NULL,
	[CurrentWeight] [float] NULL,
	[CurrentProductivity] [float] NULL,
	[TimeOfMeasurement] [datetime] NULL,
 CONSTRAINT [PK_MeasurementData] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 1) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Personal]    Script Date: 08.02.2017 21:11:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personal](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_Personal] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ScalesInformation]    Script Date: 08.02.2017 21:11:51 ******/
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
ALTER TABLE [dbo].[DataByDays]  WITH CHECK ADD  CONSTRAINT [FK_DataByDays_ScalesInformation] FOREIGN KEY([ScalesNumberID])
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
