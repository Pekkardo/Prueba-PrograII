USE [master]
GO
/****** Object:  Database [Carpinteria_2023]    Script Date: 22/8/2023 18:27:28 ******/
CREATE DATABASE [Carpinteria_2023]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Carpinteria_2023', FILENAME = N'F:\SQLServer\MSSQL14.MSSQLSERVER\MSSQL\DATA\Carpinteria_2023.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'Carpinteria_2023_log', FILENAME = N'F:\SQLServer\MSSQL14.MSSQLSERVER\MSSQL\DATA\Carpinteria_2023_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Carpinteria_2023] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Carpinteria_2023].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Carpinteria_2023] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Carpinteria_2023] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Carpinteria_2023] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Carpinteria_2023] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Carpinteria_2023] SET ARITHABORT OFF 
GO
ALTER DATABASE [Carpinteria_2023] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Carpinteria_2023] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Carpinteria_2023] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Carpinteria_2023] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Carpinteria_2023] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Carpinteria_2023] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Carpinteria_2023] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Carpinteria_2023] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Carpinteria_2023] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Carpinteria_2023] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Carpinteria_2023] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Carpinteria_2023] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Carpinteria_2023] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Carpinteria_2023] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Carpinteria_2023] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Carpinteria_2023] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Carpinteria_2023] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Carpinteria_2023] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Carpinteria_2023] SET  MULTI_USER 
GO
ALTER DATABASE [Carpinteria_2023] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Carpinteria_2023] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Carpinteria_2023] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Carpinteria_2023] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Carpinteria_2023] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Carpinteria_2023] SET QUERY_STORE = OFF
GO
USE [Carpinteria_2023]
GO
/****** Object:  User [docentes22]    Script Date: 22/8/2023 18:27:28 ******/
CREATE USER [docentes22] FOR LOGIN [docentes22] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[T_DETALLES_PRESUPUESTO]    Script Date: 22/8/2023 18:27:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_DETALLES_PRESUPUESTO](
	[presupuesto_nro] [int] NOT NULL,
	[detalle_nro] [int] NOT NULL,
	[id_producto] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[presupuesto_nro] ASC,
	[detalle_nro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_PRESUPUESTOS]    Script Date: 22/8/2023 18:27:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_PRESUPUESTOS](
	[presupuesto_nro] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NOT NULL,
	[cliente] [varchar](255) NULL,
	[descuento] [numeric](5, 2) NULL,
	[fecha_baja] [date] NULL,
	[total] [numeric](8, 2) NOT NULL,
 CONSTRAINT [PK__T_PRESUP__33BEB70E03317E3D] PRIMARY KEY CLUSTERED 
(
	[presupuesto_nro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_PRODUCTOS]    Script Date: 22/8/2023 18:27:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_PRODUCTOS](
	[id_producto] [int] IDENTITY(1,1) NOT NULL,
	[n_producto] [varchar](255) NOT NULL,
	[precio] [numeric](8, 2) NOT NULL,
	[activo] [varchar](1) NOT NULL,
 CONSTRAINT [PK__T_PRODUC__FF341C0D7F60ED59] PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[T_DETALLES_PRESUPUESTO] ([presupuesto_nro], [detalle_nro], [id_producto], [cantidad]) VALUES (2, 0, 1, 1)
INSERT [dbo].[T_DETALLES_PRESUPUESTO] ([presupuesto_nro], [detalle_nro], [id_producto], [cantidad]) VALUES (3, 1, 1, 1)
INSERT [dbo].[T_DETALLES_PRESUPUESTO] ([presupuesto_nro], [detalle_nro], [id_producto], [cantidad]) VALUES (3, 2, 2, 1)
INSERT [dbo].[T_DETALLES_PRESUPUESTO] ([presupuesto_nro], [detalle_nro], [id_producto], [cantidad]) VALUES (4, 1, 2, 1)
GO
SET IDENTITY_INSERT [dbo].[T_PRESUPUESTOS] ON 

INSERT [dbo].[T_PRESUPUESTOS] ([presupuesto_nro], [fecha], [cliente], [descuento], [fecha_baja], [total]) VALUES (2, CAST(N'2021-05-11' AS Date), N'CONSUMIDOR FINAL', CAST(0.00 AS Numeric(5, 2)), NULL, CAST(11000.00 AS Numeric(8, 2)))
INSERT [dbo].[T_PRESUPUESTOS] ([presupuesto_nro], [fecha], [cliente], [descuento], [fecha_baja], [total]) VALUES (3, CAST(N'2021-05-11' AS Date), N'CONSUMIDOR FINAL', CAST(0.00 AS Numeric(5, 2)), NULL, CAST(24700.00 AS Numeric(8, 2)))
INSERT [dbo].[T_PRESUPUESTOS] ([presupuesto_nro], [fecha], [cliente], [descuento], [fecha_baja], [total]) VALUES (4, CAST(N'2021-05-28' AS Date), N'CONSUMIDOR FINAL', CAST(10.00 AS Numeric(5, 2)), NULL, CAST(12330.00 AS Numeric(8, 2)))
SET IDENTITY_INSERT [dbo].[T_PRESUPUESTOS] OFF
GO
SET IDENTITY_INSERT [dbo].[T_PRODUCTOS] ON 

INSERT [dbo].[T_PRODUCTOS] ([id_producto], [n_producto], [precio], [activo]) VALUES (1, N'VENTANA CORREDIZA', CAST(11000.00 AS Numeric(8, 2)), N'S')
INSERT [dbo].[T_PRODUCTOS] ([id_producto], [n_producto], [precio], [activo]) VALUES (2, N'PUERTA 1 HOJA', CAST(13700.00 AS Numeric(8, 2)), N'S')
INSERT [dbo].[T_PRODUCTOS] ([id_producto], [n_producto], [precio], [activo]) VALUES (3, N'PUERTA 2 HOJAS', CAST(20000.00 AS Numeric(8, 2)), N'N')
SET IDENTITY_INSERT [dbo].[T_PRODUCTOS] OFF
GO
ALTER TABLE [dbo].[T_DETALLES_PRESUPUESTO]  WITH CHECK ADD  CONSTRAINT [fk_presupuesto] FOREIGN KEY([presupuesto_nro])
REFERENCES [dbo].[T_PRESUPUESTOS] ([presupuesto_nro])
GO
ALTER TABLE [dbo].[T_DETALLES_PRESUPUESTO] CHECK CONSTRAINT [fk_presupuesto]
GO
ALTER TABLE [dbo].[T_DETALLES_PRESUPUESTO]  WITH CHECK ADD  CONSTRAINT [fk_producto] FOREIGN KEY([id_producto])
REFERENCES [dbo].[T_PRODUCTOS] ([id_producto])
GO
ALTER TABLE [dbo].[T_DETALLES_PRESUPUESTO] CHECK CONSTRAINT [fk_producto]
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_PROD]    Script Date: 22/8/2023 18:27:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_CONSULTAR_PROD]
AS
BEGIN
		select * from T_PRODUCTOS
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_PRODUCTOS]    Script Date: 22/8/2023 18:27:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CONSULTAR_PRODUCTOS]
AS
BEGIN
	
	SELECT * from T_PRODUCTOS;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTAR_DETALLE]    Script Date: 22/8/2023 18:27:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_INSERTAR_DETALLE] 
	@presupuesto_nro int,
	@detalle int, 
	@id_producto int, 
	@cantidad int
