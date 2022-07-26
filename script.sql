USE [master]
GO
/****** Object:  Database [Second_Task]    Script Date: 7/20/2022 6:15:38 PM ******/
CREATE DATABASE [Second_Task]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Second_Task', FILENAME = N'C:\Users\User\Desktop\MSSQL15.SQLEXPRESS02\MSSQL\DATA\Second_Task.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Second_Task_log', FILENAME = N'C:\Users\User\Desktop\MSSQL15.SQLEXPRESS02\MSSQL\DATA\Second_Task_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Second_Task] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Second_Task].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Second_Task] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Second_Task] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Second_Task] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Second_Task] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Second_Task] SET ARITHABORT OFF 
GO
ALTER DATABASE [Second_Task] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Second_Task] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Second_Task] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Second_Task] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Second_Task] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Second_Task] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Second_Task] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Second_Task] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Second_Task] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Second_Task] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Second_Task] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Second_Task] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Second_Task] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Second_Task] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Second_Task] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Second_Task] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Second_Task] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Second_Task] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Second_Task] SET  MULTI_USER 
GO
ALTER DATABASE [Second_Task] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Second_Task] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Second_Task] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Second_Task] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Second_Task] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Second_Task] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Second_Task] SET QUERY_STORE = OFF
GO
USE [Second_Task]
GO
/****** Object:  Table [dbo].[Restaurent]    Script Date: 7/20/2022 6:15:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Restaurent](
	[RestaurentID] [int] NOT NULL,
	[RestaurentName] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[RestaurentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[restaurentCategory]    Script Date: 7/20/2022 6:15:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[restaurentCategory](
	[RestaurentID1] [int] NOT NULL,
	[CategoryID1] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RestaurentID1] ASC,
	[CategoryID1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Items]    Script Date: 7/20/2022 6:15:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items](
	[ItemsID] [int] IDENTITY(1,1) NOT NULL,
	[ItemsName] [varchar](255) NULL,
	[price] [int] NULL,
	[CategoryID2] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ItemsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[viewRestaurentItem]    Script Date: 7/20/2022 6:15:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[viewRestaurentItem] AS
SELECT RestaurentName, ItemsName
FROM Restaurent
INNER JOIN restaurentCategory ON Restaurent.RestaurentID=restaurentCategory.RestaurentID1
INNER JOIN Items ON restaurentCategory.CategoryID1=Items.CategoryID2;
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/20/2022 6:15:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] NOT NULL,
	[CategoryName] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (1, N'Hot Drinks')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (2, N'Cold Drinks')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (3, N'Salads')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (4, N'Main Meal')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (5, N'Sweets')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (6, N'Arabic Meals')
GO
SET IDENTITY_INSERT [dbo].[Items] ON 

INSERT [dbo].[Items] ([ItemsID], [ItemsName], [price], [CategoryID2]) VALUES (1, N'coffee', 15, 1)
INSERT [dbo].[Items] ([ItemsID], [ItemsName], [price], [CategoryID2]) VALUES (2, N'tea', 5, 1)
INSERT [dbo].[Items] ([ItemsID], [ItemsName], [price], [CategoryID2]) VALUES (3, N'hotChocolate', 25, 1)
INSERT [dbo].[Items] ([ItemsID], [ItemsName], [price], [CategoryID2]) VALUES (4, N'milk', 10, 1)
INSERT [dbo].[Items] ([ItemsID], [ItemsName], [price], [CategoryID2]) VALUES (5, N'iceCoffee', 15, 2)
INSERT [dbo].[Items] ([ItemsID], [ItemsName], [price], [CategoryID2]) VALUES (6, N'orange juice', 10, 2)
INSERT [dbo].[Items] ([ItemsID], [ItemsName], [price], [CategoryID2]) VALUES (7, N'lemon juice', 15, 2)
INSERT [dbo].[Items] ([ItemsID], [ItemsName], [price], [CategoryID2]) VALUES (8, N'apple juice', 15, 2)
INSERT [dbo].[Items] ([ItemsID], [ItemsName], [price], [CategoryID2]) VALUES (9, N'fatoosh', 30, 3)
INSERT [dbo].[Items] ([ItemsID], [ItemsName], [price], [CategoryID2]) VALUES (10, N'tradetional salad', 40, 3)
INSERT [dbo].[Items] ([ItemsID], [ItemsName], [price], [CategoryID2]) VALUES (11, N'caesar salad', 45, 3)
INSERT [dbo].[Items] ([ItemsID], [ItemsName], [price], [CategoryID2]) VALUES (12, N'tabbooleh', 60, 3)
INSERT [dbo].[Items] ([ItemsID], [ItemsName], [price], [CategoryID2]) VALUES (13, N'pizza', 65, 4)
INSERT [dbo].[Items] ([ItemsID], [ItemsName], [price], [CategoryID2]) VALUES (14, N'burger', 44, 4)
INSERT [dbo].[Items] ([ItemsID], [ItemsName], [price], [CategoryID2]) VALUES (15, N'tajen', 70, 4)
INSERT [dbo].[Items] ([ItemsID], [ItemsName], [price], [CategoryID2]) VALUES (16, N'pasta', 55, 4)
INSERT [dbo].[Items] ([ItemsID], [ItemsName], [price], [CategoryID2]) VALUES (17, N'maqluba', 80, 5)
INSERT [dbo].[Items] ([ItemsID], [ItemsName], [price], [CategoryID2]) VALUES (18, N'mansaf', 120, 5)
INSERT [dbo].[Items] ([ItemsID], [ItemsName], [price], [CategoryID2]) VALUES (19, N'musakhan', 100, 5)
INSERT [dbo].[Items] ([ItemsID], [ItemsName], [price], [CategoryID2]) VALUES (20, N'maftool', 111, 5)
INSERT [dbo].[Items] ([ItemsID], [ItemsName], [price], [CategoryID2]) VALUES (21, N'cake', 19, 6)
INSERT [dbo].[Items] ([ItemsID], [ItemsName], [price], [CategoryID2]) VALUES (22, N'chocolate cookies', 30, 6)
INSERT [dbo].[Items] ([ItemsID], [ItemsName], [price], [CategoryID2]) VALUES (23, N'mini cupcacke', 25, 6)
INSERT [dbo].[Items] ([ItemsID], [ItemsName], [price], [CategoryID2]) VALUES (24, N'katayef', 35, 6)
SET IDENTITY_INSERT [dbo].[Items] OFF
GO
INSERT [dbo].[Restaurent] ([RestaurentID], [RestaurentName]) VALUES (1, N'Afteem')
INSERT [dbo].[Restaurent] ([RestaurentID], [RestaurentName]) VALUES (2, N'Singer')
INSERT [dbo].[Restaurent] ([RestaurentID], [RestaurentName]) VALUES (3, N'Viendo')
GO
INSERT [dbo].[restaurentCategory] ([RestaurentID1], [CategoryID1]) VALUES (1, 1)
INSERT [dbo].[restaurentCategory] ([RestaurentID1], [CategoryID1]) VALUES (1, 2)
INSERT [dbo].[restaurentCategory] ([RestaurentID1], [CategoryID1]) VALUES (1, 3)
INSERT [dbo].[restaurentCategory] ([RestaurentID1], [CategoryID1]) VALUES (1, 4)
INSERT [dbo].[restaurentCategory] ([RestaurentID1], [CategoryID1]) VALUES (1, 5)
INSERT [dbo].[restaurentCategory] ([RestaurentID1], [CategoryID1]) VALUES (1, 6)
INSERT [dbo].[restaurentCategory] ([RestaurentID1], [CategoryID1]) VALUES (2, 1)
INSERT [dbo].[restaurentCategory] ([RestaurentID1], [CategoryID1]) VALUES (2, 2)
INSERT [dbo].[restaurentCategory] ([RestaurentID1], [CategoryID1]) VALUES (2, 6)
INSERT [dbo].[restaurentCategory] ([RestaurentID1], [CategoryID1]) VALUES (3, 3)
INSERT [dbo].[restaurentCategory] ([RestaurentID1], [CategoryID1]) VALUES (3, 4)
INSERT [dbo].[restaurentCategory] ([RestaurentID1], [CategoryID1]) VALUES (3, 5)
GO
/****** Object:  Index [indexPrice]    Script Date: 7/20/2022 6:15:38 PM ******/
CREATE NONCLUSTERED INDEX [indexPrice] ON [dbo].[Items]
(
	[price] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Items]  WITH CHECK ADD FOREIGN KEY([CategoryID2])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[restaurentCategory]  WITH CHECK ADD FOREIGN KEY([CategoryID1])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[restaurentCategory]  WITH CHECK ADD FOREIGN KEY([RestaurentID1])
REFERENCES [dbo].[Restaurent] ([RestaurentID])
GO
USE [master]
GO
ALTER DATABASE [Second_Task] SET  READ_WRITE 
GO
