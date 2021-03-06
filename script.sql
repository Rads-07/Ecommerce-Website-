USE [master]
GO
/****** Object:  Database [E -Commerce website ]    Script Date: 01-03-2021 23:39:58 ******/
CREATE DATABASE [E -Commerce website ]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'E -Commerce website', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\E -Commerce website .mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'E -Commerce website _log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\E -Commerce website _log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [E -Commerce website ] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [E -Commerce website ].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [E -Commerce website ] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [E -Commerce website ] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [E -Commerce website ] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [E -Commerce website ] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [E -Commerce website ] SET ARITHABORT OFF 
GO
ALTER DATABASE [E -Commerce website ] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [E -Commerce website ] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [E -Commerce website ] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [E -Commerce website ] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [E -Commerce website ] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [E -Commerce website ] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [E -Commerce website ] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [E -Commerce website ] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [E -Commerce website ] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [E -Commerce website ] SET  DISABLE_BROKER 
GO
ALTER DATABASE [E -Commerce website ] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [E -Commerce website ] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [E -Commerce website ] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [E -Commerce website ] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [E -Commerce website ] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [E -Commerce website ] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [E -Commerce website ] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [E -Commerce website ] SET RECOVERY FULL 
GO
ALTER DATABASE [E -Commerce website ] SET  MULTI_USER 
GO
ALTER DATABASE [E -Commerce website ] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [E -Commerce website ] SET DB_CHAINING OFF 
GO
ALTER DATABASE [E -Commerce website ] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [E -Commerce website ] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [E -Commerce website ] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [E -Commerce website ] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'E -Commerce website ', N'ON'
GO
ALTER DATABASE [E -Commerce website ] SET QUERY_STORE = OFF
GO
USE [E -Commerce website ]
GO
/****** Object:  Table [dbo].[address]    Script Date: 01-03-2021 23:39:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[address](
	[address_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[full_name] [varchar](50) NOT NULL,
	[address] [varchar](50) NOT NULL,
	[postcode] [varchar](10) NOT NULL,
	[city] [varchar](100) NOT NULL,
	[state] [varchar](50) NOT NULL,
	[country] [varchar](100) NOT NULL,
	[mobile_no] [varchar](10) NOT NULL,
	[is_permanent] [varchar](5) NULL,
 CONSTRAINT [PK_address] PRIMARY KEY CLUSTERED 
(
	[address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cart items]    Script Date: 01-03-2021 23:39:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart items](
	[cart_item_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[product_details_id] [int] NULL,
	[saved] [nvarchar](5) NULL,
	[quantity] [int] NULL,
	[added_date] [datetime] NULL,
	[purchased] [nchar](10) NULL,
	[product_id] [int] NULL,
 CONSTRAINT [PK_cart items] PRIMARY KEY CLUSTERED 
(
	[cart_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 01-03-2021 23:39:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](50) NULL,
	[category_image] [nvarchar](52) NULL,
	[category_description] [nvarchar](max) NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[discount]    Script Date: 01-03-2021 23:39:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[discount](
	[discount_id] [int] IDENTITY(1,1) NOT NULL,
	[full_name] [varchar](100) NULL,
	[discount] [float] NULL,
	[type] [int] NULL,
	[date_of_creation] [datetime] NULL,
	[valid_till_date] [datetime] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_discount] PRIMARY KEY CLUSTERED 
(
	[discount_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order details]    Script Date: 01-03-2021 23:39:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order details](
	[order_details_id] [int] IDENTITY(1,1) NOT NULL,
	[product_detail_id] [int] NULL,
	[order_id] [int] NULL,
	[product_price] [float] NULL,
	[product_quantity] [int] NULL,
	[subtotal] [float] NULL,
 CONSTRAINT [PK_order details] PRIMARY KEY CLUSTERED 
(
	[order_details_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 01-03-2021 23:39:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[order_no] [int] NOT NULL,
	[user_id] [int] NULL,
	[address_id] [int] NULL,
	[discount_id] [int] NULL,
	[order_date] [datetime] NULL,
	[shipping_date] [datetime] NULL,
	[stage_of_order] [nvarchar](100) NULL,
	[total_amount] [int] NULL,
	[is_delivered] [nvarchar](50) NULL,
	[is_payment] [nchar](10) NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payment]    Script Date: 01-03-2021 23:39:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payment](
	[payment_id] [int] IDENTITY(1,1) NOT NULL,
	[payment_mode] [nvarchar](50) NULL,
	[payment_date] [datetime] NULL,
	[user_id] [int] NULL,
	[amount] [float] NULL,
	[cart_item_id] [int] NULL,
 CONSTRAINT [PK_payment] PRIMARY KEY CLUSTERED 
(
	[payment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 01-03-2021 23:39:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [nvarchar](50) NULL,
	[product_description] [nvarchar](50) NULL,
	[price] [int] NULL,
	[stock_available] [int] NULL,
	[image] [nvarchar](100) NULL,
	[category_id] [int] NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_details]    Script Date: 01-03-2021 23:39:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_details](
	[product_detail_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[size] [nvarchar](100) NULL,
	[color] [nvarchar](50) NULL,
	[gender] [nvarchar](10) NULL,
	[age_group] [int] NULL,
 CONSTRAINT [PK_product_details] PRIMARY KEY CLUSTERED 
(
	[product_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tags]    Script Date: 01-03-2021 23:39:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tags](
	[tag_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[tag_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_tags] PRIMARY KEY CLUSTERED 
(
	[tag_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 01-03-2021 23:39:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[email_id] [varchar](150) NOT NULL,
	[date_of_birth] [date] NOT NULL,
	[mobile_no] [varchar](15) NOT NULL,
	[password] [varchar](100) NOT NULL,
	[date_of_creation] [datetime] NOT NULL,
	[updated_date] [datetime] NULL,
	[user_type] [varchar](10) NULL,
	[deleted] [varchar](5) NULL,
	[date_for_deletion] [datetime] NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unq_users] UNIQUE NONCLUSTERED 
(
	[email_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[address]  WITH CHECK ADD  CONSTRAINT [FK_address_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[address] CHECK CONSTRAINT [FK_address_users]
GO
ALTER TABLE [dbo].[cart items]  WITH CHECK ADD  CONSTRAINT [FK_cart items_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[cart items] CHECK CONSTRAINT [FK_cart items_product]
GO
ALTER TABLE [dbo].[cart items]  WITH CHECK ADD  CONSTRAINT [FK_cart items_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[cart items] CHECK CONSTRAINT [FK_cart items_users]
GO
ALTER TABLE [dbo].[order details]  WITH CHECK ADD  CONSTRAINT [FK_order details_orders] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([order_id])
GO
ALTER TABLE [dbo].[order details] CHECK CONSTRAINT [FK_order details_orders]
GO
ALTER TABLE [dbo].[order details]  WITH CHECK ADD  CONSTRAINT [FK_order details_product_details] FOREIGN KEY([product_detail_id])
REFERENCES [dbo].[product_details] ([product_detail_id])
GO
ALTER TABLE [dbo].[order details] CHECK CONSTRAINT [FK_order details_product_details]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_address] FOREIGN KEY([address_id])
REFERENCES [dbo].[address] ([address_id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_address]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_discount] FOREIGN KEY([discount_id])
REFERENCES [dbo].[discount] ([discount_id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_discount]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_users]
GO
ALTER TABLE [dbo].[payment]  WITH CHECK ADD  CONSTRAINT [FK_payment_cart items] FOREIGN KEY([cart_item_id])
REFERENCES [dbo].[cart items] ([cart_item_id])
GO
ALTER TABLE [dbo].[payment] CHECK CONSTRAINT [FK_payment_cart items]
GO
ALTER TABLE [dbo].[payment]  WITH CHECK ADD  CONSTRAINT [FK_payment_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[payment] CHECK CONSTRAINT [FK_payment_users]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_category] FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([category_id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_category]
GO
ALTER TABLE [dbo].[product_details]  WITH CHECK ADD  CONSTRAINT [FK_product_details_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[product_details] CHECK CONSTRAINT [FK_product_details_product]
GO
ALTER TABLE [dbo].[tags]  WITH CHECK ADD  CONSTRAINT [FK_tags_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[tags] CHECK CONSTRAINT [FK_tags_product]
GO
/****** Object:  StoredProcedure [dbo].[apply_filter]    Script Date: 01-03-2021 23:39:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*to apply filter*/
create procedure [dbo].[apply_filter](@product_id int,@color nvarchar(50), 
@gender nvarchar(50), @size nvarchar(100), @age_group int  ) as
begin
	select * from product 
	where product_id in 
    (select product_id 
	from product_details 
	where color=@color and size=@size and gender=@gender and age_group=@age_group 
	)
end




 
GO
/****** Object:  StoredProcedure [dbo].[view_cart_items]    Script Date: 01-03-2021 23:39:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*to get cart items */
create procedure [dbo].[view_cart_items](@user_id int) as  
begin 
	select * from product where product_id in(
        select product_id from [dbo].[cart items] where (cart_item_id in (
            select cart_item_id from users where user_id =@user_id
        ))
	)
end 
GO
/****** Object:  StoredProcedure [dbo].[view_order_history]    Script Date: 01-03-2021 23:39:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 
/*to view order history*/
create procedure [dbo].[view_order_history](@user_id int) as
begin
 select product_id, quantity 
 from [dbo].[cart items]
 where (purchased='YES' and cart_item_id in (select cart_item_id from users where user_id=user_id))
end
GO
USE [master]
GO
ALTER DATABASE [E -Commerce website ] SET  READ_WRITE 
GO
