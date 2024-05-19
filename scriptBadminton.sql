USE [master]
GO
/****** Object:  Database [BadmintonCourt]    Script Date: 19-May-24 10:43:20 AM ******/
CREATE DATABASE [BadmintonCourt]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BadmintonCourt', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\BadmintonCourt.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BadmintonCourt_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\BadmintonCourt_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BadmintonCourt] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BadmintonCourt].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BadmintonCourt] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BadmintonCourt] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BadmintonCourt] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BadmintonCourt] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BadmintonCourt] SET ARITHABORT OFF 
GO
ALTER DATABASE [BadmintonCourt] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BadmintonCourt] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BadmintonCourt] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BadmintonCourt] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BadmintonCourt] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BadmintonCourt] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BadmintonCourt] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BadmintonCourt] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BadmintonCourt] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BadmintonCourt] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BadmintonCourt] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BadmintonCourt] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BadmintonCourt] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BadmintonCourt] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BadmintonCourt] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BadmintonCourt] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BadmintonCourt] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BadmintonCourt] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BadmintonCourt] SET  MULTI_USER 
GO
ALTER DATABASE [BadmintonCourt] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BadmintonCourt] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BadmintonCourt] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BadmintonCourt] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BadmintonCourt] SET DELAYED_DURABILITY = DISABLED 
GO
USE [BadmintonCourt]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 19-May-24 10:43:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Admin](
	[adminID] [int] NOT NULL,
	[userName] [varchar](50) NOT NULL,
	[password] [varchar](10) NOT NULL,
	[firstName] [varchar](50) NOT NULL,
	[lastName] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[phone] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[adminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BookedSlots]    Script Date: 19-May-24 10:43:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookedSlots](
	[bookingID] [int] NULL,
	[courtID] [int] NULL,
	[slotID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Booking]    Script Date: 19-May-24 10:43:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[bookingID] [int] NOT NULL,
	[totalPrice] [float] NOT NULL,
	[bookingType] [int] NOT NULL,
	[bookingStatus] [int] NOT NULL,
	[userID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[bookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Court]    Script Date: 19-May-24 10:43:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Court](
	[courtID] [int] NOT NULL,
	[courtNumber] [int] NOT NULL,
	[courtImg] [varchar](500) NOT NULL,
	[price] [float] NOT NULL,
	[branchID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[courtID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CourtActiveSlots]    Script Date: 19-May-24 10:43:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourtActiveSlots](
	[courtID] [int] NOT NULL,
	[slotID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[courtID] ASC,
	[slotID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CourtBranch]    Script Date: 19-May-24 10:43:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CourtBranch](
	[branchID] [int] NOT NULL,
	[location] [varchar](50) NOT NULL,
	[branchName] [varchar](50) NOT NULL,
	[branchPhone] [varchar](10) NOT NULL,
	[branchImg] [varchar](500) NOT NULL,
	[adminID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[branchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 19-May-24 10:43:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[userID] [int] NOT NULL,
	[userName] [varchar](50) NOT NULL,
	[password] [varchar](10) NOT NULL,
	[firstName] [varchar](50) NOT NULL,
	[lastName] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[phone] [varchar](10) NOT NULL,
	[balance] [real] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[userName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 19-May-24 10:43:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Feedback](
	[feedbackId] [int] NOT NULL,
	[rating] [int] NOT NULL,
	[content] [varchar](500) NOT NULL,
	[userID] [int] NULL,
	[branchID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[feedbackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 19-May-24 10:43:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[paymentID] [int] NOT NULL,
	[status] [int] NULL,
	[date] [date] NULL,
	[userID] [int] NULL,
	[bookingID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[paymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Slot]    Script Date: 19-May-24 10:43:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slot](
	[slotID] [int] NOT NULL,
	[startTime] [time](7) NOT NULL,
	[endTime] [time](7) NOT NULL,
	[status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[slotID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Staff]    Script Date: 19-May-24 10:43:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Staff](
	[staffID] [int] NOT NULL,
	[userName] [varchar](50) NOT NULL,
	[password] [varchar](10) NOT NULL,
	[firstName] [varchar](50) NOT NULL,
	[lastName] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[phone] [varchar](10) NOT NULL,
	[branchID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[staffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[BookedSlots]  WITH CHECK ADD FOREIGN KEY([bookingID])
REFERENCES [dbo].[Booking] ([bookingID])
GO
ALTER TABLE [dbo].[BookedSlots]  WITH CHECK ADD FOREIGN KEY([courtID], [slotID])
REFERENCES [dbo].[CourtActiveSlots] ([courtID], [slotID])
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[Customer] ([userID])
GO
ALTER TABLE [dbo].[Court]  WITH CHECK ADD FOREIGN KEY([branchID])
REFERENCES [dbo].[CourtBranch] ([branchID])
GO
ALTER TABLE [dbo].[CourtActiveSlots]  WITH CHECK ADD FOREIGN KEY([courtID])
REFERENCES [dbo].[Court] ([courtID])
GO
ALTER TABLE [dbo].[CourtActiveSlots]  WITH CHECK ADD FOREIGN KEY([slotID])
REFERENCES [dbo].[Slot] ([slotID])
GO
ALTER TABLE [dbo].[CourtBranch]  WITH CHECK ADD FOREIGN KEY([adminID])
REFERENCES [dbo].[Admin] ([adminID])
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD FOREIGN KEY([branchID])
REFERENCES [dbo].[CourtBranch] ([branchID])
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[Customer] ([userID])
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD FOREIGN KEY([bookingID])
REFERENCES [dbo].[Booking] ([bookingID])
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[Customer] ([userID])
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD FOREIGN KEY([branchID])
REFERENCES [dbo].[CourtBranch] ([branchID])
GO
USE [master]
GO
ALTER DATABASE [BadmintonCourt] SET  READ_WRITE 
GO
