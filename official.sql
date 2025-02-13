USE [master]
GO
/****** Object:  Database [BadmintonCourt]    Script Date: 7/9/2024 7:25:16 PM ******/
CREATE DATABASE [BadmintonCourt]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BadmintonCourt', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\BadmintonCourt.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BadmintonCourt_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\BadmintonCourt_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BadmintonCourt] SET COMPATIBILITY_LEVEL = 110
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
ALTER DATABASE [BadmintonCourt] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BadmintonCourt] SET AUTO_CREATE_STATISTICS ON 
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
ALTER DATABASE [BadmintonCourt] SET  ENABLE_BROKER 
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
USE [BadmintonCourt]
GO
/****** Object:  Table [dbo].[BookedSlot]    Script Date: 7/9/2024 7:25:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BookedSlot](
	[slotID] [varchar](30) NOT NULL,
	[startTime] [datetime] NOT NULL,
	[endTime] [datetime] NOT NULL,
	[courtID] [varchar](30) NOT NULL,
	[bookingID] [varchar](30) NOT NULL,
	[isDelete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[slotID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 7/9/2024 7:25:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Booking](
	[bookingID] [varchar](30) NOT NULL,
	[amount] [float] NOT NULL,
	[bookingType] [int] NOT NULL,
	[userID] [varchar](30) NOT NULL,
	[bookingDate] [datetime] NOT NULL,
	[changeLog] [int] NOT NULL,
	[isDelete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[bookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Court]    Script Date: 7/9/2024 7:25:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Court](
	[courtID] [varchar](30) NOT NULL,
	[courtImg] [varchar](3000) NULL,
	[branchID] [varchar](30) NOT NULL,
	[price] [real] NOT NULL,
	[description] [nvarchar](500) NOT NULL,
	[courtName] [nvarchar](30) NOT NULL,
	[courtStatus] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[courtID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CourtBranch]    Script Date: 7/9/2024 7:25:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CourtBranch](
	[branchID] [varchar](30) NOT NULL,
	[location] [nvarchar](50) NOT NULL,
	[branchName] [nvarchar](50) NOT NULL,
	[branchPhone] [varchar](10) NOT NULL,
	[branchImg] [varchar](3000) NULL,
	[branchStatus] [int] NOT NULL,
	[mapUrl] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[branchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 7/9/2024 7:25:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Discount](
	[discountID] [varchar](30) NOT NULL,
	[amount] [float] NOT NULL,
	[proportion] [float] NOT NULL,
	[isDelete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[discountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 7/9/2024 7:25:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Feedback](
	[feedbackID] [varchar](30) NOT NULL,
	[rating] [int] NOT NULL,
	[content] [nvarchar](500) NOT NULL,
	[userID] [varchar](30) NULL,
	[branchID] [varchar](30) NOT NULL,
	[period] [datetime] NOT NULL,
	[isDelete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[feedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 7/9/2024 7:25:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Payment](
	[paymentID] [varchar](30) NOT NULL,
	[userID] [varchar](30) NOT NULL,
	[date] [datetime] NOT NULL,
	[bookingID] [varchar](30) NULL,
	[method] [int] NOT NULL,
	[amount] [float] NOT NULL,
	[transactionId] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[paymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Role]    Script Date: 7/9/2024 7:25:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Role](
	[roleID] [varchar](30) NOT NULL,
	[role] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 7/9/2024 7:25:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[userID] [varchar](30) NOT NULL,
	[userName] [nvarchar](50) NULL,
	[password] [varchar](200) NULL,
	[branchID] [varchar](30) NULL,
	[roleID] [varchar](30) NOT NULL,
	[token] [varchar](1000) NULL,
	[actionPeriod] [datetime] NULL,
	[balance] [float] NULL,
	[accessFail] [int] NULL,
	[lastFail] [datetime] NULL,
	[activeStatus] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserDetail]    Script Date: 7/9/2024 7:25:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserDetail](
	[userID] [varchar](30) NOT NULL,
	[firstName] [nvarchar](50) NULL,
	[lastName] [nvarchar](50) NULL,
	[email] [varchar](50) NOT NULL,
	[phone] [varchar](10) NULL,
	[facebook] [varchar](50) NULL,
	[img] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[BookedSlot] ([slotID], [startTime], [endTime], [courtID], [bookingID], [isDelete]) VALUES (N'S0000002', CAST(0x0000B188011826C0 AS DateTime), CAST(0x0000B18801391C40 AS DateTime), N'C014', N'BK0000002', NULL)
INSERT [dbo].[BookedSlot] ([slotID], [startTime], [endTime], [courtID], [bookingID], [isDelete]) VALUES (N'S0000003', CAST(0x0000B188011826C0 AS DateTime), CAST(0x0000B18801391C40 AS DateTime), N'C001', N'BK0000003', NULL)
INSERT [dbo].[BookedSlot] ([slotID], [startTime], [endTime], [courtID], [bookingID], [isDelete]) VALUES (N'S0000004', CAST(0x0000B18F011826C0 AS DateTime), CAST(0x0000B18F01391C40 AS DateTime), N'C001', N'BK0000003', NULL)
INSERT [dbo].[BookedSlot] ([slotID], [startTime], [endTime], [courtID], [bookingID], [isDelete]) VALUES (N'S0000005', CAST(0x0000B196011826C0 AS DateTime), CAST(0x0000B19601391C40 AS DateTime), N'C001', N'BK0000003', NULL)
INSERT [dbo].[BookedSlot] ([slotID], [startTime], [endTime], [courtID], [bookingID], [isDelete]) VALUES (N'S0000006', CAST(0x0000B19D011826C0 AS DateTime), CAST(0x0000B19D01391C40 AS DateTime), N'C001', N'BK0000003', NULL)
INSERT [dbo].[BookedSlot] ([slotID], [startTime], [endTime], [courtID], [bookingID], [isDelete]) VALUES (N'S0000007', CAST(0x0000B1A4011826C0 AS DateTime), CAST(0x0000B1A401391C40 AS DateTime), N'C001', N'BK0000003', NULL)
INSERT [dbo].[BookedSlot] ([slotID], [startTime], [endTime], [courtID], [bookingID], [isDelete]) VALUES (N'S0000008', CAST(0x0000B1AB011826C0 AS DateTime), CAST(0x0000B1AB01391C40 AS DateTime), N'C001', N'BK0000003', NULL)
INSERT [dbo].[BookedSlot] ([slotID], [startTime], [endTime], [courtID], [bookingID], [isDelete]) VALUES (N'S0000009', CAST(0x0000B1B2011826C0 AS DateTime), CAST(0x0000B1B201391C40 AS DateTime), N'C001', N'BK0000003', NULL)
INSERT [dbo].[BookedSlot] ([slotID], [startTime], [endTime], [courtID], [bookingID], [isDelete]) VALUES (N'S0000010', CAST(0x0000B1B9011826C0 AS DateTime), CAST(0x0000B1B901391C40 AS DateTime), N'C001', N'BK0000003', NULL)
INSERT [dbo].[BookedSlot] ([slotID], [startTime], [endTime], [courtID], [bookingID], [isDelete]) VALUES (N'S0000011', CAST(0x0000B1C0011826C0 AS DateTime), CAST(0x0000B1C001391C40 AS DateTime), N'C001', N'BK0000003', NULL)
INSERT [dbo].[BookedSlot] ([slotID], [startTime], [endTime], [courtID], [bookingID], [isDelete]) VALUES (N'S0000012', CAST(0x0000B18400D63BC0 AS DateTime), CAST(0x0000B18400F73140 AS DateTime), N'C001', N'BK0000004', NULL)
INSERT [dbo].[BookedSlot] ([slotID], [startTime], [endTime], [courtID], [bookingID], [isDelete]) VALUES (N'S0000013', CAST(0x0000B189009450C0 AS DateTime), CAST(0x0000B18900C5C100 AS DateTime), N'C014', N'BK0000005', NULL)
INSERT [dbo].[BookedSlot] ([slotID], [startTime], [endTime], [courtID], [bookingID], [isDelete]) VALUES (N'S0000014', CAST(0x0000B1A8009450C0 AS DateTime), CAST(0x0000B1A800C5C100 AS DateTime), N'C014', N'BK0000006', NULL)
INSERT [dbo].[BookedSlot] ([slotID], [startTime], [endTime], [courtID], [bookingID], [isDelete]) VALUES (N'S0000015', CAST(0x0000B1A600A4CB80 AS DateTime), CAST(0x0000B1A600C5C100 AS DateTime), N'C003', N'BK0000007', NULL)
INSERT [dbo].[BookedSlot] ([slotID], [startTime], [endTime], [courtID], [bookingID], [isDelete]) VALUES (N'S0000016', CAST(0x0000B1A400C5C100 AS DateTime), CAST(0x0000B1A400E6B680 AS DateTime), N'C003', N'BK0000008', NULL)
INSERT [dbo].[BookedSlot] ([slotID], [startTime], [endTime], [courtID], [bookingID], [isDelete]) VALUES (N'S0000017', CAST(0x0000B1AB00C5C100 AS DateTime), CAST(0x0000B1AB00E6B680 AS DateTime), N'C003', N'BK0000008', NULL)
INSERT [dbo].[BookedSlot] ([slotID], [startTime], [endTime], [courtID], [bookingID], [isDelete]) VALUES (N'S0000018', CAST(0x0000B1B200C5C100 AS DateTime), CAST(0x0000B1B200E6B680 AS DateTime), N'C003', N'BK0000008', NULL)
INSERT [dbo].[BookedSlot] ([slotID], [startTime], [endTime], [courtID], [bookingID], [isDelete]) VALUES (N'S0000019', CAST(0x0000B1B900C5C100 AS DateTime), CAST(0x0000B1B900E6B680 AS DateTime), N'C003', N'BK0000008', NULL)
INSERT [dbo].[BookedSlot] ([slotID], [startTime], [endTime], [courtID], [bookingID], [isDelete]) VALUES (N'S0000020', CAST(0x0000B1C000C5C100 AS DateTime), CAST(0x0000B1C000E6B680 AS DateTime), N'C003', N'BK0000008', NULL)
INSERT [dbo].[BookedSlot] ([slotID], [startTime], [endTime], [courtID], [bookingID], [isDelete]) VALUES (N'S0000021', CAST(0x0000B1C700C5C100 AS DateTime), CAST(0x0000B1C700E6B680 AS DateTime), N'C003', N'BK0000008', NULL)
INSERT [dbo].[BookedSlot] ([slotID], [startTime], [endTime], [courtID], [bookingID], [isDelete]) VALUES (N'S0000022', CAST(0x0000B1CE00C5C100 AS DateTime), CAST(0x0000B1CE00E6B680 AS DateTime), N'C003', N'BK0000008', NULL)
INSERT [dbo].[BookedSlot] ([slotID], [startTime], [endTime], [courtID], [bookingID], [isDelete]) VALUES (N'S0000023', CAST(0x0000B1D500C5C100 AS DateTime), CAST(0x0000B1D500E6B680 AS DateTime), N'C003', N'BK0000008', NULL)
INSERT [dbo].[BookedSlot] ([slotID], [startTime], [endTime], [courtID], [bookingID], [isDelete]) VALUES (N'S0000024', CAST(0x0000B1DC00C5C100 AS DateTime), CAST(0x0000B1DC00E6B680 AS DateTime), N'C003', N'BK0000008', NULL)
INSERT [dbo].[BookedSlot] ([slotID], [startTime], [endTime], [courtID], [bookingID], [isDelete]) VALUES (N'S0000025', CAST(0x0000B1A800B54640 AS DateTime), CAST(0x0000B1A8011826C0 AS DateTime), N'C001', N'BK0000009', NULL)
INSERT [dbo].[BookedSlot] ([slotID], [startTime], [endTime], [courtID], [bookingID], [isDelete]) VALUES (N'S0000026', CAST(0x0000B1A800E6B680 AS DateTime), CAST(0x0000B1A80107AC00 AS DateTime), N'C001', N'BK0000010', NULL)
INSERT [dbo].[BookedSlot] ([slotID], [startTime], [endTime], [courtID], [bookingID], [isDelete]) VALUES (N'S1', CAST(0x0000B1A100735B40 AS DateTime), CAST(0x0000B1A1017B0740 AS DateTime), N'C001', N'B1', NULL)
INSERT [dbo].[Booking] ([bookingID], [amount], [bookingType], [userID], [bookingDate], [changeLog], [isDelete]) VALUES (N'B1', 0, 0, N'U0000027', CAST(0x0000000000000000 AS DateTime), 0, NULL)
INSERT [dbo].[Booking] ([bookingID], [amount], [bookingType], [userID], [bookingDate], [changeLog], [isDelete]) VALUES (N'BK0000002', 2640000, 1, N'U0000008', CAST(0x0000B1A1001B9B30 AS DateTime), 0, NULL)
INSERT [dbo].[Booking] ([bookingID], [amount], [bookingType], [userID], [bookingDate], [changeLog], [isDelete]) VALUES (N'BK0000003', 560000, 2, N'U0000008', CAST(0x0000B1A1001C32BD AS DateTime), 0, NULL)
INSERT [dbo].[Booking] ([bookingID], [amount], [bookingType], [userID], [bookingDate], [changeLog], [isDelete]) VALUES (N'BK0000004', 560000, 1, N'U0000002', CAST(0x0000B1A1001CBB32 AS DateTime), 0, NULL)
INSERT [dbo].[Booking] ([bookingID], [amount], [bookingType], [userID], [bookingDate], [changeLog], [isDelete]) VALUES (N'BK0000005', 1320000, 1, N'U0000008', CAST(0x0000B1A1007C3A7B AS DateTime), 0, NULL)
INSERT [dbo].[Booking] ([bookingID], [amount], [bookingType], [userID], [bookingDate], [changeLog], [isDelete]) VALUES (N'BK0000006', 1320000, 1, N'U0000008', CAST(0x0000B1A10080CB40 AS DateTime), 0, NULL)
INSERT [dbo].[Booking] ([bookingID], [amount], [bookingType], [userID], [bookingDate], [changeLog], [isDelete]) VALUES (N'BK0000007', 60000, 1, N'U0000006', CAST(0x0000B1A10085871B AS DateTime), 0, NULL)
INSERT [dbo].[Booking] ([bookingID], [amount], [bookingType], [userID], [bookingDate], [changeLog], [isDelete]) VALUES (N'BK0000008', 480000, 2, N'U0000008', CAST(0x0000B1A10086236E AS DateTime), 0, NULL)
INSERT [dbo].[Booking] ([bookingID], [amount], [bookingType], [userID], [bookingDate], [changeLog], [isDelete]) VALUES (N'BK0000009', 210000, 1, N'U0000028', CAST(0x0000B1A700AA9CD2 AS DateTime), 0, NULL)
INSERT [dbo].[Booking] ([bookingID], [amount], [bookingType], [userID], [bookingDate], [changeLog], [isDelete]) VALUES (N'BK0000010', 70000, 1, N'U0000028', CAST(0x0000B1A700AB8E3D AS DateTime), 0, NULL)
INSERT [dbo].[Court] ([courtID], [courtImg], [branchID], [price], [description], [courtName], [courtStatus]) VALUES (N'C001', N'https://firebasestorage.googleapis.com/v0/b/badmintoncourtbooking-183b2.appspot.com/o/files%2Fc1ebce0c-f151-49ad-84a1-6ff6f001d77f?alt=media&token=67c6a16c-00ed-46ad-a196-4a90bddd1c17|https://firebasestorage.googleapis.com/v0/b/badmintoncourtbooking-183b2.appspot.com/o/files%2F27994f5c-ac6b-4783-b967-4d43df64ce03?alt=media&token=d82d15e2-8aef-4c78-894c-fb317913afd8|https://firebasestorage.googleapis.com/v0/b/badmintoncourtbooking-183b2.appspot.com/o/files%2F2d0c65a7-c8e3-41dc-87a8-73736f17f03c?alt=media&token=28fe4e3b-3fd3-41ff-8391-1608981e9228|https://firebasestorage.googleapis.com/v0/b/badmintoncourtbooking-183b2.appspot.com/o/files%2F035f22fb-bc07-40c8-91f7-ebac164ceb46?alt=media&token=ca73906b-3153-451d-9fc3-30ce2d8bcaa2', N'B001', 35000, N'Sân cầu lông phố sáng tiện nghi, phục vụ tốt cho người chơi.', N'Sân cầu lông A', 1)
INSERT [dbo].[Court] ([courtID], [courtImg], [branchID], [price], [description], [courtName], [courtStatus]) VALUES (N'C002', N'https://firebasestorage.googleapis.com/v0/b/badmintoncourtbooking-183b2.appspot.com/o/files%2F072a5e0e-d860-4abd-9ca3-9ef3364a3444?alt=media&token=c6e99c4d-8650-4762-9bdf-96db817fa1b9|https://firebasestorage.googleapis.com/v0/b/badmintoncourtbooking-183b2.appspot.com/o/files%2F7fd7d94a-5258-4b8e-a664-0c49abcdc20a?alt=media&token=d914487b-d61b-4ac9-a841-dc3f47c49164|https://firebasestorage.googleapis.com/v0/b/badmintoncourtbooking-183b2.appspot.com/o/files%2F10dd356d-22ef-4ffe-b85f-e8bfd5aa467a?alt=media&token=c84e99b1-a3dc-4a69-beae-55b5b00eeb13|https://firebasestorage.googleapis.com/v0/b/badmintoncourtbooking-183b2.appspot.com/o/files%2Fbe2bce88-839d-493a-86ae-8bc4138f6c51?alt=media&token=8c63ab38-73a0-4d2b-b1a3-7af77fae5abe', N'B001', 40000, N'Sân cầu lông thi đấu chuyên nghiệp, đầy đủ trang thiết bị.', N'Sân cầu lông B', 1)
INSERT [dbo].[Court] ([courtID], [courtImg], [branchID], [price], [description], [courtName], [courtStatus]) VALUES (N'C003', N'https://firebasestorage.googleapis.com/v0/b/badmintoncourtbooking-183b2.appspot.com/o/files%2F2f7f29e3-f3b9-454d-bd6d-fd26b6804dd3?alt=media&token=6119aa48-58b4-48c5-a481-aa1285960096|https://firebasestorage.googleapis.com/v0/b/badmintoncourtbooking-183b2.appspot.com/o/files%2Feffa2a49-2b86-47ac-8044-38053dff3e3d?alt=media&token=14f39967-f7a0-4769-a58b-37a7f9223e40|https://firebasestorage.googleapis.com/v0/b/badmintoncourtbooking-183b2.appspot.com/o/files%2Fe22c5bb9-d380-4b7e-82b1-7d98b71d0447?alt=media&token=961feb76-b506-4060-a15f-239b4c8b436c|https://firebasestorage.googleapis.com/v0/b/badmintoncourtbooking-183b2.appspot.com/o/files%2F7dc02ee6-c100-4613-ab47-64f0dd263d6f?alt=media&token=c917132e-dc11-4f0a-9993-8a0570e76d89', N'B001', 30000, N'Sân cầu lông rộng rãi, không gian thoáng mát, thích hợp cho gia đình.', N'Sân cầu lông C', 1)
INSERT [dbo].[Court] ([courtID], [courtImg], [branchID], [price], [description], [courtName], [courtStatus]) VALUES (N'C004', N'https://firebasestorage.googleapis.com/v0/b/badmintoncourtbooking-183b2.appspot.com/o/files%2F36fea2a0-e0af-4393-a517-17116dc26afd?alt=media&token=e60fb50b-93a0-4a25-895a-956213bd8e1a|https://firebasestorage.googleapis.com/v0/b/badmintoncourtbooking-183b2.appspot.com/o/files%2F0ac47897-09a9-45c8-9801-d4a2af98cbbe?alt=media&token=3b785549-0882-40f4-95b7-c00d1640ccd8|https://firebasestorage.googleapis.com/v0/b/badmintoncourtbooking-183b2.appspot.com/o/files%2Fdd81cf46-485f-4e27-af8c-ed7e0371b67a?alt=media&token=acee8ba3-a971-4010-835c-7d98da13d6d1|https://firebasestorage.googleapis.com/v0/b/badmintoncourtbooking-183b2.appspot.com/o/files%2F6aa8538a-9827-4af4-85b9-b0f7abec3dcf?alt=media&token=e1fbd9bf-00a5-41a7-b9a7-3c94072c9657', N'B001', 45000, N'Sân cầu lông được trang bị đầy đủ ánh sáng và hệ thống thông gió tốt.', N'Sân cầu lông D', 1)
INSERT [dbo].[Court] ([courtID], [courtImg], [branchID], [price], [description], [courtName], [courtStatus]) VALUES (N'C005', N'Image 1:https://firebasestorage.googleapis.com/v0/b/badmintoncourtbooking-183b2.appspot.com/o/files/8097a422-4ce8-46e9-b22c-a95281439b2f?alt=media', N'B002', 60000, N'Sân c?u lông d?ng c?p, dành cho các v?n d?ng viên chuyên nghi?p.', N'Sân c?u lông A', 1)
INSERT [dbo].[Court] ([courtID], [courtImg], [branchID], [price], [description], [courtName], [courtStatus]) VALUES (N'C006', N'Image 1:https://firebasestorage.googleapis.com/v0/b/badmintoncourtbooking-183b2.appspot.com/o/files/0d679e8d-2eb8-4afc-9bfe-eb0d0181f1ab?alt=media', N'B002', 55000, N'Sân c?u lông ph?c v? nhu c?u thu giãn và rèn luy?n s?c kh?e.', N'Sân c?u lông B', 1)
INSERT [dbo].[Court] ([courtID], [courtImg], [branchID], [price], [description], [courtName], [courtStatus]) VALUES (N'C007', N'Image 1:https://firebasestorage.googleapis.com/v0/b/badmintoncourtbooking-183b2.appspot.com/o/files/0ec87dda-cfcb-43d2-a953-96ee5fb8730f?alt=media', N'B002', 70000, N'Sân c?u lông cao c?p v?i d?y d? d?ch v? và ti?n nghi.', N'Sân c?u lông C', 1)
INSERT [dbo].[Court] ([courtID], [courtImg], [branchID], [price], [description], [courtName], [courtStatus]) VALUES (N'C008', N'Image 1:https://firebasestorage.googleapis.com/v0/b/badmintoncourtbooking-183b2.appspot.com/o/files/ca3ff73d-0cf0-4785-860e-c149af9b9c77?alt=media', N'B003', 50000, N'Sân c?u lông phù h?p cho c? nh?ng ngu?i m?i b?t d?u và nh?ng v?n d?ng viên chuyên nghi?p.', N'Sân c?u lông A', 1)
INSERT [dbo].[Court] ([courtID], [courtImg], [branchID], [price], [description], [courtName], [courtStatus]) VALUES (N'C009', N'Image 1:https://firebasestorage.googleapis.com/v0/b/badmintoncourtbooking-183b2.appspot.com/o/files/129a10c5-dfef-4efb-9598-7ddc154a7d7c?alt=media', N'B003', 35000, N'Sân c?u lông v?i không gian thoáng d?ng và ti?n nghi.', N'Sân c?u lông B', 1)
INSERT [dbo].[Court] ([courtID], [courtImg], [branchID], [price], [description], [courtName], [courtStatus]) VALUES (N'C010', N'Image 1:https://firebasestorage.googleapis.com/v0/b/badmintoncourtbooking-183b2.appspot.com/o/files/b728e454-dd53-41f0-89e1-63c7c8b6a750?alt=media', N'B003', 40000, N'Sân c?u lông dáp ?ng m?i nhu c?u c?a ngu?i choi, t? gi?i trí d?n thi d?u.', N'Sân c?u lông C', 1)
INSERT [dbo].[Court] ([courtID], [courtImg], [branchID], [price], [description], [courtName], [courtStatus]) VALUES (N'C011', N'Image 1:https://firebasestorage.googleapis.com/v0/b/badmintoncourtbooking-183b2.appspot.com/o/files/57e45e6c-dab6-4387-826f-adf722822489?alt=media', N'B003', 45000, N'Sân c?u lông ph?c v? cho m?i d?i tu?ng, t? tr? em d?n ngu?i già.', N'Sân c?u lông D', 1)
INSERT [dbo].[Court] ([courtID], [courtImg], [branchID], [price], [description], [courtName], [courtStatus]) VALUES (N'C012', N'Image 1:https://firebasestorage.googleapis.com/v0/b/badmintoncourtbooking-183b2.appspot.com/o/files/670c8e7e-3b96-4751-b4d9-b34258451acc?alt=media', N'B003', 38000, N'Sân c?u lông phù h?p cho các b?n tr? yêu thích th? thao.', N'Sân c?u lông E', 1)
INSERT [dbo].[Court] ([courtID], [courtImg], [branchID], [price], [description], [courtName], [courtStatus]) VALUES (N'C013', N'Image 1:https://firebasestorage.googleapis.com/v0/b/badmintoncourtbooking-183b2.appspot.com/o/files/0126941f-7e40-47b1-8bd0-a1ad50eca76e?alt=media', N'B003', 42000, N'Sân c?u lông có không gian m?, phù h?p cho gia dình và b?n bè.', N'Sân c?u lông F', 1)
INSERT [dbo].[Court] ([courtID], [courtImg], [branchID], [price], [description], [courtName], [courtStatus]) VALUES (N'C014', N'https://firebasestorage.googleapis.com/v0/b/badmintoncourtbooking-183b2.appspot.com/o/files%2F4a1094b2-e0a1-4abf-94df-5d86ff83681a?alt=media&token=524f396f-fae2-4fb1-a7c3-b520bfbcc5e1|https://firebasestorage.googleapis.com/v0/b/badmintoncourtbooking-183b2.appspot.com/o/files%2F12115add-27a2-40d2-bde6-c4a43f963100?alt=media&token=92986946-2229-4ff6-b316-33b999bb38be|https://firebasestorage.googleapis.com/v0/b/badmintoncourtbooking-183b2.appspot.com/o/files%2Fdb6b9b4f-4cc7-46f5-9879-b48e90f330f6?alt=media&token=021ae4c9-8762-4ab4-91a7-96db6f67a24b|https://firebasestorage.googleapis.com/v0/b/badmintoncourtbooking-183b2.appspot.com/o/files%2Fbce0fc91-5c6b-4aeb-a6f8-3b988fd48df7?alt=media&token=aa1f0879-3717-4334-a3bd-b9999a684301', N'B004', 55000, N'Sân cầu lông rộng rãi với đầy đủ thiết bị và ánh sáng tự nhiên.', N'Sân cầu lông A', 1)
INSERT [dbo].[Court] ([courtID], [courtImg], [branchID], [price], [description], [courtName], [courtStatus]) VALUES (N'C015', N'https://firebasestorage.googleapis.com/v0/b/badmintoncourtbooking-183b2.appspot.com/o/files%2Fccbf1558-ac08-4119-8d87-26c43b28ce36?alt=media&token=b0e210e6-d8cd-4602-9a14-d6cadf4f54d6|https://firebasestorage.googleapis.com/v0/b/badmintoncourtbooking-183b2.appspot.com/o/files%2Fbee9c932-3692-4177-b926-8021edebcdbf?alt=media&token=5efead18-9030-4812-947c-04ac7fd12bee|https://firebasestorage.googleapis.com/v0/b/badmintoncourtbooking-183b2.appspot.com/o/files%2Ffb69e56a-b887-4f6f-9f80-6c72814bafe3?alt=media&token=203377f3-f7fd-46d9-ba6e-3d682ee78c1d|https://firebasestorage.googleapis.com/v0/b/badmintoncourtbooking-183b2.appspot.com/o/files%2F6ac14cc2-101f-414c-8736-13b86e19a7fe?alt=media&token=848cd917-012f-4153-b22d-86f127e72fd0', N'B004', 60000, N'Sân cầu lông dành cho các cuộc thi chuyên nghiệp và huấn luyện viên.', N'Sân cầu lông B', 1)
INSERT [dbo].[Court] ([courtID], [courtImg], [branchID], [price], [description], [courtName], [courtStatus]) VALUES (N'C016', N'https://firebasestorage.googleapis.com/v0/b/badmintoncourtbooking-183b2.appspot.com/o/files%2F0da06a47-a5e8-4f54-88a2-45f9e7d752d6?alt=media&token=bbc8983d-9cb2-4fec-b43d-f2583c9eda17|https://firebasestorage.googleapis.com/v0/b/badmintoncourtbooking-183b2.appspot.com/o/files%2F45131afc-5202-4c30-b879-c30502a50388?alt=media&token=0ae3f17c-2912-4a3a-bea6-5fbc68e8e6a3|https://firebasestorage.googleapis.com/v0/b/badmintoncourtbooking-183b2.appspot.com/o/files%2F07b13b66-a4b2-46c2-8153-3ba98659e2fc?alt=media&token=41c79802-bc21-419f-a5a1-7ee964883c26|https://firebasestorage.googleapis.com/v0/b/badmintoncourtbooking-183b2.appspot.com/o/files%2F90b87f27-73a2-4776-93cc-0d1921b9e285?alt=media&token=10609efe-4ac4-485d-8a45-7afae815aadc', N'B004', 45000, N'Sân cầu lông tiện nghi với không gian lý tưởng để rèn luyện sức khỏe.', N'Sân cầu lông C', 1)
INSERT [dbo].[Court] ([courtID], [courtImg], [branchID], [price], [description], [courtName], [courtStatus]) VALUES (N'C017', N'Image 1:https://firebasestorage.googleapis.com/v0/b/badmintoncourtbooking-183b2.appspot.com/o/files/09193b3c-038e-43be-8c43-6fe0d149f8ff?alt=media', N'B005', 40000, N'Sân c?u lông ph?c v? cho m?i nhu c?u, t? gia dình d?n b?n bè.', N'Sân c?u lông A', 0)
INSERT [dbo].[Court] ([courtID], [courtImg], [branchID], [price], [description], [courtName], [courtStatus]) VALUES (N'C018', N'Image 1:https://firebasestorage.googleapis.com/v0/b/badmintoncourtbooking-183b2.appspot.com/o/files/4912d799-a5c5-4bd5-94f6-f8ff6d0da620?alt=media', N'B005', 45000, N'Sân c?u lông dáp ?ng m?i yêu c?u v? ch?t lu?ng và d?ch v?.', N'Sân c?u lông B', 0)
INSERT [dbo].[Court] ([courtID], [courtImg], [branchID], [price], [description], [courtName], [courtStatus]) VALUES (N'C019', N'Image 1:https://firebasestorage.googleapis.com/v0/b/badmintoncourtbooking-183b2.appspot.com/o/files/dd66abed-901b-473f-ae30-f57f614ba906?alt=media', N'B005', 35000, N'Sân c?u lông phù h?p cho m?i d?i tu?ng t? ngu?i m?i choi d?n ngu?i chuyên nghi?p.', N'Sân c?u lông C', 0)
INSERT [dbo].[CourtBranch] ([branchID], [location], [branchName], [branchPhone], [branchImg], [branchStatus], [mapUrl]) VALUES (N'B001', N'Bà Rịa - Vũng Tàu', N'Sân cầu lông Vũng Tàu', N'0987654321', N'https://firebasestorage.googleapis.com/v0/b/badmintoncourtbooking-183b2.appspot.com/o/files%2F9d640055-c2bb-4f06-aa6a-bdb65c32f18a?alt=media&token=b0535ef9-be14-4ae1-9a2c-0f4fb53a4c73', 1, N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3916.9443900204574!2d106.87432764457839!3d10.96757020000001!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3174ddf13a55ec25:0x662ef71599c3d17!2zU8OibiBj4bqndSBsw7RuZyBOaOG6rXQgVGjDoG5o!5e0!3m2!1sen!2s!4v1720368371037!5m2!1sen!2s')
INSERT [dbo].[CourtBranch] ([branchID], [location], [branchName], [branchPhone], [branchImg], [branchStatus], [mapUrl]) VALUES (N'B002', N'Hồ Chí Minh', N'Sân cầu lông Quận 1', N'0976543210', N'https://firebasestorage.googleapis.com/v0/b/badmintoncourtbooking-183b2.appspot.com/o/files%2Fb0b99800-e368-45a4-8149-71c22cecc06a?alt=media&token=30a7b0cc-8bef-4d69-a238-60ffcc4465bc', 1, N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3916.8815686864264!2d106.89844363488771!3d10.972311000000007!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3174dda1621b4d5f:0x22bfdc5082afbeb6!2sDuc Thinh Badminton Club!5e0!3m2!1sen!2s!4v1720368396794!5m2!1sen!2s')
INSERT [dbo].[CourtBranch] ([branchID], [location], [branchName], [branchPhone], [branchImg], [branchStatus], [mapUrl]) VALUES (N'B003', N'Hà Nội', N'Sân cầu lông Hoàn Kiếm', N'0912345678', N'https://firebasestorage.googleapis.com/v0/b/badmintoncourtbooking-183b2.appspot.com/o/files%2F1fd6a274-af67-4fa7-b945-a78c6438ac1c?alt=media&token=95306da9-170f-4707-8dfc-6dafd624a62a', 1, N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3917.9602806219896!2d106.90020523488771!3d10.890623200000002!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3174df61447a8da1:0x184f54e5efde4168!2zU8OibiBj4bqndSBsw7RuZyBQaMaw4bubYyBUw6Ju!5e0!3m2!1sen!2s!4v1720368420820!5m2!1sen!2s')
INSERT [dbo].[CourtBranch] ([branchID], [location], [branchName], [branchPhone], [branchImg], [branchStatus], [mapUrl]) VALUES (N'B004', N'Đà Nẵng', N'Sân cầu lông Đà Nẵng', N'0901234567', N'https://firebasestorage.googleapis.com/v0/b/badmintoncourtbooking-183b2.appspot.com/o/files%2Fed4976c4-1759-49d5-b329-52bb1ae0c078?alt=media&token=62882de4-9b79-437d-a27c-99c5d100acf6', 1, N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3917.1275711519697!2d106.85337103488773!3d10.953734899999994!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3174df1214344147:0x59ef30d1ff880c96!2zU8OibiBD4bqndSDEkOG7iW5oIENhbw!5e0!3m2!1sen!2s!4v1720368478338!5m2!1sen!2s')
INSERT [dbo].[CourtBranch] ([branchID], [location], [branchName], [branchPhone], [branchImg], [branchStatus], [mapUrl]) VALUES (N'B005', N'C?n Tho', N'Sân c?u lông C?n Tho', N'0934567890', N'https://firebasestorage.googleapis.com/v0/b/badmintoncourtbooking-183b2.appspot.com/o/files%2F33f335c1-e11a-45bc-bb17-a8923edd20cb?alt=media&token=f5806297-a731-4c35-b6be-0ff2583f3209', 0, N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3917.1275711519697!2d106.85337103488773!3d10.953734899999994!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3174dd808bc444ed:0x81e9374266d93fe!2zU8OibiBD4bqndSBMw7RuZyBBbmggSGnhur91!5e0!3m2!1sen!2s!4v1720368515134!5m2!1sen!2s')
INSERT [dbo].[Feedback] ([feedbackID], [rating], [content], [userID], [branchID], [period]) VALUES (N'F0000001', 5, N'Sân bóng rộng rãi và đầy đủ tiện nghi, phục vụ tốt cho các trận đấu.', N'U0000001', N'B001', CAST(0x0000B18C00191EAE AS DateTime))
INSERT [dbo].[Feedback] ([feedbackID], [rating], [content], [userID], [branchID], [period]) VALUES (N'F0000002', 4, N'Giá cả hợp lý, không gian sân bóng rộng và thoáng mát.', N'U0000002', N'B002', CAST(0x0000B19700191EAE AS DateTime))
INSERT [dbo].[Feedback] ([feedbackID], [rating], [content], [userID], [branchID], [period]) VALUES (N'F0000003', 3, N'Sân bóng không được bảo trì tốt, gây khó chịu khi chơi.', N'U0000003', N'B003', CAST(0x0000B19800191EAE AS DateTime))
INSERT [dbo].[Feedback] ([feedbackID], [rating], [content], [userID], [branchID], [period]) VALUES (N'F0000004', 2, N'Nhân viên phục vụ không nhiệt tình, thiếu chuyên nghiệp.', N'U0000004', N'B004', CAST(0x0000B18900191EAE AS DateTime))
INSERT [dbo].[Feedback] ([feedbackID], [rating], [content], [userID], [branchID], [period]) VALUES (N'F0000005', 5, N'Vị trí thuận lợi, dễ dàng di chuyển vào cuối tuần.', N'U0000005', N'B005', CAST(0x0000B19400191EAE AS DateTime))
INSERT [dbo].[Feedback] ([feedbackID], [rating], [content], [userID], [branchID], [period]) VALUES (N'F0000006', 4, N'Không gian sân bóng rộng và sạch sẽ, phục vụ tốt cho các đội chơi.', N'U0000006', N'B001', CAST(0x0000B19200191EAE AS DateTime))
INSERT [dbo].[Feedback] ([feedbackID], [rating], [content], [userID], [branchID], [period]) VALUES (N'F0000007', 3, N'Giá cả hơi cao so với chất lượng sân bóng.', N'U0000007', N'B002', CAST(0x0000B18C00191EAF AS DateTime))
INSERT [dbo].[Feedback] ([feedbackID], [rating], [content], [userID], [branchID], [period]) VALUES (N'F0000008', 1, N'Sân bóng quá đông vào các buổi chiều cuối tuần, không thoải mái cho việc chơi.', N'U0000008', N'B003', CAST(0x0000B18B00191EAF AS DateTime))
INSERT [dbo].[Feedback] ([feedbackID], [rating], [content], [userID], [branchID], [period]) VALUES (N'F0000009', 2, N'Không gian sân bóng hẹp và không có ánh sáng đủ vào ban đêm.', N'U0000009', N'B004', CAST(0x0000B19000191EAF AS DateTime))
INSERT [dbo].[Feedback] ([feedbackID], [rating], [content], [userID], [branchID], [period]) VALUES (N'F0000010', 4, N'Sân bóng đẹp và rộng rãi, phù hợp cho các trận đấu.', N'U0000010', N'B005', CAST(0x0000B1A100191EAF AS DateTime))
INSERT [dbo].[Feedback] ([feedbackID], [rating], [content], [userID], [branchID], [period]) VALUES (N'F0000011', 3, N'Nhân viên không thân thiện và không giải quyết thắc mắc của khách hàng nhanh chóng.', N'U0000011', N'B001', CAST(0x0000B19A00191EAF AS DateTime))
INSERT [dbo].[Feedback] ([feedbackID], [rating], [content], [userID], [branchID], [period]) VALUES (N'F0000012', 5, N'Dịch vụ tốt, giá cả hợp lý và sân bóng luôn sạch sẽ.', N'U0000012', N'B002', CAST(0x0000B19800191EAF AS DateTime))
INSERT [dbo].[Feedback] ([feedbackID], [rating], [content], [userID], [branchID], [period]) VALUES (N'F0000013', 2, N'Nhân viên phục vụ không nhiệt tình và không chuyên nghiệp.', N'U0000013', N'B003', CAST(0x0000B1A100191EAF AS DateTime))
INSERT [dbo].[Feedback] ([feedbackID], [rating], [content], [userID], [branchID], [period]) VALUES (N'F0000014', 4, N'Sân bóng sạch sẽ và thoáng mát vào ban đêm, phục vụ tốt cho các trận đấu.', N'U0000014', N'B004', CAST(0x0000B19E00191EAF AS DateTime))
INSERT [dbo].[Feedback] ([feedbackID], [rating], [content], [userID], [branchID], [period]) VALUES (N'F0000015', 3, N'Không gian chơi hẹp và ồn ào quá mức, không thoải mái cho các trận đấu lớn.', N'U0000015', N'B005', CAST(0x0000B19300191EAF AS DateTime))
INSERT [dbo].[Feedback] ([feedbackID], [rating], [content], [userID], [branchID], [period]) VALUES (N'F0000016', 1, N'Không có chỗ đậu xe gần sân, rất bất tiện khi đi chơi bóng.', N'U0000001', N'B001', CAST(0x0000B19E00191EAF AS DateTime))
INSERT [dbo].[Feedback] ([feedbackID], [rating], [content], [userID], [branchID], [period]) VALUES (N'F0000017', 5, N'Trung tâm có nhiều sân chơi, phù hợp cho nhiều nhóm lớn.', N'U0000002', N'B002', CAST(0x0000B18B00191EAF AS DateTime))
INSERT [dbo].[Feedback] ([feedbackID], [rating], [content], [userID], [branchID], [period]) VALUES (N'F0000018', 4, N'Giá cả hợp lý, nhân viên nhiệt tình và sân bóng luôn được bảo trì tốt.', N'U0000003', N'B003', CAST(0x0000B19800191EAF AS DateTime))
INSERT [dbo].[Feedback] ([feedbackID], [rating], [content], [userID], [branchID], [period]) VALUES (N'F0000019', 3, N'Sân bóng không được phẳng lặng, gây khó chơi cho các trận đấu.', N'U0000004', N'B004', CAST(0x0000B18D00191EAF AS DateTime))
INSERT [dbo].[Feedback] ([feedbackID], [rating], [content], [userID], [branchID], [period]) VALUES (N'F0000020', 2, N'Không có dịch vụ hỗ trợ cho người mới chơi, thiếu tiện nghi.', N'U0000005', N'B005', CAST(0x0000B19300191EAF AS DateTime))
INSERT [dbo].[Feedback] ([feedbackID], [rating], [content], [userID], [branchID], [period]) VALUES (N'F0000021', 5, N'Địa điểm gần nhà, tiện lợi cho việc luyện tập hàng ngày.', N'U0000006', N'B001', CAST(0x0000B19D00191EAF AS DateTime))
INSERT [dbo].[Feedback] ([feedbackID], [rating], [content], [userID], [branchID], [period]) VALUES (N'F0000022', 3, N'Không gian sân bóng hơi chật và không phù hợp cho các trận đấu lớn.', N'U0000007', N'B002', CAST(0x0000B19200191EAF AS DateTime))
INSERT [dbo].[Feedback] ([feedbackID], [rating], [content], [userID], [branchID], [period]) VALUES (N'F0000023', 4, N'Giá cả hợp lý và nhân viên phục vụ nhanh chóng, hiệu quả.', N'U0000008', N'B003', CAST(0x0000B18700191EB0 AS DateTime))
INSERT [dbo].[Feedback] ([feedbackID], [rating], [content], [userID], [branchID], [period]) VALUES (N'F0000024', 2, N'Nhân viên không thân thiện và không nhiệt tình trong phục vụ.', N'U0000009', N'B004', CAST(0x0000B19700191EB0 AS DateTime))
INSERT [dbo].[Feedback] ([feedbackID], [rating], [content], [userID], [branchID], [period]) VALUES (N'F0000025', 5, N'Vị trí thuận lợi và sân bóng luôn được bảo trì sạch sẽ.', N'U0000010', N'B005', CAST(0x0000B19700191EB0 AS DateTime))
INSERT [dbo].[Feedback] ([feedbackID], [rating], [content], [userID], [branchID], [period]) VALUES (N'F0000026', 4, N'Sân bóng rộng và đáp ứng đủ yêu cầu cho các trận đấu.', N'U0000011', N'B001', CAST(0x0000B18700191EB0 AS DateTime))
INSERT [dbo].[Feedback] ([feedbackID], [rating], [content], [userID], [branchID], [period]) VALUES (N'F0000027', 3, N'Giá cả hơi cao so với chất lượng sân bóng.', N'U0000012', N'B002', CAST(0x0000B19000191EB0 AS DateTime))
INSERT [dbo].[Feedback] ([feedbackID], [rating], [content], [userID], [branchID], [period]) VALUES (N'F0000028', 1, N'Sân bóng quá đông vào các buổi chiều cuối tuần, không thoải mái cho việc chơi.', N'U0000013', N'B003', CAST(0x0000B18D00191EB0 AS DateTime))
INSERT [dbo].[Feedback] ([feedbackID], [rating], [content], [userID], [branchID], [period]) VALUES (N'F0000029', 2, N'Không gian sân bóng hẹp và không có ánh sáng đủ vào ban đêm.', N'U0000014', N'B004', CAST(0x0000B18700191EB0 AS DateTime))
INSERT [dbo].[Feedback] ([feedbackID], [rating], [content], [userID], [branchID], [period]) VALUES (N'F0000030', 4, N'Sân bóng đẹp và rộng rãi, phù hợp cho các trận đấu.', N'U0000015', N'B005', CAST(0x0000B19700191EB0 AS DateTime))
INSERT [dbo].[Feedback] ([feedbackID], [rating], [content], [userID], [branchID], [period]) VALUES (N'F0000031', 3, N'Nhân viên không thân thiện và không giải quyết thắc mắc của khách hàng nhanh chóng.', N'U0000001', N'B001', CAST(0x0000B19E00191EB0 AS DateTime))
INSERT [dbo].[Feedback] ([feedbackID], [rating], [content], [userID], [branchID], [period]) VALUES (N'F0000032', 5, N'Dịch vụ tốt, giá cả hợp lý và sân bóng luôn sạch sẽ.', N'U0000002', N'B002', CAST(0x0000B19F00191EB0 AS DateTime))
INSERT [dbo].[Feedback] ([feedbackID], [rating], [content], [userID], [branchID], [period]) VALUES (N'F0000033', 2, N'Nhân viên phục vụ không nhiệt tình và không chuyên nghiệp.', N'U0000003', N'B003', CAST(0x0000B19100191EB0 AS DateTime))
INSERT [dbo].[Feedback] ([feedbackID], [rating], [content], [userID], [branchID], [period]) VALUES (N'F0000034', 4, N'Sân bóng sạch sẽ và thoáng mát vào ban đêm, phục vụ tốt cho các trận đấu.', N'U0000004', N'B004', CAST(0x0000B18500191EB0 AS DateTime))
INSERT [dbo].[Feedback] ([feedbackID], [rating], [content], [userID], [branchID], [period]) VALUES (N'F0000035', 3, N'Không gian chơi hẹp và ồn ào quá mức, không thoải mái cho các trận đấu lớn.', N'U0000005', N'B005', CAST(0x0000B18F00191EB0 AS DateTime))
INSERT [dbo].[Feedback] ([feedbackID], [rating], [content], [userID], [branchID], [period]) VALUES (N'F0000036', 1, N'Không có chỗ đậu xe gần sân, rất bất tiện khi đi chơi bóng.', N'U0000006', N'B001', CAST(0x0000B18700191EB0 AS DateTime))
INSERT [dbo].[Feedback] ([feedbackID], [rating], [content], [userID], [branchID], [period]) VALUES (N'F0000037', 5, N'Trung tâm có nhiều sân chơi, phù hợp cho nhiều nhóm lớn.', N'U0000007', N'B002', CAST(0x0000B19400191EB0 AS DateTime))
INSERT [dbo].[Feedback] ([feedbackID], [rating], [content], [userID], [branchID], [period]) VALUES (N'F0000038', 4, N'Giá cả hợp lý, nhân viên nhiệt tình và sân bóng luôn được bảo trì tốt.', N'U0000008', N'B003', CAST(0x0000B19A00191EB0 AS DateTime))
INSERT [dbo].[Feedback] ([feedbackID], [rating], [content], [userID], [branchID], [period]) VALUES (N'F0000039', 3, N'Sân bóng không được phẳng lặng, gây khó chơi cho các trận đấu.', N'U0000009', N'B004', CAST(0x0000B19B00191EB0 AS DateTime))
INSERT [dbo].[Feedback] ([feedbackID], [rating], [content], [userID], [branchID], [period]) VALUES (N'F0000040', 2, N'Không có dịch vụ hỗ trợ cho người mới chơi, thiếu tiện nghi.', N'U0000010', N'B005', CAST(0x0000B19600191EB0 AS DateTime))
INSERT [dbo].[Feedback] ([feedbackID], [rating], [content], [userID], [branchID], [period]) VALUES (N'F0000041', 5, N'Địa điểm gần nhà, tiện lợi cho việc luyện tập hàng ngày.', N'U0000011', N'B001', CAST(0x0000B18900191EB0 AS DateTime))
INSERT [dbo].[Feedback] ([feedbackID], [rating], [content], [userID], [branchID], [period]) VALUES (N'F0000042', 3, N'Không gian sân bóng hơi chật và không phù hợp cho các trận đấu lớn.', N'U0000012', N'B002', CAST(0x0000B19500191EB0 AS DateTime))
INSERT [dbo].[Feedback] ([feedbackID], [rating], [content], [userID], [branchID], [period]) VALUES (N'F0000043', 4, N'Giá cả hợp lý và nhân viên phục vụ nhanh chóng, hiệu quả.', N'U0000013', N'B003', CAST(0x0000B18500191EB0 AS DateTime))
INSERT [dbo].[Feedback] ([feedbackID], [rating], [content], [userID], [branchID], [period]) VALUES (N'F0000044', 2, N'Nhân viên không thân thiện và không nhiệt tình trong phục vụ.', N'U0000014', N'B004', CAST(0x0000B18900191EB0 AS DateTime))
INSERT [dbo].[Feedback] ([feedbackID], [rating], [content], [userID], [branchID], [period]) VALUES (N'F0000045', 5, N'Vị trí thuận lợi và sân bóng luôn được bảo trì sạch sẽ.', N'U0000015', N'B005', CAST(0x0000B19000191EB1 AS DateTime))
INSERT [dbo].[Feedback] ([feedbackID], [rating], [content], [userID], [branchID], [period]) VALUES (N'F0000046', 4, N'Sân bóng rộng và đáp ứng đủ yêu cầu cho các trận đấu.', N'U0000001', N'B001', CAST(0x0000B19200191EB1 AS DateTime))
INSERT [dbo].[Feedback] ([feedbackID], [rating], [content], [userID], [branchID], [period]) VALUES (N'F0000047', 3, N'Giá cả hơi cao so với chất lượng sân bóng.', N'U0000002', N'B002', CAST(0x0000B1A100191EB1 AS DateTime))
INSERT [dbo].[Feedback] ([feedbackID], [rating], [content], [userID], [branchID], [period]) VALUES (N'F0000048', 1, N'Sân bóng quá đông vào các buổi chiều cuối tuần, không thoải mái cho việc chơi.', N'U0000003', N'B003', CAST(0x0000B18F00191EB1 AS DateTime))
INSERT [dbo].[Feedback] ([feedbackID], [rating], [content], [userID], [branchID], [period]) VALUES (N'F0000049', 2, N'Không gian sân bóng hẹp và không có ánh sáng đủ vào ban đêm.', N'U0000004', N'B004', CAST(0x0000B19000191EB1 AS DateTime))
INSERT [dbo].[Feedback] ([feedbackID], [rating], [content], [userID], [branchID], [period]) VALUES (N'F0000050', 4, N'Sân bóng đẹp và rộng rãi, phù hợp cho các trận đấu.', N'U0000005', N'B005', CAST(0x0000B18E00191EB1 AS DateTime))
INSERT [dbo].[Payment] ([paymentID], [userID], [date], [bookingID], [method], [amount], [transactionId]) VALUES (N'P0000001', N'U0000008', CAST(0x0000B1A1001B9B23 AS DateTime), N'BK0000002', 1, 2640000, N'14488493')
INSERT [dbo].[Payment] ([paymentID], [userID], [date], [bookingID], [method], [amount], [transactionId]) VALUES (N'P0000002', N'U0000008', CAST(0x0000B1A1001C32BA AS DateTime), N'BK0000003', 2, 560000, N'14488494')
INSERT [dbo].[Payment] ([paymentID], [userID], [date], [bookingID], [method], [amount], [transactionId]) VALUES (N'P0000003', N'U0000002', CAST(0x0000B1A1001CBB2F AS DateTime), N'BK0000004', 1, 560000, N'14488496')
INSERT [dbo].[Payment] ([paymentID], [userID], [date], [bookingID], [method], [amount], [transactionId]) VALUES (N'P0000004', N'U0000008', CAST(0x0000B1A1007C3A71 AS DateTime), N'BK0000005', 1, 1320000, N'14488563')
INSERT [dbo].[Payment] ([paymentID], [userID], [date], [bookingID], [method], [amount], [transactionId]) VALUES (N'P0000005', N'U0000008', CAST(0x0000B1A10080CB38 AS DateTime), N'BK0000006', 1, 1320000, N'14488565')
INSERT [dbo].[Payment] ([paymentID], [userID], [date], [bookingID], [method], [amount], [transactionId]) VALUES (N'P0000006', N'U0000006', CAST(0x0000B1A100858718 AS DateTime), N'BK0000007', 2, 60000, N'14488568')
INSERT [dbo].[Payment] ([paymentID], [userID], [date], [bookingID], [method], [amount], [transactionId]) VALUES (N'P0000007', N'U0000008', CAST(0x0000B1A10086236B AS DateTime), N'BK0000008', 1, 480000, N'14488570')
INSERT [dbo].[Payment] ([paymentID], [userID], [date], [bookingID], [method], [amount], [transactionId]) VALUES (N'P0000008', N'U0000028', CAST(0x0000B1A700AA9CC2 AS DateTime), N'BK0000009', 1, 210000, N'14498801')
INSERT [dbo].[Payment] ([paymentID], [userID], [date], [bookingID], [method], [amount], [transactionId]) VALUES (N'P0000009', N'U0000028', CAST(0x0000B1A700AB8E3A AS DateTime), N'BK0000010', 1, 70000, N'14498810')
INSERT [dbo].[Role] ([roleID], [role]) VALUES (N'R001', N'Admin')
INSERT [dbo].[Role] ([roleID], [role]) VALUES (N'R002', N'Staff')
INSERT [dbo].[Role] ([roleID], [role]) VALUES (N'R003', N'Customer')
INSERT [dbo].[User] ([userID], [userName], [password], [branchID], [roleID], [token], [actionPeriod], [balance], [accessFail], [lastFail], [activeStatus]) VALUES (N'U0000001', N'NguyenPTT16', N'463489af-de9', NULL, N'R003', N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySWQiOiJVMDAwMDAwMSIsIlVzZXJuYW1lIjoiTmd1eWVuUFRUMTYiLCJTdGF0dXMiOiJGYWxzZSIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IlIwMDMiLCJSb2xlIjoiUjAwMyIsImV4cCI6MTcxOTg1MjUwOSwiaXNzIjoiaHR0cDovL2xvY2FsaG9zdDo1MjY2LyIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTI2Ni8ifQ.PVjxtN0L7yob6Z2Mhj4BXc3bZ-QZsIg8VpJ5KsOxuv4', CAST(0x0000B1A001843A44 AS DateTime), 0, 0, CAST(0x0000000000000000 AS DateTime), 1)
INSERT [dbo].[User] ([userID], [userName], [password], [branchID], [roleID], [token], [actionPeriod], [balance], [accessFail], [lastFail], [activeStatus]) VALUES (N'U0000002', N'ThuPM87', N'60524134-add', NULL, N'R003', NULL, NULL, 100000, 0, CAST(0x0000000000000000 AS DateTime), 1)
INSERT [dbo].[User] ([userID], [userName], [password], [branchID], [roleID], [token], [actionPeriod], [balance], [accessFail], [lastFail], [activeStatus]) VALUES (N'U0000003', N'ThaiDV35', N'567db4c7-599', NULL, N'R003', NULL, NULL, 0, 0, CAST(0x0000000000000000 AS DateTime), 1)
INSERT [dbo].[User] ([userID], [userName], [password], [branchID], [roleID], [token], [actionPeriod], [balance], [accessFail], [lastFail], [activeStatus]) VALUES (N'U0000004', N'PhatPT98', N'64964cc5-12f', NULL, N'R003', N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySWQiOiJVMDAwMDAwNCIsIlVzZXJuYW1lIjoiUGhhdFBUOTgiLCJTdGF0dXMiOiJGYWxzZSIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IlIwMDMiLCJSb2xlIjoiUjAwMyIsImV4cCI6MTcxOTg1MjUyMCwiaXNzIjoiaHR0cDovL2xvY2FsaG9zdDo1MjY2LyIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTI2Ni8ifQ.AmGmcjYX9I80zCLIqDDsXpn0bRunO508MiRuv7YJZx4', CAST(0x0000B1A00184467F AS DateTime), 0, 0, CAST(0x0000000000000000 AS DateTime), 1)
INSERT [dbo].[User] ([userID], [userName], [password], [branchID], [roleID], [token], [actionPeriod], [balance], [accessFail], [lastFail], [activeStatus]) VALUES (N'U0000005', N'ThanhDH81', N'92a214c2-8a5', NULL, N'R003', N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySWQiOiJVMDAwMDAwNSIsIlVzZXJuYW1lIjoiVGhhbmhESDgxIiwiU3RhdHVzIjoiRmFsc2UiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJSMDAzIiwiUm9sZSI6IlIwMDMiLCJleHAiOjE3MTk4NTI1MjQsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTI2Ni8iLCJhdWQiOiJodHRwOi8vbG9jYWxob3N0OjUyNjYvIn0.oEm1X-HuY-k5hmHenJUb8_oXc8x2pDVJxMQnHcAQC-4', CAST(0x0000B1A001844B23 AS DateTime), 0, 0, CAST(0x0000000000000000 AS DateTime), 1)
INSERT [dbo].[User] ([userID], [userName], [password], [branchID], [roleID], [token], [actionPeriod], [balance], [accessFail], [lastFail], [activeStatus]) VALUES (N'U0000006', N'LuatLP95', N'e6791e2e-784', NULL, N'R003', N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySWQiOiJVMDAwMDAwNiIsIlVzZXJuYW1lIjoiTHVhdExQOTUiLCJTdGF0dXMiOiJGYWxzZSIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IlIwMDMiLCJSb2xlIjoiUjAwMyIsImV4cCI6MTcxOTg1MjUyNywiaXNzIjoiaHR0cDovL2xvY2FsaG9zdDo1MjY2LyIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTI2Ni8ifQ.XhE60D0KyAtLWiiSKANVTTRUR5YSP-IEliIbdR1oZ7o', CAST(0x0000B1A001844F16 AS DateTime), 0, 0, CAST(0x0000000000000000 AS DateTime), 1)
INSERT [dbo].[User] ([userID], [userName], [password], [branchID], [roleID], [token], [actionPeriod], [balance], [accessFail], [lastFail], [activeStatus]) VALUES (N'U0000007', N'NhungPT59', N'5aaaf365-a33', NULL, N'R003', N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySWQiOiJVMDAwMDAwNyIsIlVzZXJuYW1lIjoiTmh1bmdQVDU5IiwiU3RhdHVzIjoiRmFsc2UiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJSMDAzIiwiUm9sZSI6IlIwMDMiLCJleHAiOjE3MTk4NTI1MzEsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTI2Ni8iLCJhdWQiOiJodHRwOi8vbG9jYWxob3N0OjUyNjYvIn0.GmyIqtbw7xFdAJr4_cAG92ci15BF3S1pmYPAmfT_b5I', CAST(0x0000B1A0018453CC AS DateTime), 0, 0, CAST(0x0000000000000000 AS DateTime), 1)
INSERT [dbo].[User] ([userID], [userName], [password], [branchID], [roleID], [token], [actionPeriod], [balance], [accessFail], [lastFail], [activeStatus]) VALUES (N'U0000008', N'TriTT68', N'aad62cd2-8e2', NULL, N'R003', NULL, NULL, 0, 0, CAST(0x0000000000000000 AS DateTime), 1)
INSERT [dbo].[User] ([userID], [userName], [password], [branchID], [roleID], [token], [actionPeriod], [balance], [accessFail], [lastFail], [activeStatus]) VALUES (N'U0000009', N'HoangNV21', N'835ccf5c-4d4', NULL, N'R003', N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySWQiOiJVMDAwMDAwOSIsIlVzZXJuYW1lIjoiSG9hbmdOVjIxIiwiU3RhdHVzIjoiRmFsc2UiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJSMDAzIiwiUm9sZSI6IlIwMDMiLCJleHAiOjE3MTk4NTI1MzgsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTI2Ni8iLCJhdWQiOiJodHRwOi8vbG9jYWxob3N0OjUyNjYvIn0.vxd9Woy6FzCVW1SxSTiZx02ugtZwDNlHawlCSrSvEd0', CAST(0x0000B1A001845B93 AS DateTime), 0, 0, CAST(0x0000000000000000 AS DateTime), 1)
INSERT [dbo].[User] ([userID], [userName], [password], [branchID], [roleID], [token], [actionPeriod], [balance], [accessFail], [lastFail], [activeStatus]) VALUES (N'U0000010', N'TriTT66', N'f7e872b9-237', NULL, N'R003', N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySWQiOiJVMDAwMDAxMCIsIlVzZXJuYW1lIjoiVHJpVFQ2NiIsIlN0YXR1cyI6IkZhbHNlIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiUjAwMyIsIlJvbGUiOiJSMDAzIiwiZXhwIjoxNzE5ODUyNTQxLCJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjUyNjYvIiwiYXVkIjoiaHR0cDovL2xvY2FsaG9zdDo1MjY2LyJ9.Q7Oa7zGUUCUKr7mL8jX-i-a0gl65gGnX7F2t929cHCs', CAST(0x0000B1A001845F87 AS DateTime), 0, 0, CAST(0x0000000000000000 AS DateTime), 1)
INSERT [dbo].[User] ([userID], [userName], [password], [branchID], [roleID], [token], [actionPeriod], [balance], [accessFail], [lastFail], [activeStatus]) VALUES (N'U0000011', N'HueTTT25', N'5e85ba00-d4b', NULL, N'R003', N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySWQiOiJVMDAwMDAxMSIsIlVzZXJuYW1lIjoiSHVlVFRUMjUiLCJTdGF0dXMiOiJGYWxzZSIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IlIwMDMiLCJSb2xlIjoiUjAwMyIsImV4cCI6MTcxOTg1MjU0NCwiaXNzIjoiaHR0cDovL2xvY2FsaG9zdDo1MjY2LyIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTI2Ni8ifQ.EfZj3wFR4XpmPzaNbJwXpVzYuTBsgE8N5kkkKOe7ESc', CAST(0x0000B1A00184637E AS DateTime), 0, 0, CAST(0x0000000000000000 AS DateTime), 1)
INSERT [dbo].[User] ([userID], [userName], [password], [branchID], [roleID], [token], [actionPeriod], [balance], [accessFail], [lastFail], [activeStatus]) VALUES (N'U0000012', N'NguyenPTT63', N'339b6545-275', NULL, N'R003', N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySWQiOiJVMDAwMDAxMiIsIlVzZXJuYW1lIjoiTmd1eWVuUFRUNjMiLCJTdGF0dXMiOiJGYWxzZSIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IlIwMDMiLCJSb2xlIjoiUjAwMyIsImV4cCI6MTcxOTg1MjU3OSwiaXNzIjoiaHR0cDovL2xvY2FsaG9zdDo1MjY2LyIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTI2Ni8ifQ.fAEievjlYC-JREQWhUaLj87Y00YzYeBhEUWIvdy0oQQ', CAST(0x0000B1A001848C2A AS DateTime), 0, 0, CAST(0x0000000000000000 AS DateTime), 1)
INSERT [dbo].[User] ([userID], [userName], [password], [branchID], [roleID], [token], [actionPeriod], [balance], [accessFail], [lastFail], [activeStatus]) VALUES (N'U0000013', N'ThuPM03', N'48b7cd7b-995', NULL, N'R003', NULL, NULL, 0, 0, CAST(0x0000000000000000 AS DateTime), 1)
INSERT [dbo].[User] ([userID], [userName], [password], [branchID], [roleID], [token], [actionPeriod], [balance], [accessFail], [lastFail], [activeStatus]) VALUES (N'U0000014', N'ThaiDV88', N'c0072294-ad5', NULL, N'R003', N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySWQiOiJVMDAwMDAxNCIsIlVzZXJuYW1lIjoiVGhhaURWODgiLCJTdGF0dXMiOiJGYWxzZSIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IlIwMDMiLCJSb2xlIjoiUjAwMyIsImV4cCI6MTcxOTg1MjU4OCwiaXNzIjoiaHR0cDovL2xvY2FsaG9zdDo1MjY2LyIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTI2Ni8ifQ.e8qosnefybiIPNA960ldricei9wPSIdsiCx2T_5PzDs', CAST(0x0000B1A001849623 AS DateTime), 0, 0, CAST(0x0000000000000000 AS DateTime), 1)
INSERT [dbo].[User] ([userID], [userName], [password], [branchID], [roleID], [token], [actionPeriod], [balance], [accessFail], [lastFail], [activeStatus]) VALUES (N'U0000015', N'PhatPT77', N'817cfad7-59b', NULL, N'R003', N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySWQiOiJVMDAwMDAxNSIsIlVzZXJuYW1lIjoiUGhhdFBUNzciLCJTdGF0dXMiOiJGYWxzZSIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IlIwMDMiLCJSb2xlIjoiUjAwMyIsImV4cCI6MTcxOTg1MjU5MSwiaXNzIjoiaHR0cDovL2xvY2FsaG9zdDo1MjY2LyIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTI2Ni8ifQ.6n8M_ZcV6vS96-6Wm3HmaZJic1zOxNkTrvG0AYsh4tY', CAST(0x0000B1A001849A14 AS DateTime), 0, 0, CAST(0x0000000000000000 AS DateTime), 1)
INSERT [dbo].[User] ([userID], [userName], [password], [branchID], [roleID], [token], [actionPeriod], [balance], [accessFail], [lastFail], [activeStatus]) VALUES (N'U0000016', N'ThanhDH39', N'51ecca94-e5c', NULL, N'R003', N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySWQiOiJVMDAwMDAxNiIsIlVzZXJuYW1lIjoiVGhhbmhESDM5IiwiU3RhdHVzIjoiRmFsc2UiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJSMDAzIiwiUm9sZSI6IlIwMDMiLCJleHAiOjE3MTk4NTI1OTQsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTI2Ni8iLCJhdWQiOiJodHRwOi8vbG9jYWxob3N0OjUyNjYvIn0.axBEwEziBUXkW256zOrbEPM_4RUvRHoBhBzYHqZzQyc', CAST(0x0000B1A001849DF2 AS DateTime), 0, 0, CAST(0x0000000000000000 AS DateTime), 1)
INSERT [dbo].[User] ([userID], [userName], [password], [branchID], [roleID], [token], [actionPeriod], [balance], [accessFail], [lastFail], [activeStatus]) VALUES (N'U0000017', N'LuatLP83', N'a5c9ea43-790', NULL, N'R003', N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySWQiOiJVMDAwMDAxNyIsIlVzZXJuYW1lIjoiTHVhdExQODMiLCJTdGF0dXMiOiJGYWxzZSIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IlIwMDMiLCJSb2xlIjoiUjAwMyIsImV4cCI6MTcxOTg1MjU5OCwiaXNzIjoiaHR0cDovL2xvY2FsaG9zdDo1MjY2LyIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTI2Ni8ifQ.kjnUkCf9X595ShXuiG27k0tjL7GlsTNrKkipoH93hFM', CAST(0x0000B1A00184A2E2 AS DateTime), 0, 0, CAST(0x0000000000000000 AS DateTime), 1)
INSERT [dbo].[User] ([userID], [userName], [password], [branchID], [roleID], [token], [actionPeriod], [balance], [accessFail], [lastFail], [activeStatus]) VALUES (N'U0000018', N'NhungPT99', N'97368401-40a', NULL, N'R003', N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySWQiOiJVMDAwMDAxOCIsIlVzZXJuYW1lIjoiTmh1bmdQVDk5IiwiU3RhdHVzIjoiRmFsc2UiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJSMDAzIiwiUm9sZSI6IlIwMDMiLCJleHAiOjE3MTk4NTI2MDIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTI2Ni8iLCJhdWQiOiJodHRwOi8vbG9jYWxob3N0OjUyNjYvIn0.1vIZHl_2BFGEfXXwqGvM67RHKg7OCubD8UP1J4sBfW8', CAST(0x0000B1A00184A76F AS DateTime), 0, 0, CAST(0x0000000000000000 AS DateTime), 1)
INSERT [dbo].[User] ([userID], [userName], [password], [branchID], [roleID], [token], [actionPeriod], [balance], [accessFail], [lastFail], [activeStatus]) VALUES (N'U0000019', N'TriTT94', N'c7405a5f-89e', NULL, N'R003', N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySWQiOiJVMDAwMDAxOSIsIlVzZXJuYW1lIjoiVHJpVFQ5NCIsIlN0YXR1cyI6IkZhbHNlIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiUjAwMyIsIlJvbGUiOiJSMDAzIiwiZXhwIjoxNzE5ODUyNjA2LCJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjUyNjYvIiwiYXVkIjoiaHR0cDovL2xvY2FsaG9zdDo1MjY2LyJ9.64hRr2K7AlHAnhmo3SzKATLNuN_Q3wHN0xcr0JkoW6g', CAST(0x0000B1A00184AC4E AS DateTime), 0, 0, CAST(0x0000000000000000 AS DateTime), 1)
INSERT [dbo].[User] ([userID], [userName], [password], [branchID], [roleID], [token], [actionPeriod], [balance], [accessFail], [lastFail], [activeStatus]) VALUES (N'U0000020', N'HoangNV55', N'96a4ec8f-d6f', NULL, N'R003', N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySWQiOiJVMDAwMDAyMCIsIlVzZXJuYW1lIjoiSG9hbmdOVjU1IiwiU3RhdHVzIjoiRmFsc2UiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJSMDAzIiwiUm9sZSI6IlIwMDMiLCJleHAiOjE3MTk4NTI2MTAsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTI2Ni8iLCJhdWQiOiJodHRwOi8vbG9jYWxob3N0OjUyNjYvIn0.1RsXAFeF55UCp2tILMHZztC0o61V9PJA5QsozrfySJw', CAST(0x0000B1A00184B031 AS DateTime), 0, 0, CAST(0x0000000000000000 AS DateTime), 1)
INSERT [dbo].[User] ([userID], [userName], [password], [branchID], [roleID], [token], [actionPeriod], [balance], [accessFail], [lastFail], [activeStatus]) VALUES (N'U0000021', N'TriTT53', N'90cae1b8-cf5', NULL, N'R003', N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySWQiOiJVMDAwMDAyMSIsIlVzZXJuYW1lIjoiVHJpVFQ1MyIsIlN0YXR1cyI6IkZhbHNlIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiUjAwMyIsIlJvbGUiOiJSMDAzIiwiZXhwIjoxNzE5ODUyNjEzLCJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjUyNjYvIiwiYXVkIjoiaHR0cDovL2xvY2FsaG9zdDo1MjY2LyJ9.hirdIRnndx5hlez8rijS_A3vttts0AhgyTKNFTPvXzY', CAST(0x0000B1A00184B419 AS DateTime), 0, 0, CAST(0x0000000000000000 AS DateTime), 1)
INSERT [dbo].[User] ([userID], [userName], [password], [branchID], [roleID], [token], [actionPeriod], [balance], [accessFail], [lastFail], [activeStatus]) VALUES (N'U0000022', N'HueTTT90', N'4dfccedb-0ce', NULL, N'R003', N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySWQiOiJVMDAwMDAyMiIsIlVzZXJuYW1lIjoiSHVlVFRUOTAiLCJTdGF0dXMiOiJGYWxzZSIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IlIwMDMiLCJSb2xlIjoiUjAwMyIsImV4cCI6MTcxOTg1MjYxNywiaXNzIjoiaHR0cDovL2xvY2FsaG9zdDo1MjY2LyIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTI2Ni8ifQ.6cxv-M0902dJ2-LJ_JnzeqPsPRdSyP5dFDaK-wfSKhI', CAST(0x0000B1A00184B92D AS DateTime), 0, 0, CAST(0x0000000000000000 AS DateTime), 1)
INSERT [dbo].[User] ([userID], [userName], [password], [branchID], [roleID], [token], [actionPeriod], [balance], [accessFail], [lastFail], [activeStatus]) VALUES (N'U0000023', N'TienNQ40', N'6d6fd403-77c', NULL, N'R003', N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySWQiOiJVMDAwMDAyMyIsIlVzZXJuYW1lIjoiVGllbk5RNDAiLCJTdGF0dXMiOiJGYWxzZSIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IlIwMDMiLCJSb2xlIjoiUjAwMyIsImV4cCI6MTcxOTg1MjYyMSwiaXNzIjoiaHR0cDovL2xvY2FsaG9zdDo1MjY2LyIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTI2Ni8ifQ.uQ1OY_KaXBvAC5p9TxHkDArEMhZpd4XVLfLR0gzQcKw', CAST(0x0000B1A00184BDD9 AS DateTime), 0, 0, CAST(0x0000000000000000 AS DateTime), 1)
INSERT [dbo].[User] ([userID], [userName], [password], [branchID], [roleID], [token], [actionPeriod], [balance], [accessFail], [lastFail], [activeStatus]) VALUES (N'U0000024', N'DatLN26', N'829b3fd5-ec3', NULL, N'R003', N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySWQiOiJVMDAwMDAyNCIsIlVzZXJuYW1lIjoiRGF0TE4yNiIsIlN0YXR1cyI6IkZhbHNlIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiUjAwMyIsIlJvbGUiOiJSMDAzIiwiZXhwIjoxNzE5ODUyNjI1LCJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjUyNjYvIiwiYXVkIjoiaHR0cDovL2xvY2FsaG9zdDo1MjY2LyJ9.QTob5PEEyRUuPbIPEWnnS19d69vJNXCFhnfggaataPU', CAST(0x0000B1A00184C24A AS DateTime), 0, 0, CAST(0x0000000000000000 AS DateTime), 1)
INSERT [dbo].[User] ([userID], [userName], [password], [branchID], [roleID], [token], [actionPeriod], [balance], [accessFail], [lastFail], [activeStatus]) VALUES (N'U0000025', N'DatPT33', N'c5e3bb8f-223', NULL, N'R003', N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySWQiOiJVMDAwMDAyNSIsIlVzZXJuYW1lIjoiRGF0UFQzMyIsIlN0YXR1cyI6IkZhbHNlIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiUjAwMyIsIlJvbGUiOiJSMDAzIiwiZXhwIjoxNzE5ODUyNjI4LCJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjUyNjYvIiwiYXVkIjoiaHR0cDovL2xvY2FsaG9zdDo1MjY2LyJ9.kIe8X7S6QECF9ZQG2mi2G4MG9i0NnDfEP0OAQXEnwhU', CAST(0x0000B1A00184C626 AS DateTime), 0, 0, CAST(0x0000000000000000 AS DateTime), 1)
INSERT [dbo].[User] ([userID], [userName], [password], [branchID], [roleID], [token], [actionPeriod], [balance], [accessFail], [lastFail], [activeStatus]) VALUES (N'U0000026', N'NhatVV11', N'7f0736f1-995', NULL, N'R003', NULL, NULL, 0, 0, CAST(0x0000000000000000 AS DateTime), 1)
INSERT [dbo].[User] ([userID], [userName], [password], [branchID], [roleID], [token], [actionPeriod], [balance], [accessFail], [lastFail], [activeStatus]) VALUES (N'U0000027', N'admin', N'123', NULL, N'R001', NULL, NULL, 0, 0, CAST(0x0000000000000000 AS DateTime), 1)
INSERT [dbo].[User] ([userID], [userName], [password], [branchID], [roleID], [token], [actionPeriod], [balance], [accessFail], [lastFail], [activeStatus]) VALUES (N'U0000028', N'duccoi', N'123', NULL, N'R003', NULL, NULL, 0, 0, CAST(0x0000000000000000 AS DateTime), 1)
INSERT [dbo].[UserDetail] ([userID], [firstName], [lastName], [email], [phone], [facebook], [img]) VALUES (N'U0000001', N'Phan Thị Thảo', N'Nguyên', N'NguyenPTT16804@yahoo.com', N'0201060944', NULL, NULL)
INSERT [dbo].[UserDetail] ([userID], [firstName], [lastName], [email], [phone], [facebook], [img]) VALUES (N'U0000002', N'Phạm Minh', N'Thư', N'ThuPM87572@yahoo.com', N'0293881846', NULL, NULL)
INSERT [dbo].[UserDetail] ([userID], [firstName], [lastName], [email], [phone], [facebook], [img]) VALUES (N'U0000003', N'Đặng Văn', N'Thái', N'ThaiDV35610@gmail.com', N'0903157204', NULL, NULL)
INSERT [dbo].[UserDetail] ([userID], [firstName], [lastName], [email], [phone], [facebook], [img]) VALUES (N'U0000004', N'Phan Trung', N'Phát', N'PhatPT98769@outlook.com', N'0367038081', NULL, NULL)
INSERT [dbo].[UserDetail] ([userID], [firstName], [lastName], [email], [phone], [facebook], [img]) VALUES (N'U0000005', N'Đặng Hồng', N'Thanh', N'ThanhDH81781@gmail.com', N'0961082840', NULL, NULL)
INSERT [dbo].[UserDetail] ([userID], [firstName], [lastName], [email], [phone], [facebook], [img]) VALUES (N'U0000006', N'Lê Pháp', N'Luật', N'LuatLP95050@outlook.com', N'0824708851', NULL, NULL)
INSERT [dbo].[UserDetail] ([userID], [firstName], [lastName], [email], [phone], [facebook], [img]) VALUES (N'U0000007', N'Phạm Thùy', N'Nhung', N'NhungPT59368@outlook.com', N'0820866631', NULL, NULL)
INSERT [dbo].[UserDetail] ([userID], [firstName], [lastName], [email], [phone], [facebook], [img]) VALUES (N'U0000008', N'Trần Tài', N'Trí', N'TriTT68811@yahoo.com', N'0376086631', NULL, NULL)
INSERT [dbo].[UserDetail] ([userID], [firstName], [lastName], [email], [phone], [facebook], [img]) VALUES (N'U0000009', N'Nguyễn Việt', N'Hoàng', N'HoangNV21446@outlook.com', N'0306258019', NULL, NULL)
INSERT [dbo].[UserDetail] ([userID], [firstName], [lastName], [email], [phone], [facebook], [img]) VALUES (N'U0000010', N'Trần Tài', N'Trí', N'TriTT66874@yahoo.com', N'0262919590', NULL, NULL)
INSERT [dbo].[UserDetail] ([userID], [firstName], [lastName], [email], [phone], [facebook], [img]) VALUES (N'U0000011', N'Trần Thị Thu', N'Huệ', N'HueTTT25223@outlook.com', N'0311496483', NULL, NULL)
INSERT [dbo].[UserDetail] ([userID], [firstName], [lastName], [email], [phone], [facebook], [img]) VALUES (N'U0000012', N'Phan Thị Thảo', N'Nguyên', N'NguyenPTT63019@gmail.com', N'0202807589', NULL, NULL)
INSERT [dbo].[UserDetail] ([userID], [firstName], [lastName], [email], [phone], [facebook], [img]) VALUES (N'U0000013', N'Phạm Minh', N'Thư', N'ThuPM03718@gmail.com', N'0363168967', NULL, NULL)
INSERT [dbo].[UserDetail] ([userID], [firstName], [lastName], [email], [phone], [facebook], [img]) VALUES (N'U0000014', N'Đặng Văn', N'Thái', N'ThaiDV88409@yahoo.com', N'0966449982', NULL, NULL)
INSERT [dbo].[UserDetail] ([userID], [firstName], [lastName], [email], [phone], [facebook], [img]) VALUES (N'U0000015', N'Phan Trung', N'Phát', N'PhatPT77034@outlook.com', N'0263887251', NULL, NULL)
INSERT [dbo].[UserDetail] ([userID], [firstName], [lastName], [email], [phone], [facebook], [img]) VALUES (N'U0000016', N'Đặng Hồng', N'Thanh', N'ThanhDH39827@gmail.com', N'0916361684', NULL, NULL)
INSERT [dbo].[UserDetail] ([userID], [firstName], [lastName], [email], [phone], [facebook], [img]) VALUES (N'U0000017', N'Lê Pháp', N'Luật', N'LuatLP83800@yahoo.com', N'0303258783', NULL, NULL)
INSERT [dbo].[UserDetail] ([userID], [firstName], [lastName], [email], [phone], [facebook], [img]) VALUES (N'U0000018', N'Phạm Thùy', N'Nhung', N'NhungPT99431@outlook.com', N'0359367625', NULL, NULL)
INSERT [dbo].[UserDetail] ([userID], [firstName], [lastName], [email], [phone], [facebook], [img]) VALUES (N'U0000019', N'Trần Tài', N'Trí', N'TriTT94800@yahoo.com', N'0202846787', NULL, NULL)
INSERT [dbo].[UserDetail] ([userID], [firstName], [lastName], [email], [phone], [facebook], [img]) VALUES (N'U0000020', N'Nguyễn Việt', N'Hoàng', N'HoangNV55646@yahoo.com', N'0866987219', NULL, NULL)
INSERT [dbo].[UserDetail] ([userID], [firstName], [lastName], [email], [phone], [facebook], [img]) VALUES (N'U0000021', N'Trần Tài', N'Trí', N'TriTT53739@yahoo.com', N'0353559652', NULL, NULL)
INSERT [dbo].[UserDetail] ([userID], [firstName], [lastName], [email], [phone], [facebook], [img]) VALUES (N'U0000022', N'Trần Thị Thu', N'Huệ', N'HueTTT90532@outlook.com', N'0243905446', NULL, NULL)
INSERT [dbo].[UserDetail] ([userID], [firstName], [lastName], [email], [phone], [facebook], [img]) VALUES (N'U0000023', N'Nguyễn Quyết', N'Tiến', N'TienNQ40735@outlook.com', N'0388666093', NULL, NULL)
INSERT [dbo].[UserDetail] ([userID], [firstName], [lastName], [email], [phone], [facebook], [img]) VALUES (N'U0000024', N'Lê Ngọc', N'Đạt', N'DatLN26400@outlook.com', N'0817614855', NULL, NULL)
INSERT [dbo].[UserDetail] ([userID], [firstName], [lastName], [email], [phone], [facebook], [img]) VALUES (N'U0000025', N'Phạm Tiến', N'Đạt', N'DatPT33487@gmail.com', N'0365045156', NULL, NULL)
INSERT [dbo].[UserDetail] ([userID], [firstName], [lastName], [email], [phone], [facebook], [img]) VALUES (N'U0000026', N'Võ Văn', N'Nhất', N'NhatVV11428@outlook.com', N'0891631388', NULL, NULL)
INSERT [dbo].[UserDetail] ([userID], [firstName], [lastName], [email], [phone], [facebook], [img]) VALUES (N'U0000027', N'Admin', N'Admin', N'ducdmse183990@fpt.edu.vn', N'0977300916', NULL, NULL)
INSERT [dbo].[UserDetail] ([userID], [firstName], [lastName], [email], [phone], [facebook], [img]) VALUES (N'U0000028', N'Đặng Minh', N'Đức', N'duccoi16082004@gmail.com', N'0891631388', NULL, NULL)
ALTER TABLE [dbo].[BookedSlot]  WITH CHECK ADD  CONSTRAINT [FKBookedSlot690847] FOREIGN KEY([bookingID])
REFERENCES [dbo].[Booking] ([bookingID])
GO
ALTER TABLE [dbo].[BookedSlot] CHECK CONSTRAINT [FKBookedSlot690847]
GO
ALTER TABLE [dbo].[BookedSlot]  WITH CHECK ADD  CONSTRAINT [FKBookedSlot778580] FOREIGN KEY([courtID])
REFERENCES [dbo].[Court] ([courtID])
GO
ALTER TABLE [dbo].[BookedSlot] CHECK CONSTRAINT [FKBookedSlot778580]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FKBooking923627] FOREIGN KEY([userID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FKBooking923627]
GO
ALTER TABLE [dbo].[Court]  WITH CHECK ADD  CONSTRAINT [FKCourt788847] FOREIGN KEY([branchID])
REFERENCES [dbo].[CourtBranch] ([branchID])
GO
ALTER TABLE [dbo].[Court] CHECK CONSTRAINT [FKCourt788847]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FKFeedback274984] FOREIGN KEY([userID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FKFeedback274984]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FKFeedback632553] FOREIGN KEY([branchID])
REFERENCES [dbo].[CourtBranch] ([branchID])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FKFeedback632553]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FKPayment444730] FOREIGN KEY([userID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FKPayment444730]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FKPayment887923] FOREIGN KEY([bookingID])
REFERENCES [dbo].[Booking] ([bookingID])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FKPayment887923]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FKUser135985] FOREIGN KEY([branchID])
REFERENCES [dbo].[CourtBranch] ([branchID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FKUser135985]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FKUser635730] FOREIGN KEY([roleID])
REFERENCES [dbo].[Role] ([roleID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FKUser635730]
GO
ALTER TABLE [dbo].[UserDetail]  WITH CHECK ADD  CONSTRAINT [FKUserDetail940563] FOREIGN KEY([userID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[UserDetail] CHECK CONSTRAINT [FKUserDetail940563]
GO
USE [master]
GO
ALTER DATABASE [BadmintonCourt] SET  READ_WRITE 
GO