AS
BEGIN
	INSERT INTO T_DETALLES_PRESUPUESTO(presupuesto_nro,detalle_nro, id_producto, cantidad)
    VALUES (@presupuesto_nro, @detalle, @id_producto, @cantidad);
  
END
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTAR_MAESTRO]    Script Date: 22/8/2023 18:27:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_INSERTAR_MAESTRO] 
	@cliente varchar(255), 
	@dto numeric(5,2),
	@total numeric(8,2),
	@presupuesto_nro int OUTPUT
AS
BEGIN
	INSERT INTO T_PRESUPUESTOS(fecha, cliente, descuento, total)
    VALUES (GETDATE(), @cliente, @dto, @total);
    --Asignamos el valor del último ID autogenerado (obtenido --  
    --mediante la función SCOPE_IDENTITY() de SQLServer)	
    SET @presupuesto_nro = SCOPE_IDENTITY();

END
GO
/****** Object:  StoredProcedure [dbo].[SP_PROXIMO_ID]    Script Date: 22/8/2023 18:27:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_PROXIMO_ID]
@next int OUTPUT
AS
BEGIN
	SET @next = (SELECT MAX(presupuesto_nro)+1  FROM T_PRESUPUESTOS);
END
GO
USE [master]
GO
ALTER DATABASE [Carpinteria_2023] SET  READ_WRITE 
GO
