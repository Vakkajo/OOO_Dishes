USE [master]
GO
/****** Object:  Database [Dishes_ooo]    Script Date: 26.04.2024 22:14:10 ******/
CREATE DATABASE [Dishes_ooo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Dishes_ooo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Dishes_ooo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Dishes_ooo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Dishes_ooo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Dishes_ooo] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Dishes_ooo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Dishes_ooo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Dishes_ooo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Dishes_ooo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Dishes_ooo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Dishes_ooo] SET ARITHABORT OFF 
GO
ALTER DATABASE [Dishes_ooo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Dishes_ooo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Dishes_ooo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Dishes_ooo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Dishes_ooo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Dishes_ooo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Dishes_ooo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Dishes_ooo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Dishes_ooo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Dishes_ooo] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Dishes_ooo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Dishes_ooo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Dishes_ooo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Dishes_ooo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Dishes_ooo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Dishes_ooo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Dishes_ooo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Dishes_ooo] SET RECOVERY FULL 
GO
ALTER DATABASE [Dishes_ooo] SET  MULTI_USER 
GO
ALTER DATABASE [Dishes_ooo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Dishes_ooo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Dishes_ooo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Dishes_ooo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Dishes_ooo] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Dishes_ooo', N'ON'
GO
ALTER DATABASE [Dishes_ooo] SET QUERY_STORE = OFF
GO
USE [Dishes_ooo]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Dishes_ooo]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 26.04.2024 22:14:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderStatus] [nvarchar](max) NOT NULL,
	[OrderDeliveryDate] [datetime] NOT NULL,
	[OrderPickupPoint] [int] NOT NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK__Order__C3905BAFEBE30265] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 26.04.2024 22:14:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderID] [int] NOT NULL,
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PickUpPoint]    Script Date: 26.04.2024 22:14:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PickUpPoint](
	[PointID] [int] IDENTITY(1,1) NOT NULL,
	[PointIndex] [int] NOT NULL,
	[PointTown] [nvarchar](max) NOT NULL,
	[PointStreet] [nvarchar](max) NOT NULL,
	[PointHouse] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PointID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 26.04.2024 22:14:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[ProductName] [nvarchar](255) NOT NULL,
	[ProductCost] [decimal](19, 4) NOT NULL,
	[ProductDiscountAmountMax] [tinyint] NULL,
	[ProductManufacturer] [nvarchar](255) NOT NULL,
	[ProductSupplier] [int] NOT NULL,
	[ProductCategory] [nvarchar](255) NOT NULL,
	[ProductDiscountAmount] [tinyint] NULL,
	[ProductQuantityInStock] [int] NOT NULL,
	[ProductDescription] [nvarchar](255) NOT NULL,
	[ProductPhoto] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 26.04.2024 22:14:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 26.04.2024 22:14:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 26.04.2024 22:14:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserSurname] [nvarchar](100) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[UserPatronymic] [nvarchar](100) NOT NULL,
	[UserLogin] [nvarchar](max) NOT NULL,
	[UserPassword] [nvarchar](max) NOT NULL,
	[UserRole] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PickUpPoint] ON 

