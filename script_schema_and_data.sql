USE [master]
GO
/****** Object:  Database [MoonShop]    Script Date: 10/5/2020 1:27:35 AM ******/
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
/****** Object:  User [admin]    Script Date: 10/5/2020 1:27:35 AM ******/
CREATE USER [admin] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[cakes]    Script Date: 10/5/2020 1:27:35 AM ******/
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
/****** Object:  Table [dbo].[categories]    Script Date: 10/5/2020 1:27:35 AM ******/
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
/****** Object:  Table [dbo].[order_details]    Script Date: 10/5/2020 1:27:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_details](
	[id] [int] NOT NULL,
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
/****** Object:  Table [dbo].[orders]    Script Date: 10/5/2020 1:27:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [varchar](32) NOT NULL,
	[amount] [int] NOT NULL,
	[payment_id] [int] NOT NULL,
	[status] [nvarchar](32) NOT NULL,
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
/****** Object:  Table [dbo].[payments]    Script Date: 10/5/2020 1:27:35 AM ******/
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
/****** Object:  Table [dbo].[user_roles]    Script Date: 10/5/2020 1:27:35 AM ******/
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
/****** Object:  Table [dbo].[users]    Script Date: 10/5/2020 1:27:35 AM ******/
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

INSERT [dbo].[cakes] ([id], [name], [image_url], [description], [price], [quantity], [category_id], [is_active], [create_date], [expiration_date], [updated_date], [create_user], [update_user]) VALUES (5, N'Bánh Trăng Vàng Hồng Ngọc An Lành cam', N'https://giaonhanh.vn/assets/uploads/2014/07/banh-trung-thu-trang-vang-hong-ngoc-vang-kinh-do1.jpg', N'Bánh trăng vàng trung thu thơm ngon chất lượng cao', 600000, 100, 12, 1, CAST(N'2020-10-04T19:38:50.417' AS DateTime), CAST(N'2020-12-04T19:38:50.417' AS DateTime), NULL, N'yellow_admin', NULL)
INSERT [dbo].[cakes] ([id], [name], [image_url], [description], [price], [quantity], [category_id], [is_active], [create_date], [expiration_date], [updated_date], [create_user], [update_user]) VALUES (6, N'Bánh Trang Vàng Hồng Ngọc An Nhiên tím', N'https://giaonhanh.vn/assets/uploads/2014/07/banh-trung-thu-trang-vang-hong-ngoc-vang-kinh-do1.jpg', N'Bánh trang vàng hồng ngọc an nhiên tím thom ngon bổ rẻ', 600000, 60, 12, 1, CAST(N'2020-10-04T19:38:50.417' AS DateTime), CAST(N'2020-11-04T19:38:50.417' AS DateTime), NULL, N'yellow_admin', NULL)
INSERT [dbo].[cakes] ([id], [name], [image_url], [description], [price], [quantity], [category_id], [is_active], [create_date], [expiration_date], [updated_date], [create_user], [update_user]) VALUES (7, N'Bánh trung thu OREO 4 bánh', N'https://giaonhanh.vn/assets/uploads/2014/07/banh-trung-thu-trang-vang-hong-ngoc-vang-kinh-do1.jpg', N'Bánh trung thu OREO 4 bánh', 600000, 60, 12, 1, CAST(N'2020-10-04T19:38:50.417' AS DateTime), CAST(N'2020-11-04T19:38:50.417' AS DateTime), NULL, N'yellow_admin', NULL)
INSERT [dbo].[cakes] ([id], [name], [image_url], [description], [price], [quantity], [category_id], [is_active], [create_date], [expiration_date], [updated_date], [create_user], [update_user]) VALUES (8, N'Bánh Hạt Sen Trà Xanh', N'https://giaonhanh.vn/assets/uploads/2014/07/banh-trung-thu-trang-vang-hong-ngoc-vang-kinh-do1.jpg', N'Bánh Hạt Sen Trà Xanh', 600000, 60, 9, 1, CAST(N'2020-10-04T19:38:50.417' AS DateTime), CAST(N'2020-12-04T19:38:50.417' AS DateTime), NULL, N'yellow_admin', NULL)
INSERT [dbo].[cakes] ([id], [name], [image_url], [description], [price], [quantity], [category_id], [is_active], [create_date], [expiration_date], [updated_date], [create_user], [update_user]) VALUES (9, N'Bánh Lạp xưởng ngủ hạt', N'https://giaonhanh.vn/assets/uploads/2014/07/banh-trung-thu-trang-vang-hong-ngoc-vang-kinh-do1.jpg', N'Bánh Lạp xưởng ngủ hạt', 120000, 60, 9, 1, CAST(N'2020-10-04T19:38:50.417' AS DateTime), CAST(N'2020-12-04T19:38:50.417' AS DateTime), NULL, N'yellow_admin', NULL)
INSERT [dbo].[cakes] ([id], [name], [image_url], [description], [price], [quantity], [category_id], [is_active], [create_date], [expiration_date], [updated_date], [create_user], [update_user]) VALUES (10, N'Bánh Trung Thu Chay Phô Mai', N'https://giaonhanh.vn/assets/uploads/2014/07/banh-trung-thu-trang-vang-hong-ngoc-vang-kinh-do1.jpg', N'Bánh Trung Thu Chay Phô Mai', 70000, 60, 13, 1, CAST(N'2020-10-04T19:38:50.417' AS DateTime), CAST(N'2020-12-04T19:38:50.417' AS DateTime), NULL, N'yellow_admin', NULL)
INSERT [dbo].[cakes] ([id], [name], [image_url], [description], [price], [quantity], [category_id], [is_active], [create_date], [expiration_date], [updated_date], [create_user], [update_user]) VALUES (11, N'Bánh Dẻo đậu xanh hạt dưa (1 trứng)', N'https://giaonhanh.vn/assets/uploads/2014/07/banh-trung-thu-trang-vang-hong-ngoc-vang-kinh-do1.jpg', N'Bánh Dẻo đậu xanh hạt dưa (1 trứng)', 75000, 60, 6, 1, CAST(N'2020-10-04T19:38:50.417' AS DateTime), CAST(N'2020-12-04T19:38:50.417' AS DateTime), NULL, N'yellow_admin', NULL)
INSERT [dbo].[cakes] ([id], [name], [image_url], [description], [price], [quantity], [category_id], [is_active], [create_date], [expiration_date], [updated_date], [create_user], [update_user]) VALUES (12, N'Bánh Dẻo sầu riêng hạt sen (0 trứng)', N'https://giaonhanh.vn/assets/uploads/2014/07/banh-trung-thu-trang-vang-hong-ngoc-vang-kinh-do1.jpg', N'Bánh Dẻo sầu riêng hạt sen (0 trứng)', 68000, 60, 6, 1, CAST(N'2020-10-04T19:38:50.417' AS DateTime), CAST(N'2020-12-04T19:38:50.417' AS DateTime), NULL, N'yellow_admin', NULL)
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
