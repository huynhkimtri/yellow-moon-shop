USE [master]
GO
/****** Object:  Database [MoonShop]    Script Date: 10/14/2020 11:11:38 PM ******/
CREATE DATABASE [MoonShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MoonShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MoonShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MoonShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MoonShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MoonShop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MoonShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MoonShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MoonShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MoonShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MoonShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MoonShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [MoonShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MoonShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MoonShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MoonShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MoonShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MoonShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MoonShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MoonShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MoonShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MoonShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MoonShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MoonShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MoonShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MoonShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MoonShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MoonShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MoonShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MoonShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MoonShop] SET  MULTI_USER 
GO
ALTER DATABASE [MoonShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MoonShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MoonShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MoonShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MoonShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MoonShop] SET QUERY_STORE = OFF
GO
USE [MoonShop]
GO
/****** Object:  User [admin]    Script Date: 10/14/2020 11:11:39 PM ******/
CREATE USER [admin] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[cakes]    Script Date: 10/14/2020 11:11:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cakes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](64) NOT NULL,
	[image_url] [varchar](256) NOT NULL,
	[description] [nvarchar](256) NOT NULL,
	[price] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[category_id] [int] NOT NULL,
	[is_active] [bit] NOT NULL,
	[create_date] [datetime] NOT NULL,
	[expiration_date] [datetime] NOT NULL,
	[updated_date] [datetime] NULL,
	[create_user] [varchar](32) NOT NULL,
	[update_user] [varchar](32) NULL,
 CONSTRAINT [PK_Cake] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 10/14/2020 11:11:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](32) NOT NULL,
	[createdDate] [datetime] NOT NULL,
	[updatedDate] [datetime] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_details]    Script Date: 10/14/2020 11:11:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_details](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NOT NULL,
	[cake_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[single_price] [int] NOT NULL,
	[create_date] [datetime] NOT NULL,
	[update_date] [datetime] NULL,
 CONSTRAINT [PK_OrderCake] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 10/14/2020 11:11:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [varchar](32) NULL,
	[amount] [int] NOT NULL,
	[payment_id] [int] NOT NULL,
	[status] [nvarchar](32) NULL,
	[shipping_email] [varchar](32) NULL,
	[shipping_phone] [varchar](16) NULL,
	[shipping_name] [nvarchar](32) NULL,
	[shipping_address] [nvarchar](64) NULL,
	[create_date] [datetime] NOT NULL,
	[update_date] [datetime] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payments]    Script Date: 10/14/2020 11:11:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](64) NOT NULL,
	[is_allowed] [bit] NOT NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_roles]    Script Date: 10/14/2020 11:11:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_roles](
	[id] [int] NOT NULL,
	[name] [nvarchar](32) NOT NULL,
	[description] [nvarchar](256) NULL,
 CONSTRAINT [PK_user_roles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 10/14/2020 11:11:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[username] [varchar](32) NOT NULL,
	[password] [varchar](64) NOT NULL,
	[full_name] [nvarchar](64) NOT NULL,
	[email] [varchar](32) NULL,
	[phone] [varchar](16) NOT NULL,
	[address] [nvarchar](64) NULL,
	[remember_token] [varchar](64) NULL,
	[is_active] [bit] NOT NULL,
	[create_date] [datetime] NOT NULL,
	[update_date] [datetime] NULL,
	[role_id] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cakes] ON 

INSERT [dbo].[cakes] ([id], [name], [image_url], [description], [price], [quantity], [category_id], [is_active], [create_date], [expiration_date], [updated_date], [create_user], [update_user]) VALUES (5, N'Bánh Trăng Vàng Hồng Ngọc An Lành cam', N'https://giaonhanh.vn/assets/uploads/2014/07/banh-trung-thu-trang-vang-hong-ngoc-vang-kinh-do1.jpg', N'Bánh trăng vàng trung thu thơm ngon chất lượng cao', 600000, 93, 12, 1, CAST(N'2020-10-04T19:38:50.417' AS DateTime), CAST(N'2020-12-04T19:38:50.417' AS DateTime), NULL, N'yellow_admin', NULL)
INSERT [dbo].[cakes] ([id], [name], [image_url], [description], [price], [quantity], [category_id], [is_active], [create_date], [expiration_date], [updated_date], [create_user], [update_user]) VALUES (6, N'Bánh Trang Vàng Hồng Ngọc An Nhiên tím', N'https://giaonhanh.vn/assets/uploads/2014/07/banh-trung-thu-trang-vang-hong-ngoc-vang-kinh-do1.jpg', N'Bánh trang vàng hồng ngọc an nhiên tím thom ngon bổ rẻ', 600000, 36, 12, 1, CAST(N'2020-10-04T19:38:50.417' AS DateTime), CAST(N'2020-11-04T19:38:50.417' AS DateTime), NULL, N'yellow_admin', NULL)
INSERT [dbo].[cakes] ([id], [name], [image_url], [description], [price], [quantity], [category_id], [is_active], [create_date], [expiration_date], [updated_date], [create_user], [update_user]) VALUES (7, N'Bánh trung thu OREO 4 bánh', N'https://giaonhanh.vn/assets/uploads/2014/07/banh-trung-thu-trang-vang-hong-ngoc-vang-kinh-do1.jpg', N'Bánh trung thu OREO 4 bánh', 600000, 43, 12, 1, CAST(N'2020-10-04T19:38:50.417' AS DateTime), CAST(N'2020-11-04T19:38:50.417' AS DateTime), NULL, N'yellow_admin', NULL)
INSERT [dbo].[cakes] ([id], [name], [image_url], [description], [price], [quantity], [category_id], [is_active], [create_date], [expiration_date], [updated_date], [create_user], [update_user]) VALUES (8, N'Bánh Hạt Sen Trà Xanh', N'https://giaonhanh.vn/assets/uploads/2014/07/banh-trung-thu-trang-vang-hong-ngoc-vang-kinh-do1.jpg', N'Bánh Hạt Sen Trà Xanh', 600000, 56, 9, 1, CAST(N'2020-10-04T19:38:50.417' AS DateTime), CAST(N'2020-12-04T19:38:50.417' AS DateTime), NULL, N'yellow_admin', NULL)
INSERT [dbo].[cakes] ([id], [name], [image_url], [description], [price], [quantity], [category_id], [is_active], [create_date], [expiration_date], [updated_date], [create_user], [update_user]) VALUES (9, N'Bánh Lạp xưởng ngủ hạt', N'https://giaonhanh.vn/assets/uploads/2014/07/banh-trung-thu-trang-vang-hong-ngoc-vang-kinh-do1.jpg', N'Bánh Lạp xưởng ngủ hạt', 120000, 53, 9, 1, CAST(N'2020-10-04T19:38:50.417' AS DateTime), CAST(N'2020-12-04T19:38:50.417' AS DateTime), NULL, N'yellow_admin', NULL)
INSERT [dbo].[cakes] ([id], [name], [image_url], [description], [price], [quantity], [category_id], [is_active], [create_date], [expiration_date], [updated_date], [create_user], [update_user]) VALUES (10, N'Bánh Trung Thu Chay Phô Mai', N'https://giaonhanh.vn/assets/uploads/2014/07/banh-trung-thu-trang-vang-hong-ngoc-vang-kinh-do1.jpg', N'Bánh Trung Thu Chay Phô Mai', 70000, 60, 13, 1, CAST(N'2020-10-04T19:38:50.417' AS DateTime), CAST(N'2020-12-04T19:38:50.417' AS DateTime), NULL, N'yellow_admin', NULL)
INSERT [dbo].[cakes] ([id], [name], [image_url], [description], [price], [quantity], [category_id], [is_active], [create_date], [expiration_date], [updated_date], [create_user], [update_user]) VALUES (11, N'Bánh Dẻo đậu xanh hạt dưa (1 trứng)', N'https://giaonhanh.vn/assets/uploads/2014/07/banh-trung-thu-trang-vang-hong-ngoc-vang-kinh-do1.jpg', N'Bánh Dẻo đậu xanh hạt dưa (1 trứng)', 75000, 60, 6, 1, CAST(N'2020-10-04T19:38:50.417' AS DateTime), CAST(N'2020-12-04T19:38:50.417' AS DateTime), NULL, N'yellow_admin', NULL)
INSERT [dbo].[cakes] ([id], [name], [image_url], [description], [price], [quantity], [category_id], [is_active], [create_date], [expiration_date], [updated_date], [create_user], [update_user]) VALUES (12, N'Bánh Dẻo sầu riêng hạt sen (0 trứng)', N'https://giaonhanh.vn/assets/uploads/2014/07/banh-trung-thu-trang-vang-hong-ngoc-vang-kinh-do1.jpg', N'Bánh Dẻo sầu riêng hạt sen (0 trứng)', 68000, 60, 6, 1, CAST(N'2020-10-04T19:38:50.417' AS DateTime), CAST(N'2020-12-04T19:38:50.417' AS DateTime), NULL, N'yellow_admin', NULL)
INSERT [dbo].[cakes] ([id], [name], [image_url], [description], [price], [quantity], [category_id], [is_active], [create_date], [expiration_date], [updated_date], [create_user], [update_user]) VALUES (13, N'Bánh Dẻo Đậu Xanh', N'https://giaonhanh.vn/assets/uploads/2014/07/banh-trung-thu-trang-vang-hong-ngoc-vang-kinh-do1.jpg', N'Bánh Dẻo Đậu Xanh', 35000, 120, 6, 1, CAST(N'2020-10-04T19:38:50.417' AS DateTime), CAST(N'2020-12-04T19:38:50.417' AS DateTime), NULL, N'yellow_admin', NULL)
INSERT [dbo].[cakes] ([id], [name], [image_url], [description], [price], [quantity], [category_id], [is_active], [create_date], [expiration_date], [updated_date], [create_user], [update_user]) VALUES (14, N'Bánh Dẻo Đậu Đỏ', N'https://giaonhanh.vn/assets/uploads/2014/07/banh-trung-thu-trang-vang-hong-ngoc-vang-kinh-do1.jpg', N'Bánh Dẻo Đậu Đỏ', 35000, 120, 6, 1, CAST(N'2020-10-04T19:38:50.417' AS DateTime), CAST(N'2020-12-04T19:38:50.417' AS DateTime), NULL, N'yellow_admin', NULL)
INSERT [dbo].[cakes] ([id], [name], [image_url], [description], [price], [quantity], [category_id], [is_active], [create_date], [expiration_date], [updated_date], [create_user], [update_user]) VALUES (15, N'Bánh Dẻo Đậu Đen không đường', N'https://giaonhanh.vn/assets/uploads/2014/07/banh-trung-thu-trang-vang-hong-ngoc-vang-kinh-do1.jpg', N'Bánh Dẻo Đậu Đen không đường', 35000, 120, 6, 1, CAST(N'2020-10-04T19:38:50.417' AS DateTime), CAST(N'2020-12-04T19:38:50.417' AS DateTime), NULL, N'yellow_admin', NULL)
INSERT [dbo].[cakes] ([id], [name], [image_url], [description], [price], [quantity], [category_id], [is_active], [create_date], [expiration_date], [updated_date], [create_user], [update_user]) VALUES (16, N'Bánh Dẻo Đậu Đen không đường', N'https://giaonhanh.vn/assets/uploads/2014/07/banh-trung-thu-trang-vang-hong-ngoc-vang-kinh-do1.jpg', N'Bánh Dẻo Đậu Đen không đường', 35000, 120, 6, 1, CAST(N'2020-10-04T19:38:50.417' AS DateTime), CAST(N'2020-12-04T19:38:50.417' AS DateTime), NULL, N'yellow_admin', NULL)
SET IDENTITY_INSERT [dbo].[cakes] OFF
GO
SET IDENTITY_INSERT [dbo].[categories] ON 

INSERT [dbo].[categories] ([id], [name], [createdDate], [updatedDate]) VALUES (2, N'BÁNH XANH', CAST(N'2020-10-04T19:38:50.417' AS DateTime), NULL)
INSERT [dbo].[categories] ([id], [name], [createdDate], [updatedDate]) VALUES (4, N'BÁNH THIẾU NHI', CAST(N'2020-10-04T19:38:50.417' AS DateTime), NULL)
INSERT [dbo].[categories] ([id], [name], [createdDate], [updatedDate]) VALUES (6, N'BÁNH DẺO', CAST(N'2020-10-04T19:38:50.417' AS DateTime), NULL)
INSERT [dbo].[categories] ([id], [name], [createdDate], [updatedDate]) VALUES (7, N'BÁNH NƯỚNG', CAST(N'2020-10-04T19:38:50.417' AS DateTime), NULL)
INSERT [dbo].[categories] ([id], [name], [createdDate], [updatedDate]) VALUES (9, N'BÁNH NƯỚNG 2 TRỨNG', CAST(N'2020-10-04T19:38:50.417' AS DateTime), NULL)
INSERT [dbo].[categories] ([id], [name], [createdDate], [updatedDate]) VALUES (11, N'BÁNH NƯỚNG 4 TRỨNG ĐẶC BIỆT', CAST(N'2020-10-04T19:38:50.417' AS DateTime), NULL)
INSERT [dbo].[categories] ([id], [name], [createdDate], [updatedDate]) VALUES (12, N'BÁNH TRĂNG VÀNG CAO CẤP', CAST(N'2020-10-04T19:38:50.417' AS DateTime), NULL)
INSERT [dbo].[categories] ([id], [name], [createdDate], [updatedDate]) VALUES (13, N'BÁNH CHAY', CAST(N'2020-10-04T19:38:50.417' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[categories] OFF
GO
SET IDENTITY_INSERT [dbo].[order_details] ON 

INSERT [dbo].[order_details] ([id], [order_id], [cake_id], [quantity], [single_price], [create_date], [update_date]) VALUES (1, 2, 5, 1, 600000, CAST(N'2020-10-14T22:22:15.340' AS DateTime), NULL)
INSERT [dbo].[order_details] ([id], [order_id], [cake_id], [quantity], [single_price], [create_date], [update_date]) VALUES (2, 2, 6, 2, 600000, CAST(N'2020-10-14T22:22:15.347' AS DateTime), NULL)
INSERT [dbo].[order_details] ([id], [order_id], [cake_id], [quantity], [single_price], [create_date], [update_date]) VALUES (3, 2, 7, 1, 600000, CAST(N'2020-10-14T22:22:15.350' AS DateTime), NULL)
INSERT [dbo].[order_details] ([id], [order_id], [cake_id], [quantity], [single_price], [create_date], [update_date]) VALUES (4, 3, 6, 2, 600000, CAST(N'2020-10-14T22:23:49.110' AS DateTime), NULL)
INSERT [dbo].[order_details] ([id], [order_id], [cake_id], [quantity], [single_price], [create_date], [update_date]) VALUES (5, 3, 7, 2, 600000, CAST(N'2020-10-14T22:23:49.117' AS DateTime), NULL)
INSERT [dbo].[order_details] ([id], [order_id], [cake_id], [quantity], [single_price], [create_date], [update_date]) VALUES (6, 4, 5, 1, 600000, CAST(N'2020-10-14T22:29:57.950' AS DateTime), NULL)
INSERT [dbo].[order_details] ([id], [order_id], [cake_id], [quantity], [single_price], [create_date], [update_date]) VALUES (7, 4, 6, 5, 600000, CAST(N'2020-10-14T22:29:57.957' AS DateTime), NULL)
INSERT [dbo].[order_details] ([id], [order_id], [cake_id], [quantity], [single_price], [create_date], [update_date]) VALUES (8, 4, 7, 3, 600000, CAST(N'2020-10-14T22:29:57.960' AS DateTime), NULL)
INSERT [dbo].[order_details] ([id], [order_id], [cake_id], [quantity], [single_price], [create_date], [update_date]) VALUES (9, 5, 5, 3, 600000, CAST(N'2020-10-14T22:47:51.450' AS DateTime), NULL)
INSERT [dbo].[order_details] ([id], [order_id], [cake_id], [quantity], [single_price], [create_date], [update_date]) VALUES (10, 6, 5, 7, 600000, CAST(N'2020-10-14T22:49:16.187' AS DateTime), NULL)
INSERT [dbo].[order_details] ([id], [order_id], [cake_id], [quantity], [single_price], [create_date], [update_date]) VALUES (11, 6, 7, 4, 600000, CAST(N'2020-10-14T22:49:16.193' AS DateTime), NULL)
INSERT [dbo].[order_details] ([id], [order_id], [cake_id], [quantity], [single_price], [create_date], [update_date]) VALUES (12, 7, 5, 7, 600000, CAST(N'2020-10-14T22:58:44.757' AS DateTime), NULL)
INSERT [dbo].[order_details] ([id], [order_id], [cake_id], [quantity], [single_price], [create_date], [update_date]) VALUES (13, 7, 7, 4, 600000, CAST(N'2020-10-14T22:58:44.760' AS DateTime), NULL)
INSERT [dbo].[order_details] ([id], [order_id], [cake_id], [quantity], [single_price], [create_date], [update_date]) VALUES (14, 8, 5, 7, 600000, CAST(N'2020-10-14T22:59:47.710' AS DateTime), NULL)
INSERT [dbo].[order_details] ([id], [order_id], [cake_id], [quantity], [single_price], [create_date], [update_date]) VALUES (15, 8, 6, 3, 600000, CAST(N'2020-10-14T22:59:47.717' AS DateTime), NULL)
INSERT [dbo].[order_details] ([id], [order_id], [cake_id], [quantity], [single_price], [create_date], [update_date]) VALUES (16, 9, 5, 7, 600000, CAST(N'2020-10-14T23:09:39.977' AS DateTime), NULL)
INSERT [dbo].[order_details] ([id], [order_id], [cake_id], [quantity], [single_price], [create_date], [update_date]) VALUES (17, 9, 6, 5, 600000, CAST(N'2020-10-14T23:09:39.990' AS DateTime), NULL)
INSERT [dbo].[order_details] ([id], [order_id], [cake_id], [quantity], [single_price], [create_date], [update_date]) VALUES (18, 10, 6, 12, 600000, CAST(N'2020-10-14T23:10:20.897' AS DateTime), NULL)
INSERT [dbo].[order_details] ([id], [order_id], [cake_id], [quantity], [single_price], [create_date], [update_date]) VALUES (19, 10, 7, 17, 600000, CAST(N'2020-10-14T23:10:20.910' AS DateTime), NULL)
INSERT [dbo].[order_details] ([id], [order_id], [cake_id], [quantity], [single_price], [create_date], [update_date]) VALUES (20, 11, 6, 7, 600000, CAST(N'2020-10-14T23:10:46.367' AS DateTime), NULL)
INSERT [dbo].[order_details] ([id], [order_id], [cake_id], [quantity], [single_price], [create_date], [update_date]) VALUES (21, 11, 8, 4, 600000, CAST(N'2020-10-14T23:10:46.377' AS DateTime), NULL)
INSERT [dbo].[order_details] ([id], [order_id], [cake_id], [quantity], [single_price], [create_date], [update_date]) VALUES (22, 11, 9, 7, 120000, CAST(N'2020-10-14T23:10:46.383' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[order_details] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([id], [user_id], [amount], [payment_id], [status], [shipping_email], [shipping_phone], [shipping_name], [shipping_address], [create_date], [update_date]) VALUES (1, NULL, 2400000, 2, NULL, N'huynhkimtri.fptu.k12@gmail.com', N'0332149898', N'Huynh Kim Tri', N'District 9', CAST(N'2020-10-14T22:20:48.627' AS DateTime), NULL)
INSERT [dbo].[orders] ([id], [user_id], [amount], [payment_id], [status], [shipping_email], [shipping_phone], [shipping_name], [shipping_address], [create_date], [update_date]) VALUES (2, NULL, 2400000, 2, NULL, N'huynhkimtri.fptu.k12@gmail.com', N'0332149898', N'Huynh Kim Tri', N'District 9', CAST(N'2020-10-14T22:22:15.300' AS DateTime), NULL)
INSERT [dbo].[orders] ([id], [user_id], [amount], [payment_id], [status], [shipping_email], [shipping_phone], [shipping_name], [shipping_address], [create_date], [update_date]) VALUES (3, NULL, 2400000, 2, NULL, N'huynhkimtri.fptu.k12@gmail.com', N'+841632149696', N'Tri', N'Tan Binh District', CAST(N'2020-10-14T22:23:49.070' AS DateTime), NULL)
INSERT [dbo].[orders] ([id], [user_id], [amount], [payment_id], [status], [shipping_email], [shipping_phone], [shipping_name], [shipping_address], [create_date], [update_date]) VALUES (4, N'huynhkimtri', 5400000, 2, NULL, N'myemail@gmail.com', N'0332149898', N'Huynh Kim Tri', N'FPT University HCM', CAST(N'2020-10-14T22:29:57.937' AS DateTime), NULL)
INSERT [dbo].[orders] ([id], [user_id], [amount], [payment_id], [status], [shipping_email], [shipping_phone], [shipping_name], [shipping_address], [create_date], [update_date]) VALUES (5, N'huynhkimtri', 1800000, 2, NULL, N'huynhkimtri.fptu.k12@gmail.com', N'0332149898', N'Huynh Kim Tri', N'District 9', CAST(N'2020-10-14T22:47:51.410' AS DateTime), NULL)
INSERT [dbo].[orders] ([id], [user_id], [amount], [payment_id], [status], [shipping_email], [shipping_phone], [shipping_name], [shipping_address], [create_date], [update_date]) VALUES (6, N'huynhkimtri', 6600000, 2, NULL, N'huynhkimtri.fptu.k12@gmail.com', N'0332149898', N'Huynh Kim Tri', N'District 9', CAST(N'2020-10-14T22:49:16.173' AS DateTime), NULL)
INSERT [dbo].[orders] ([id], [user_id], [amount], [payment_id], [status], [shipping_email], [shipping_phone], [shipping_name], [shipping_address], [create_date], [update_date]) VALUES (7, N'huynhkimtri', 6600000, 2, NULL, N'trihk@fsoft.com.vn', N'+841632149696', N'Tri', N'Tan Binh District', CAST(N'2020-10-14T22:58:44.747' AS DateTime), NULL)
INSERT [dbo].[orders] ([id], [user_id], [amount], [payment_id], [status], [shipping_email], [shipping_phone], [shipping_name], [shipping_address], [create_date], [update_date]) VALUES (8, N'huynhkimtri', 6000000, 2, NULL, N'huynhkimtri.fptu.k12@gmail.com', N'+841632149696', N'Tri', N'Tan Binh District', CAST(N'2020-10-14T22:59:47.660' AS DateTime), NULL)
INSERT [dbo].[orders] ([id], [user_id], [amount], [payment_id], [status], [shipping_email], [shipping_phone], [shipping_name], [shipping_address], [create_date], [update_date]) VALUES (9, NULL, 7200000, 2, NULL, N'huynhkimtri.fptu.k12@gmail.com', N'+841632149696', N'Tri', N'Tan Binh District', CAST(N'2020-10-14T23:09:39.933' AS DateTime), NULL)
INSERT [dbo].[orders] ([id], [user_id], [amount], [payment_id], [status], [shipping_email], [shipping_phone], [shipping_name], [shipping_address], [create_date], [update_date]) VALUES (10, NULL, 17400000, 2, NULL, N'huynhkimtri.fuhcm@gmail.com', N'+84332149696', N'Huynh Kim Tri', N'District 12', CAST(N'2020-10-14T23:10:20.890' AS DateTime), NULL)
INSERT [dbo].[orders] ([id], [user_id], [amount], [payment_id], [status], [shipping_email], [shipping_phone], [shipping_name], [shipping_address], [create_date], [update_date]) VALUES (11, NULL, 7440000, 2, NULL, N'trihk@fsoft.com.vn', N'+841632149696', N'Tri', N'Tan Binh District', CAST(N'2020-10-14T23:10:46.360' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[payments] ON 

INSERT [dbo].[payments] ([id], [type], [is_allowed]) VALUES (2, N'COD', 1)
INSERT [dbo].[payments] ([id], [type], [is_allowed]) VALUES (3, N'PAYPAL', 1)
SET IDENTITY_INSERT [dbo].[payments] OFF
GO
INSERT [dbo].[user_roles] ([id], [name], [description]) VALUES (1, N'admin', N'this role for management website')
INSERT [dbo].[user_roles] ([id], [name], [description]) VALUES (2, N'customer', N'this role for customer shoping')
GO
INSERT [dbo].[users] ([username], [password], [full_name], [email], [phone], [address], [remember_token], [is_active], [create_date], [update_date], [role_id]) VALUES (N'huynhkimtri', N'932f3c1b56257ce8539ac269d7aab42550dacf8818d075f0bdf1990562aae3ef', N'Huynh Kim Tri', NULL, N'0332149898', NULL, NULL, 1, CAST(N'2020-10-04T19:38:50.417' AS DateTime), NULL, 2)
INSERT [dbo].[users] ([username], [password], [full_name], [email], [phone], [address], [remember_token], [is_active], [create_date], [update_date], [role_id]) VALUES (N'yellow_admin', N'932f3c1b56257ce8539ac269d7aab42550dacf8818d075f0bdf1990562aae3ef', N'Yellow Shop Administrator', NULL, N'033121212', NULL, NULL, 1, CAST(N'2020-10-04T21:42:00.990' AS DateTime), NULL, 1)
GO
ALTER TABLE [dbo].[cakes]  WITH CHECK ADD  CONSTRAINT [FK_Cake_Category] FOREIGN KEY([category_id])
REFERENCES [dbo].[categories] ([id])
GO
ALTER TABLE [dbo].[cakes] CHECK CONSTRAINT [FK_Cake_Category]
GO
ALTER TABLE [dbo].[cakes]  WITH CHECK ADD  CONSTRAINT [FK_Cake_User] FOREIGN KEY([create_user])
REFERENCES [dbo].[users] ([username])
GO
ALTER TABLE [dbo].[cakes] CHECK CONSTRAINT [FK_Cake_User]
GO
ALTER TABLE [dbo].[cakes]  WITH CHECK ADD  CONSTRAINT [FK_Cake_User1] FOREIGN KEY([update_user])
REFERENCES [dbo].[users] ([username])
GO
ALTER TABLE [dbo].[cakes] CHECK CONSTRAINT [FK_Cake_User1]
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD  CONSTRAINT [FK_OrderCake_Cake] FOREIGN KEY([cake_id])
REFERENCES [dbo].[cakes] ([id])
GO
ALTER TABLE [dbo].[order_details] CHECK CONSTRAINT [FK_OrderCake_Cake]
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD  CONSTRAINT [FK_OrderCake_Order] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([id])
GO
ALTER TABLE [dbo].[order_details] CHECK CONSTRAINT [FK_OrderCake_Order]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_Order_Payment] FOREIGN KEY([payment_id])
REFERENCES [dbo].[payments] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_Order_Payment]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([username])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_user_roles] FOREIGN KEY([role_id])
REFERENCES [dbo].[user_roles] ([id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_user_roles]
GO
USE [master]
GO
ALTER DATABASE [MoonShop] SET  READ_WRITE 
GO