INSERT [dbo].[PickUpPoint] ([PointID], [PointIndex], [PointTown], [PointStreet], [PointHouse]) VALUES (1, 344288, N'г.Краснокаменск', N'ул.Чехова', 1)
INSERT [dbo].[PickUpPoint] ([PointID], [PointIndex], [PointTown], [PointStreet], [PointHouse]) VALUES (2, 614164, N'г.Краснокаменск', N' ул.Степная', 30)
INSERT [dbo].[PickUpPoint] ([PointID], [PointIndex], [PointTown], [PointStreet], [PointHouse]) VALUES (3, 394242, N'г.Краснокаменск', N'ул.Коммунистическая', 43)
INSERT [dbo].[PickUpPoint] ([PointID], [PointIndex], [PointTown], [PointStreet], [PointHouse]) VALUES (4, 660540, N'г.Краснокаменск', N'ул.Солнечная', 25)
INSERT [dbo].[PickUpPoint] ([PointID], [PointIndex], [PointTown], [PointStreet], [PointHouse]) VALUES (5, 125837, N'г.Краснокаменск', N'ул.Шоссейная', 40)
INSERT [dbo].[PickUpPoint] ([PointID], [PointIndex], [PointTown], [PointStreet], [PointHouse]) VALUES (6, 125703, N'г.Краснокаменск', N'ул.Партизанская', 49)
INSERT [dbo].[PickUpPoint] ([PointID], [PointIndex], [PointTown], [PointStreet], [PointHouse]) VALUES (7, 625283, N'г.Краснокаменск', N'ул.Победы', 46)
INSERT [dbo].[PickUpPoint] ([PointID], [PointIndex], [PointTown], [PointStreet], [PointHouse]) VALUES (8, 614611, N'г.Краснокаменск', N'ул.Молодежная', 50)
INSERT [dbo].[PickUpPoint] ([PointID], [PointIndex], [PointTown], [PointStreet], [PointHouse]) VALUES (9, 454311, N'г.Краснокаменск', N'ул.Новая', 19)
INSERT [dbo].[PickUpPoint] ([PointID], [PointIndex], [PointTown], [PointStreet], [PointHouse]) VALUES (10, 660007, N'г.Краснокаменск', N'ул.Октябрьская', 19)
INSERT [dbo].[PickUpPoint] ([PointID], [PointIndex], [PointTown], [PointStreet], [PointHouse]) VALUES (11, 603036, N'г.Краснокаменск', N'ул.Садовая', 4)
INSERT [dbo].[PickUpPoint] ([PointID], [PointIndex], [PointTown], [PointStreet], [PointHouse]) VALUES (12, 450983, N'г.Краснокаменск', N'ул.Комсомольская', 26)
INSERT [dbo].[PickUpPoint] ([PointID], [PointIndex], [PointTown], [PointStreet], [PointHouse]) VALUES (13, 394782, N'г.Краснокаменск', N'ул.Чехова', 3)
INSERT [dbo].[PickUpPoint] ([PointID], [PointIndex], [PointTown], [PointStreet], [PointHouse]) VALUES (14, 603002, N'г.Краснокаменск', N'ул.Дзержинского', 28)
INSERT [dbo].[PickUpPoint] ([PointID], [PointIndex], [PointTown], [PointStreet], [PointHouse]) VALUES (15, 450558, N'г.Краснокаменск', N'ул.Набережная', 30)
INSERT [dbo].[PickUpPoint] ([PointID], [PointIndex], [PointTown], [PointStreet], [PointHouse]) VALUES (16, 394060, N'г.Краснокаменск', N'ул.Фрунзе', 43)
INSERT [dbo].[PickUpPoint] ([PointID], [PointIndex], [PointTown], [PointStreet], [PointHouse]) VALUES (17, 410661, N'г.Краснокаменск', N'ул.Школьная', 50)
INSERT [dbo].[PickUpPoint] ([PointID], [PointIndex], [PointTown], [PointStreet], [PointHouse]) VALUES (18, 625590, N'г.Краснокаменск', N'ул.Коммунистическая', 20)
INSERT [dbo].[PickUpPoint] ([PointID], [PointIndex], [PointTown], [PointStreet], [PointHouse]) VALUES (19, 625683, N'г.Краснокаменск', N'ул.8Марта', 9)
INSERT [dbo].[PickUpPoint] ([PointID], [PointIndex], [PointTown], [PointStreet], [PointHouse]) VALUES (20, 400562, N'г.Краснокаменск', N'ул.Зеленая', 32)
INSERT [dbo].[PickUpPoint] ([PointID], [PointIndex], [PointTown], [PointStreet], [PointHouse]) VALUES (21, 614510, N'г.Краснокаменск', N'ул.Маяковского', 47)
INSERT [dbo].[PickUpPoint] ([PointID], [PointIndex], [PointTown], [PointStreet], [PointHouse]) VALUES (22, 410542, N'г.Краснокаменск', N'ул.Светлая', 46)
INSERT [dbo].[PickUpPoint] ([PointID], [PointIndex], [PointTown], [PointStreet], [PointHouse]) VALUES (23, 620839, N'г.Краснокаменск', N'ул.Цветочная', 8)
INSERT [dbo].[PickUpPoint] ([PointID], [PointIndex], [PointTown], [PointStreet], [PointHouse]) VALUES (24, 443890, N'г.Краснокаменск', N'ул.Коммунистическая', 1)
INSERT [dbo].[PickUpPoint] ([PointID], [PointIndex], [PointTown], [PointStreet], [PointHouse]) VALUES (25, 603379, N'г.Краснокаменск', N'ул.Спортивная', 46)
INSERT [dbo].[PickUpPoint] ([PointID], [PointIndex], [PointTown], [PointStreet], [PointHouse]) VALUES (26, 603721, N'г.Краснокаменск', N'ул.Гоголя', 41)
INSERT [dbo].[PickUpPoint] ([PointID], [PointIndex], [PointTown], [PointStreet], [PointHouse]) VALUES (27, 410172, N'г.Краснокаменск', N'ул.Северная', 13)
INSERT [dbo].[PickUpPoint] ([PointID], [PointIndex], [PointTown], [PointStreet], [PointHouse]) VALUES (28, 420151, N'г.Краснокаменск', N'ул.Вишневая', 32)
INSERT [dbo].[PickUpPoint] ([PointID], [PointIndex], [PointTown], [PointStreet], [PointHouse]) VALUES (29, 125061, N'г.Краснокаменск', N'ул.Подгорная', 8)
INSERT [dbo].[PickUpPoint] ([PointID], [PointIndex], [PointTown], [PointStreet], [PointHouse]) VALUES (30, 630370, N'г.Краснокаменск', N'ул.Шоссейная', 24)
INSERT [dbo].[PickUpPoint] ([PointID], [PointIndex], [PointTown], [PointStreet], [PointHouse]) VALUES (31, 614753, N'г.Краснокаменск', N'ул.Полевая', 35)
INSERT [dbo].[PickUpPoint] ([PointID], [PointIndex], [PointTown], [PointStreet], [PointHouse]) VALUES (32, 426030, N'г.Краснокаменск', N'ул.Маяковского', 44)
INSERT [dbo].[PickUpPoint] ([PointID], [PointIndex], [PointTown], [PointStreet], [PointHouse]) VALUES (33, 450375, N'г.Краснокаменск', N'ул.Клубная', 44)
INSERT [dbo].[PickUpPoint] ([PointID], [PointIndex], [PointTown], [PointStreet], [PointHouse]) VALUES (34, 625560, N'г.Краснокаменск', N'ул.Некрасова', 12)
INSERT [dbo].[PickUpPoint] ([PointID], [PointIndex], [PointTown], [PointStreet], [PointHouse]) VALUES (35, 630201, N'г.Краснокаменск', N'ул.Комсомольская', 17)
INSERT [dbo].[PickUpPoint] ([PointID], [PointIndex], [PointTown], [PointStreet], [PointHouse]) VALUES (36, 190949, N'г.Краснокаменск', N'ул.Мичурина', 26)
SET IDENTITY_INSERT [dbo].[PickUpPoint] OFF
INSERT [dbo].[Products] ([ProductArticleNumber], [ProductName], [ProductCost], [ProductDiscountAmountMax], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'A395T3', N'Набор кастрюль', CAST(2150.0000 AS Decimal(19, 4)), 15, N'Эмаль', 2, N'Кастрюли', 2, 13, N'Набор кастрюль Эмаль Дача 2-3194/4 белый', N'picture.png')
INSERT [dbo].[Products] ([ProductArticleNumber], [ProductName], [ProductCost], [ProductDiscountAmountMax], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'C367R6', N'Набор кастрюль', CAST(3600.0000 AS Decimal(19, 4)), 15, N'Webber', 1, N'Кастрюли', 3, 7, N'Набор кастрюль Webber BE-336/6 6 пр. серебристый', N'picture.png')
INSERT [dbo].[Products] ([ProductArticleNumber], [ProductName], [ProductCost], [ProductDiscountAmountMax], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'C425F8', N'Набор посуды', CAST(5990.0000 AS Decimal(19, 4)), 15, N'Нева', 2, N'Посуда', 5, 9, N'Набор обеденной посуды Mason Cash Classic 12 предметов серый', N'picture.png')
INSERT [dbo].[Products] ([ProductArticleNumber], [ProductName], [ProductCost], [ProductDiscountAmountMax], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'C432H7', N'Набор посуды', CAST(2700.0000 AS Decimal(19, 4)), 30, N'Tefal', 1, N'Посуда', 4, 6, N'Набор посуды Tefal Ingenio Red 04162820 3 пр. красный', N'picture.png')
INSERT [dbo].[Products] ([ProductArticleNumber], [ProductName], [ProductCost], [ProductDiscountAmountMax], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'D026R4', N'Сковорода', CAST(1800.0000 AS Decimal(19, 4)), 25, N'Нева', 2, N'Сковорода', 4, 2, N'Сковорода НЕВА МЕТАЛЛ ПОСУДА Карелия 2328, 28 см', N'picture.png')
INSERT [dbo].[Products] ([ProductArticleNumber], [ProductName], [ProductCost], [ProductDiscountAmountMax], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'D036H2', N'Сковорода', CAST(1960.0000 AS Decimal(19, 4)), 5, N'Нева', 1, N'Сковорода', 5, 12, N'Сковорода НЕВА МЕТАЛЛ ПОСУДА Алтай индукционная, 26 см', N'D036H2.jpg')
INSERT [dbo].[Products] ([ProductArticleNumber], [ProductName], [ProductCost], [ProductDiscountAmountMax], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'D548T5', N'Столовый сервиз', CAST(1700.0000 AS Decimal(19, 4)), 15, N'Luminarc', 2, N'Сервиз', 4, 10, N'Столовый сервиз Luminarc Every Day G0566, 6 персон, 18 предм.', N'D548T5.jpg')
INSERT [dbo].[Products] ([ProductArticleNumber], [ProductName], [ProductCost], [ProductDiscountAmountMax], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'D630H5', N'Набор кастрюль', CAST(2000.0000 AS Decimal(19, 4)), 10, N'Webber', 1, N'Кастрюли', 3, 8, N'Набор кастрюль Webber BE-621/6 стальной', N'picture.png')
INSERT [dbo].[Products] ([ProductArticleNumber], [ProductName], [ProductCost], [ProductDiscountAmountMax], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'D644G3', N'Набор кастрюль', CAST(3500.0000 AS Decimal(19, 4)), 5, N'Webber', 2, N'Кастрюли', 3, 8, N'Набор кастрюль Webber ВЕ-620/8 8 пр. стальной', N'D644G3.jpg')
INSERT [dbo].[Products] ([ProductArticleNumber], [ProductName], [ProductCost], [ProductDiscountAmountMax], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'F735F5', N'Сковорода', CAST(1270.0000 AS Decimal(19, 4)), 10, N'Нева', 2, N'Сковорода', 2, 4, N'Сковорода НЕВА МЕТАЛЛ ПОСУДА Домашняя 7424, съемная ручка, 24 см', N'F735F5.jpg')
INSERT [dbo].[Products] ([ProductArticleNumber], [ProductName], [ProductCost], [ProductDiscountAmountMax], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'F835F5', N'Набор посуды', CAST(732.0000 AS Decimal(19, 4)), 10, N'Solaris', 2, N'Сервиз', 2, 9, N'Набор посуды SOLARIS S1605: 6 тарелок 180мм в контейнере', N'F835F5.jpg')
INSERT [dbo].[Products] ([ProductArticleNumber], [ProductName], [ProductCost], [ProductDiscountAmountMax], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'F835H6', N'Кастрюля для запекания', CAST(2130.0000 AS Decimal(19, 4)), 10, N'Нева', 2, N'Кастрюли', 2, 5, N'Кастрюля эмалированная, цветок Розы', N'picture.png')
INSERT [dbo].[Products] ([ProductArticleNumber], [ProductName], [ProductCost], [ProductDiscountAmountMax], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'F836E5', N'Набор сковород', CAST(4600.0000 AS Decimal(19, 4)), 20, N'Tefal', 1, N'Сковорода', 2, 6, N'Набор сковород Tefal Ingenio Chef Red L6598672 3 пр. бордовый', N'F836E5.jpg')
INSERT [dbo].[Products] ([ProductArticleNumber], [ProductName], [ProductCost], [ProductDiscountAmountMax], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'F934E5', N'Сервировочное блюдо', CAST(1200.0000 AS Decimal(19, 4)), 10, N'Нева', 1, N'Посуда', 3, 5, N'Сервировочное блюдо ROSSI для подачи из керамики 28х18 см ', N'picture.png')
INSERT [dbo].[Products] ([ProductArticleNumber], [ProductName], [ProductCost], [ProductDiscountAmountMax], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'G405K9', N'Набор посуды', CAST(240.0000 AS Decimal(19, 4)), 5, N'Solaris', 2, N'Посуда', 4, 23, N'Набор посуды SOLARIS S1607: 6 стаканов 0,1л в контейнере', N'picture.png')
INSERT [dbo].[Products] ([ProductArticleNumber], [ProductName], [ProductCost], [ProductDiscountAmountMax], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'H482Y6', N'Столовый сервиз', CAST(2300.0000 AS Decimal(19, 4)), 15, N'Luminarc', 1, N'Сервиз', 5, 12, N'Столовый сервиз Luminarc Cadix L0300, 6 персон, 19 предм.', N'H482Y6.jpg')
INSERT [dbo].[Products] ([ProductArticleNumber], [ProductName], [ProductCost], [ProductDiscountAmountMax], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'J468K6', N'Набор сковород', CAST(1390.0000 AS Decimal(19, 4)), 25, N'Galaxy', 2, N'Сковорода', 2, 13, N'Набор сковород GALAXY GL9801 2 пр. синий', N'picture.png')
INSERT [dbo].[Products] ([ProductArticleNumber], [ProductName], [ProductCost], [ProductDiscountAmountMax], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'K036S3', N'Набор посуды', CAST(2990.0000 AS Decimal(19, 4)), 5, N'Galaxy', 1, N'Сервиз', 5, 15, N'Набор посуды GALAXY GL9507 6 пр. коричневый', N'picture.png')
INSERT [dbo].[Products] ([ProductArticleNumber], [ProductName], [ProductCost], [ProductDiscountAmountMax], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'K935B6', N'Салатник', CAST(1200.0000 AS Decimal(19, 4)), 5, N'Нева', 2, N'Посуда', 3, 9, N'Салатник «Кото», 0,19 л 10 см красный, фарфор', N'picture.png')
INSERT [dbo].[Products] ([ProductArticleNumber], [ProductName], [ProductCost], [ProductDiscountAmountMax], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'L346D4', N'Набор кружек', CAST(329.0000 AS Decimal(19, 4)), 5, N'Нева', 1, N'Посуда', 5, 18, N'Набор кружек Pasabahce Basic, 370 мл, 2 предм., 2 персоны', N'picture.png')
INSERT [dbo].[Products] ([ProductArticleNumber], [ProductName], [ProductCost], [ProductDiscountAmountMax], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'M045H6', N'Набор кастрюль', CAST(1499.0000 AS Decimal(19, 4)), 15, N'Эмаль', 1, N'Кастрюли', 4, 7, N'Набор кастрюль СтальЭмаль 1с33/1 6 пр. белоснежный /маки ', N'picture.png')
INSERT [dbo].[Products] ([ProductArticleNumber], [ProductName], [ProductCost], [ProductDiscountAmountMax], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'M527Y7', N'Казан', CAST(1999.0000 AS Decimal(19, 4)), 30, N'Нева', 1, N'Кастрюли', 3, 6, N'Казан 5 л Наша Посуда антипригарный', N'picture.png')
INSERT [dbo].[Products] ([ProductArticleNumber], [ProductName], [ProductCost], [ProductDiscountAmountMax], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'N835D4', N'Набор кастрюль', CAST(2100.0000 AS Decimal(19, 4)), 10, N'Galaxy', 2, N'Кастрюли', 3, 5, N'Набор кастрюль GALAXY GL9512 4 пр. фиолетовый', N'N835D4.jpg')
INSERT [dbo].[Products] ([ProductArticleNumber], [ProductName], [ProductCost], [ProductDiscountAmountMax], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'N835F5', N'Кастрюля для запекания', CAST(744.0000 AS Decimal(19, 4)), 5, N'Tefal', 2, N'Кастрюли', 3, 13, N'Кастрюля для запекания Tefal 208AC00/1043, 2.3 л, 23 см', N'N835F5.jpg')
INSERT [dbo].[Products] ([ProductArticleNumber], [ProductName], [ProductCost], [ProductDiscountAmountMax], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'S257G5', N'Набор посуды', CAST(2300.0000 AS Decimal(19, 4)), 10, N'Tefal', 1, N'Посуда', 4, 8, N'Набор посуды для выпечки O CUISINE 333SA95/6142', N'picture.png')
INSERT [dbo].[Products] ([ProductArticleNumber], [ProductName], [ProductCost], [ProductDiscountAmountMax], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'S306J8', N'Ковш', CAST(409.0000 AS Decimal(19, 4)), 10, N'Tefal', 2, N'Посуда', 2, 14, N'Ковш б/деколи(палевый) 17,5х8 см 1,5 л', N'picture.png')
INSERT [dbo].[Products] ([ProductArticleNumber], [ProductName], [ProductCost], [ProductDiscountAmountMax], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'S413D4', N'Набор кастрюль', CAST(4500.0000 AS Decimal(19, 4)), 15, N'Эмаль', 2, N'Кастрюли', 3, 15, N'Набор кастрюль СтальЭмаль 7DA025S 6 пр. слоновая кость', N'picture.png')
INSERT [dbo].[Products] ([ProductArticleNumber], [ProductName], [ProductCost], [ProductDiscountAmountMax], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'S835H6', N'Кастрюля для запекания', CAST(1600.0000 AS Decimal(19, 4)), 15, N'Tefal', 2, N'Кастрюли', 4, 13, N'Кастрюля Scovo Expert СЭ-008, 4.5 л', N'picture.png')
INSERT [dbo].[Products] ([ProductArticleNumber], [ProductName], [ProductCost], [ProductDiscountAmountMax], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'V493H5', N'Набор посуды', CAST(6000.0000 AS Decimal(19, 4)), 15, N'Tefal', 1, N'Посуда', 4, 18, N'Набор посуды Tefal Ingenio RED 9 предметов ', N'picture.png')
INSERT [dbo].[Products] ([ProductArticleNumber], [ProductName], [ProductCost], [ProductDiscountAmountMax], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'А112Т4', N'Набор кастрюль', CAST(2600.0000 AS Decimal(19, 4)), 30, N'Webber', 1, N'Кастрюли', 4, 6, N'Набор кастрюль Webber BE-335/6 6 пр. серебристый', N'А112Т4.jpg')
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Администратор
')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Менеджер
')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Клиент
')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([SupplierID], [SupplierName]) VALUES (1, N'Максидом
')
INSERT [dbo].[Supplier] ([SupplierID], [SupplierName]) VALUES (2, N'Домовой
')
SET IDENTITY_INSERT [dbo].[Supplier] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (1, N'Федоров', N'Глеб', N'Михайлович', N'o@outlook.com', N'2L6KZG', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (2, N'Семенова', N'Софья', N'Дмитриевна', N'hr6zdl@yandex.ru', N'uzWC67', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (3, N'Васильев', N'Егор', N'Германович', N'kaft93x@outlook.com', N'8ntwUp', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (4, N'Смирнова', N'Ирина', N'Александровна', N'dcu@yandex.ru', N'YOyhfR', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (5, N'Петров', N'Андрей', N'Владимирович', N'19dn@outlook.com', N'RSbvHv', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (6, N'Егоров', N'Максим', N'Андреевич', N'pa5h@mail.ru', N'rwVDh9', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (7, N'Никитин', N'Артур', N'Алексеевич', N'281av0@gmail.com', N'LdNyos', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (8, N'Киселев', N'Максим', N'Сергеевич', N'8edmfh@outlook.com', N'gynQMT', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (9, N'Борисов', N'Тимур', N'Егорович', N'sfn13i@mail.ru', N'AtnDjr', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (10, N'Климов', N'Арсений', N'Тимурович', N'g0orc3x1@outlook.com', N'JlFRCZ', 3)
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK__Order__OrderPick__2A4B4B5E] FOREIGN KEY([OrderPickupPoint])
REFERENCES [dbo].[PickUpPoint] ([PointID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK__Order__OrderPick__2A4B4B5E]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK__Order__UserID__2B3F6F97] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK__Order__UserID__2B3F6F97]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__OrderProd__Order__300424B4] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__OrderProd__Order__300424B4]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__OrderProd__Produ__30F848ED] FOREIGN KEY([ProductArticleNumber])
REFERENCES [dbo].[Products] ([ProductArticleNumber])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__OrderProd__Produ__30F848ED]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Supplier] FOREIGN KEY([ProductSupplier])
REFERENCES [dbo].[Supplier] ([SupplierID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Supplier]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([UserRole])
REFERENCES [dbo].[Role] ([RoleID])
GO
/****** Object:  StoredProcedure [dbo].[CheckLogin]    Script Date: 26.04.2024 22:14:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CheckLogin]
	@Login nvarchar(max),
	@Password nvarchar(max)
AS
BEGIN
	SELECT * FROM [User] WHERE UserLogin = @Login and UserPassword = @Password
END
GO
USE [master]
GO
ALTER DATABASE [Dishes_ooo] SET  READ_WRITE 
GO
