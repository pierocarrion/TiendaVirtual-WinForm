USE [master]
GO
/****** Object:  Database [TiendaVirtualDB_EB]    Script Date: 27/06/2019 13:44:05 ******/
CREATE DATABASE [TiendaVirtualDB_EB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'test2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\test2.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'test2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\test2_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TiendaVirtualDB_EB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TiendaVirtualDB_EB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TiendaVirtualDB_EB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TiendaVirtualDB_EB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TiendaVirtualDB_EB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TiendaVirtualDB_EB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TiendaVirtualDB_EB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TiendaVirtualDB_EB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TiendaVirtualDB_EB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TiendaVirtualDB_EB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TiendaVirtualDB_EB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TiendaVirtualDB_EB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TiendaVirtualDB_EB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TiendaVirtualDB_EB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TiendaVirtualDB_EB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TiendaVirtualDB_EB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TiendaVirtualDB_EB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TiendaVirtualDB_EB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TiendaVirtualDB_EB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TiendaVirtualDB_EB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TiendaVirtualDB_EB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TiendaVirtualDB_EB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TiendaVirtualDB_EB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TiendaVirtualDB_EB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TiendaVirtualDB_EB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TiendaVirtualDB_EB] SET  MULTI_USER 
GO
ALTER DATABASE [TiendaVirtualDB_EB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TiendaVirtualDB_EB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TiendaVirtualDB_EB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TiendaVirtualDB_EB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TiendaVirtualDB_EB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [TiendaVirtualDB_EB]
GO
/****** Object:  Table [dbo].[tabla_Clientes]    Script Date: 27/06/2019 13:44:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tabla_Clientes](
	[dni] [varchar](10) NOT NULL,
	[nombre] [varchar](50) NULL,
	[telefono] [varchar](50) NULL,
	[direccion] [varchar](50) NULL,
	[contraseña] [varchar](50) NULL,
	[tipo] [varchar](50) NULL,
 CONSTRAINT [PK_tabla_Clientes] PRIMARY KEY CLUSTERED 
(
	[dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tabla_DetalleVenta]    Script Date: 27/06/2019 13:44:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tabla_DetalleVenta](
	[idDetalle] [int] IDENTITY(1,1) NOT NULL,
	[idVenta] [int] NULL,
	[codigoProducto] [varchar](50) NULL,
	[cantidad] [int] NULL,
	[pUnitario] [money] NULL,
	[total] [money] NULL,
 CONSTRAINT [PK_tabla_DetalleVenta] PRIMARY KEY CLUSTERED 
(
	[idDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tabla_Producto]    Script Date: 27/06/2019 13:44:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tabla_Producto](
	[codigo] [varchar](50) NOT NULL,
	[nombre] [varchar](50) NULL,
	[precio] [money] NULL,
	[stock] [int] NULL,
 CONSTRAINT [PK_tabla_Producto] PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tabla_Ventas]    Script Date: 27/06/2019 13:44:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tabla_Ventas](
	[idVenta] [int] IDENTITY(0,1) NOT NULL,
	[dniCliente] [varchar](10) NULL,
	[cantidadProductos] [int] NULL,
	[total] [money] NULL,
	[fecha] [varchar](40) NULL,
	[destinoVenta] [varchar](50) NULL,
 CONSTRAINT [PK_tabla_Ventas] PRIMARY KEY CLUSTERED 
(
	[idVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tabla_DetalleVenta]  WITH CHECK ADD  CONSTRAINT [FK_tabla_DetalleVenta_tabla_Producto] FOREIGN KEY([codigoProducto])
REFERENCES [dbo].[tabla_Producto] ([codigo])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tabla_DetalleVenta] CHECK CONSTRAINT [FK_tabla_DetalleVenta_tabla_Producto]
GO
ALTER TABLE [dbo].[tabla_Ventas]  WITH CHECK ADD  CONSTRAINT [FK_tabla_Ventas_tabla_Clientes] FOREIGN KEY([dniCliente])
REFERENCES [dbo].[tabla_Clientes] ([dni])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tabla_Ventas] CHECK CONSTRAINT [FK_tabla_Ventas_tabla_Clientes]
GO
USE [master]
GO
ALTER DATABASE [TiendaVirtualDB_EB] SET  READ_WRITE 
GO
