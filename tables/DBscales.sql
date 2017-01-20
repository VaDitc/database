USE [master]
GO
/****** Object:  Database [scales]    Script Date: 21.01.2017 0:05:57 ******/
CREATE DATABASE [scales]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'scales', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\scales.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'scales_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\scales_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [scales] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [scales].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [scales] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [scales] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [scales] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [scales] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [scales] SET ARITHABORT OFF 
GO
ALTER DATABASE [scales] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [scales] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [scales] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [scales] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [scales] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [scales] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [scales] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [scales] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [scales] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [scales] SET  DISABLE_BROKER 
GO
ALTER DATABASE [scales] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [scales] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [scales] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [scales] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [scales] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [scales] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [scales] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [scales] SET RECOVERY FULL 
GO
ALTER DATABASE [scales] SET  MULTI_USER 
GO
ALTER DATABASE [scales] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [scales] SET DB_CHAINING OFF 
GO
ALTER DATABASE [scales] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [scales] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [scales] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [scales] SET QUERY_STORE = OFF
GO
USE [scales]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [scales]
GO
/****** Object:  Table [dbo].[DataByDays]    Script Date: 21.01.2017 0:05:58 ******/
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
/****** Object:  Table [dbo].[DataByHours]    Script Date: 21.01.2017 0:05:58 ******/
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
/****** Object:  Table [dbo].[DataByMonth]    Script Date: 21.01.2017 0:05:58 ******/
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
/****** Object:  Table [dbo].[DataByShift]    Script Date: 21.01.2017 0:05:58 ******/
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
/****** Object:  Table [dbo].[MeasurementData]    Script Date: 21.01.2017 0:05:58 ******/
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
/****** Object:  Table [dbo].[ScalesInformation]    Script Date: 21.01.2017 0:05:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScalesInformation](
	[ID] [int] NOT NULL,
	[Scales_Number] [nvarchar](50) NULL,
	[Max_Productivity] [float] NULL,
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
USE [master]
GO
ALTER DATABASE [scales] SET  READ_WRITE 
GO
