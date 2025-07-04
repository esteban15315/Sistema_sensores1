USE [master]
GO
/****** Object:  Database [SistemaSensores]    Script Date: 26/06/2025 12:08:35 ******/
CREATE DATABASE [SistemaSensores]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SistemaSensores', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SistemaSensores.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SistemaSensores_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SistemaSensores_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SistemaSensores] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SistemaSensores].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SistemaSensores] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SistemaSensores] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SistemaSensores] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SistemaSensores] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SistemaSensores] SET ARITHABORT OFF 
GO
ALTER DATABASE [SistemaSensores] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SistemaSensores] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SistemaSensores] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SistemaSensores] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SistemaSensores] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SistemaSensores] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SistemaSensores] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SistemaSensores] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SistemaSensores] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SistemaSensores] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SistemaSensores] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SistemaSensores] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SistemaSensores] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SistemaSensores] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SistemaSensores] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SistemaSensores] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SistemaSensores] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SistemaSensores] SET RECOVERY FULL 
GO
ALTER DATABASE [SistemaSensores] SET  MULTI_USER 
GO
ALTER DATABASE [SistemaSensores] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SistemaSensores] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SistemaSensores] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SistemaSensores] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SistemaSensores] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SistemaSensores] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SistemaSensores', N'ON'
GO
ALTER DATABASE [SistemaSensores] SET QUERY_STORE = ON
GO
ALTER DATABASE [SistemaSensores] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SistemaSensores]
GO
/****** Object:  Table [dbo].[actualizaciones_sensores]    Script Date: 26/06/2025 12:08:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[actualizaciones_sensores](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[num_sensor] [int] NOT NULL,
	[descripcion] [varchar](200) NOT NULL,
	[estado] [varchar](50) NOT NULL,
	[fecha_actualizacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[parametros_alertas]    Script Date: 26/06/2025 12:08:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[parametros_alertas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ph_max] [decimal](5, 2) NOT NULL,
	[ph_min] [decimal](5, 2) NOT NULL,
	[ox_max] [decimal](5, 2) NOT NULL,
	[ox_min] [decimal](5, 2) NOT NULL,
	[temp_max] [decimal](5, 2) NOT NULL,
	[temp_min] [decimal](5, 2) NOT NULL,
	[turb_max] [decimal](5, 2) NOT NULL,
	[turb_min] [decimal](5, 2) NOT NULL,
	[nivel_alerta] [varchar](20) NOT NULL,
	[fecha_actualizacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sensores]    Script Date: 26/06/2025 12:08:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sensores](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tipo_sensor] [varchar](50) NULL,
	[num_sensor] [int] NULL,
	[fecha_inicio] [float] NULL,
	[fecha_revision] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[actualizaciones_sensores] ON 

INSERT [dbo].[actualizaciones_sensores] ([id], [num_sensor], [descripcion], [estado], [fecha_actualizacion]) VALUES (4, 123456, N'', N'Activo', CAST(N'2025-06-12T17:46:09.083' AS DateTime))
INSERT [dbo].[actualizaciones_sensores] ([id], [num_sensor], [descripcion], [estado], [fecha_actualizacion]) VALUES (5, 123456, N'18/06/2025', N'Activo', CAST(N'2025-06-12T18:00:46.027' AS DateTime))
INSERT [dbo].[actualizaciones_sensores] ([id], [num_sensor], [descripcion], [estado], [fecha_actualizacion]) VALUES (6, 129529, N'01/06/2025', N'Activo', CAST(N'2025-06-19T00:07:04.100' AS DateTime))
INSERT [dbo].[actualizaciones_sensores] ([id], [num_sensor], [descripcion], [estado], [fecha_actualizacion]) VALUES (7, 129529, N'01/06/2025', N'Activo', CAST(N'2025-06-19T00:08:15.217' AS DateTime))
INSERT [dbo].[actualizaciones_sensores] ([id], [num_sensor], [descripcion], [estado], [fecha_actualizacion]) VALUES (8, 1563, N'15/03/39', N'Activo', CAST(N'2025-06-19T01:29:15.303' AS DateTime))
INSERT [dbo].[actualizaciones_sensores] ([id], [num_sensor], [descripcion], [estado], [fecha_actualizacion]) VALUES (9, 764, N'', N'Activo', CAST(N'2025-06-19T11:33:17.527' AS DateTime))
INSERT [dbo].[actualizaciones_sensores] ([id], [num_sensor], [descripcion], [estado], [fecha_actualizacion]) VALUES (1006, 156, N'', N'Activo', CAST(N'2025-06-25T01:22:41.723' AS DateTime))
INSERT [dbo].[actualizaciones_sensores] ([id], [num_sensor], [descripcion], [estado], [fecha_actualizacion]) VALUES (1007, 156, N'12052025', N'Activo', CAST(N'2025-06-25T01:22:59.050' AS DateTime))
INSERT [dbo].[actualizaciones_sensores] ([id], [num_sensor], [descripcion], [estado], [fecha_actualizacion]) VALUES (1008, 1563, N'12052025', N'Activo', CAST(N'2025-06-25T01:23:09.530' AS DateTime))
INSERT [dbo].[actualizaciones_sensores] ([id], [num_sensor], [descripcion], [estado], [fecha_actualizacion]) VALUES (1009, 123456, N'12052025', N'Activo', CAST(N'2025-06-25T01:23:18.620' AS DateTime))
INSERT [dbo].[actualizaciones_sensores] ([id], [num_sensor], [descripcion], [estado], [fecha_actualizacion]) VALUES (1010, 156, N'01082025', N'Activo', CAST(N'2025-06-25T01:23:27.843' AS DateTime))
INSERT [dbo].[actualizaciones_sensores] ([id], [num_sensor], [descripcion], [estado], [fecha_actualizacion]) VALUES (1011, 129529, N'06092025', N'Activo', CAST(N'2025-06-25T01:23:49.867' AS DateTime))
INSERT [dbo].[actualizaciones_sensores] ([id], [num_sensor], [descripcion], [estado], [fecha_actualizacion]) VALUES (1012, 151, N'01092025', N'Activo', CAST(N'2025-06-25T01:24:09.033' AS DateTime))
INSERT [dbo].[actualizaciones_sensores] ([id], [num_sensor], [descripcion], [estado], [fecha_actualizacion]) VALUES (1013, 151, N'02092025', N'Activo', CAST(N'2025-06-25T01:24:14.540' AS DateTime))
INSERT [dbo].[actualizaciones_sensores] ([id], [num_sensor], [descripcion], [estado], [fecha_actualizacion]) VALUES (1016, 1492, N'02092025', N'Activo', CAST(N'2025-06-25T01:25:04.840' AS DateTime))
INSERT [dbo].[actualizaciones_sensores] ([id], [num_sensor], [descripcion], [estado], [fecha_actualizacion]) VALUES (1017, 764, N'02092025', N'Activo', CAST(N'2025-06-25T01:25:10.920' AS DateTime))
INSERT [dbo].[actualizaciones_sensores] ([id], [num_sensor], [descripcion], [estado], [fecha_actualizacion]) VALUES (1018, 85, N'02092025', N'Activo', CAST(N'2025-06-25T01:25:19.113' AS DateTime))
INSERT [dbo].[actualizaciones_sensores] ([id], [num_sensor], [descripcion], [estado], [fecha_actualizacion]) VALUES (1019, 111, N'02092025', N'Activo', CAST(N'2025-06-25T01:25:22.553' AS DateTime))
INSERT [dbo].[actualizaciones_sensores] ([id], [num_sensor], [descripcion], [estado], [fecha_actualizacion]) VALUES (1020, 114, N'02092025', N'Activo', CAST(N'2025-06-25T01:25:25.010' AS DateTime))
INSERT [dbo].[actualizaciones_sensores] ([id], [num_sensor], [descripcion], [estado], [fecha_actualizacion]) VALUES (1021, 789, N'', N'Activo', CAST(N'2025-06-25T23:23:42.673' AS DateTime))
INSERT [dbo].[actualizaciones_sensores] ([id], [num_sensor], [descripcion], [estado], [fecha_actualizacion]) VALUES (1022, 789, N'04/07/2025', N'Activo', CAST(N'2025-06-25T23:24:16.737' AS DateTime))
INSERT [dbo].[actualizaciones_sensores] ([id], [num_sensor], [descripcion], [estado], [fecha_actualizacion]) VALUES (1023, 4564, N'18/02/2026', N'Activo', CAST(N'2025-06-25T23:28:25.047' AS DateTime))
SET IDENTITY_INSERT [dbo].[actualizaciones_sensores] OFF
GO
SET IDENTITY_INSERT [dbo].[parametros_alertas] ON 

INSERT [dbo].[parametros_alertas] ([id], [ph_max], [ph_min], [ox_max], [ox_min], [temp_max], [temp_min], [turb_max], [turb_min], [nivel_alerta], [fecha_actualizacion]) VALUES (2, CAST(20.00 AS Decimal(5, 2)), CAST(12.00 AS Decimal(5, 2)), CAST(40.00 AS Decimal(5, 2)), CAST(12.00 AS Decimal(5, 2)), CAST(30.00 AS Decimal(5, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(32.00 AS Decimal(5, 2)), CAST(15.00 AS Decimal(5, 2)), N'Alerta Crítica', CAST(N'2025-06-12T18:03:23.243' AS DateTime))
INSERT [dbo].[parametros_alertas] ([id], [ph_max], [ph_min], [ox_max], [ox_min], [temp_max], [temp_min], [turb_max], [turb_min], [nivel_alerta], [fecha_actualizacion]) VALUES (3, CAST(44.00 AS Decimal(5, 2)), CAST(23.00 AS Decimal(5, 2)), CAST(22.00 AS Decimal(5, 2)), CAST(20.00 AS Decimal(5, 2)), CAST(35.00 AS Decimal(5, 2)), CAST(12.00 AS Decimal(5, 2)), CAST(45.00 AS Decimal(5, 2)), CAST(20.00 AS Decimal(5, 2)), N'Alerta Moderada', CAST(N'2025-06-19T00:03:07.627' AS DateTime))
INSERT [dbo].[parametros_alertas] ([id], [ph_max], [ph_min], [ox_max], [ox_min], [temp_max], [temp_min], [turb_max], [turb_min], [nivel_alerta], [fecha_actualizacion]) VALUES (4, CAST(25.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)), CAST(22.00 AS Decimal(5, 2)), CAST(13.00 AS Decimal(5, 2)), CAST(42.00 AS Decimal(5, 2)), CAST(30.00 AS Decimal(5, 2)), CAST(48.00 AS Decimal(5, 2)), CAST(11.00 AS Decimal(5, 2)), N'Alerta Crítica', CAST(N'2025-06-19T00:16:15.940' AS DateTime))
INSERT [dbo].[parametros_alertas] ([id], [ph_max], [ph_min], [ox_max], [ox_min], [temp_max], [temp_min], [turb_max], [turb_min], [nivel_alerta], [fecha_actualizacion]) VALUES (5, CAST(8.00 AS Decimal(5, 2)), CAST(6.00 AS Decimal(5, 2)), CAST(8.00 AS Decimal(5, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(35.00 AS Decimal(5, 2)), CAST(18.00 AS Decimal(5, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), N'Alerta Crítica', CAST(N'2025-06-19T11:32:54.803' AS DateTime))
INSERT [dbo].[parametros_alertas] ([id], [ph_max], [ph_min], [ox_max], [ox_min], [temp_max], [temp_min], [turb_max], [turb_min], [nivel_alerta], [fecha_actualizacion]) VALUES (1003, CAST(22.00 AS Decimal(5, 2)), CAST(11.00 AS Decimal(5, 2)), CAST(8.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)), CAST(26.00 AS Decimal(5, 2)), CAST(14.00 AS Decimal(5, 2)), CAST(13.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)), N'Alerta Moderada', CAST(N'2025-06-25T00:17:26.307' AS DateTime))
INSERT [dbo].[parametros_alertas] ([id], [ph_max], [ph_min], [ox_max], [ox_min], [temp_max], [temp_min], [turb_max], [turb_min], [nivel_alerta], [fecha_actualizacion]) VALUES (1004, CAST(29.00 AS Decimal(5, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(8.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)), CAST(24.00 AS Decimal(5, 2)), CAST(11.00 AS Decimal(5, 2)), CAST(13.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)), N'Alerta Crítica', CAST(N'2025-06-25T00:17:51.070' AS DateTime))
INSERT [dbo].[parametros_alertas] ([id], [ph_max], [ph_min], [ox_max], [ox_min], [temp_max], [temp_min], [turb_max], [turb_min], [nivel_alerta], [fecha_actualizacion]) VALUES (1005, CAST(33.00 AS Decimal(5, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)), CAST(22.00 AS Decimal(5, 2)), CAST(11.00 AS Decimal(5, 2)), CAST(13.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)), N'Alerta Moderada', CAST(N'2025-06-25T00:18:02.687' AS DateTime))
INSERT [dbo].[parametros_alertas] ([id], [ph_max], [ph_min], [ox_max], [ox_min], [temp_max], [temp_min], [turb_max], [turb_min], [nivel_alerta], [fecha_actualizacion]) VALUES (1006, CAST(22.00 AS Decimal(5, 2)), CAST(12.00 AS Decimal(5, 2)), CAST(12.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)), CAST(24.00 AS Decimal(5, 2)), CAST(12.00 AS Decimal(5, 2)), CAST(45.00 AS Decimal(5, 2)), CAST(23.00 AS Decimal(5, 2)), N'Alerta Moderada', CAST(N'2025-06-25T01:18:42.053' AS DateTime))
INSERT [dbo].[parametros_alertas] ([id], [ph_max], [ph_min], [ox_max], [ox_min], [temp_max], [temp_min], [turb_max], [turb_min], [nivel_alerta], [fecha_actualizacion]) VALUES (1007, CAST(22.00 AS Decimal(5, 2)), CAST(12.00 AS Decimal(5, 2)), CAST(11.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)), CAST(24.00 AS Decimal(5, 2)), CAST(12.00 AS Decimal(5, 2)), CAST(40.00 AS Decimal(5, 2)), CAST(23.00 AS Decimal(5, 2)), N'Alerta Moderada', CAST(N'2025-06-25T01:18:47.237' AS DateTime))
INSERT [dbo].[parametros_alertas] ([id], [ph_max], [ph_min], [ox_max], [ox_min], [temp_max], [temp_min], [turb_max], [turb_min], [nivel_alerta], [fecha_actualizacion]) VALUES (1008, CAST(25.00 AS Decimal(5, 2)), CAST(11.00 AS Decimal(5, 2)), CAST(11.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)), CAST(24.00 AS Decimal(5, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(40.00 AS Decimal(5, 2)), CAST(23.00 AS Decimal(5, 2)), N'Alerta Crítica', CAST(N'2025-06-25T01:18:54.540' AS DateTime))
INSERT [dbo].[parametros_alertas] ([id], [ph_max], [ph_min], [ox_max], [ox_min], [temp_max], [temp_min], [turb_max], [turb_min], [nivel_alerta], [fecha_actualizacion]) VALUES (1009, CAST(25.00 AS Decimal(5, 2)), CAST(12.00 AS Decimal(5, 2)), CAST(11.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)), CAST(24.00 AS Decimal(5, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(40.00 AS Decimal(5, 2)), CAST(23.00 AS Decimal(5, 2)), N'Alerta Moderada', CAST(N'2025-06-25T01:19:03.000' AS DateTime))
INSERT [dbo].[parametros_alertas] ([id], [ph_max], [ph_min], [ox_max], [ox_min], [temp_max], [temp_min], [turb_max], [turb_min], [nivel_alerta], [fecha_actualizacion]) VALUES (1010, CAST(25.00 AS Decimal(5, 2)), CAST(12.00 AS Decimal(5, 2)), CAST(11.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)), CAST(24.00 AS Decimal(5, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(35.00 AS Decimal(5, 2)), CAST(18.00 AS Decimal(5, 2)), N'Alerta Crítica', CAST(N'2025-06-25T01:19:08.147' AS DateTime))
INSERT [dbo].[parametros_alertas] ([id], [ph_max], [ph_min], [ox_max], [ox_min], [temp_max], [temp_min], [turb_max], [turb_min], [nivel_alerta], [fecha_actualizacion]) VALUES (1011, CAST(25.00 AS Decimal(5, 2)), CAST(12.00 AS Decimal(5, 2)), CAST(11.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)), CAST(24.00 AS Decimal(5, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(35.00 AS Decimal(5, 2)), CAST(18.00 AS Decimal(5, 2)), N'Alerta Crítica', CAST(N'2025-06-25T01:19:12.347' AS DateTime))
INSERT [dbo].[parametros_alertas] ([id], [ph_max], [ph_min], [ox_max], [ox_min], [temp_max], [temp_min], [turb_max], [turb_min], [nivel_alerta], [fecha_actualizacion]) VALUES (1012, CAST(25.00 AS Decimal(5, 2)), CAST(12.00 AS Decimal(5, 2)), CAST(21.00 AS Decimal(5, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(24.00 AS Decimal(5, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(35.00 AS Decimal(5, 2)), CAST(18.00 AS Decimal(5, 2)), N'Alerta Moderada', CAST(N'2025-06-25T01:19:20.690' AS DateTime))
INSERT [dbo].[parametros_alertas] ([id], [ph_max], [ph_min], [ox_max], [ox_min], [temp_max], [temp_min], [turb_max], [turb_min], [nivel_alerta], [fecha_actualizacion]) VALUES (1013, CAST(24.00 AS Decimal(5, 2)), CAST(13.00 AS Decimal(5, 2)), CAST(25.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)), CAST(23.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)), CAST(12.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)), N'Alerta Crítica', CAST(N'2025-06-25T01:19:59.847' AS DateTime))
INSERT [dbo].[parametros_alertas] ([id], [ph_max], [ph_min], [ox_max], [ox_min], [temp_max], [temp_min], [turb_max], [turb_min], [nivel_alerta], [fecha_actualizacion]) VALUES (1014, CAST(24.00 AS Decimal(5, 2)), CAST(11.00 AS Decimal(5, 2)), CAST(25.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)), CAST(23.00 AS Decimal(5, 2)), CAST(14.00 AS Decimal(5, 2)), CAST(12.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)), N'Alerta Crítica', CAST(N'2025-06-25T01:20:07.503' AS DateTime))
INSERT [dbo].[parametros_alertas] ([id], [ph_max], [ph_min], [ox_max], [ox_min], [temp_max], [temp_min], [turb_max], [turb_min], [nivel_alerta], [fecha_actualizacion]) VALUES (1015, CAST(24.00 AS Decimal(5, 2)), CAST(11.00 AS Decimal(5, 2)), CAST(25.00 AS Decimal(5, 2)), CAST(6.00 AS Decimal(5, 2)), CAST(23.00 AS Decimal(5, 2)), CAST(14.00 AS Decimal(5, 2)), CAST(12.00 AS Decimal(5, 2)), CAST(2.00 AS Decimal(5, 2)), N'Alerta Crítica', CAST(N'2025-06-25T01:20:11.940' AS DateTime))
INSERT [dbo].[parametros_alertas] ([id], [ph_max], [ph_min], [ox_max], [ox_min], [temp_max], [temp_min], [turb_max], [turb_min], [nivel_alerta], [fecha_actualizacion]) VALUES (1016, CAST(24.00 AS Decimal(5, 2)), CAST(12.00 AS Decimal(5, 2)), CAST(26.00 AS Decimal(5, 2)), CAST(3.00 AS Decimal(5, 2)), CAST(23.00 AS Decimal(5, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(12.00 AS Decimal(5, 2)), CAST(2.00 AS Decimal(5, 2)), N'Alerta Crítica', CAST(N'2025-06-25T01:20:21.590' AS DateTime))
INSERT [dbo].[parametros_alertas] ([id], [ph_max], [ph_min], [ox_max], [ox_min], [temp_max], [temp_min], [turb_max], [turb_min], [nivel_alerta], [fecha_actualizacion]) VALUES (1017, CAST(24.00 AS Decimal(5, 2)), CAST(12.00 AS Decimal(5, 2)), CAST(26.00 AS Decimal(5, 2)), CAST(3.00 AS Decimal(5, 2)), CAST(23.00 AS Decimal(5, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(12.00 AS Decimal(5, 2)), CAST(3.00 AS Decimal(5, 2)), N'Alerta Crítica', CAST(N'2025-06-25T01:20:25.290' AS DateTime))
INSERT [dbo].[parametros_alertas] ([id], [ph_max], [ph_min], [ox_max], [ox_min], [temp_max], [temp_min], [turb_max], [turb_min], [nivel_alerta], [fecha_actualizacion]) VALUES (1018, CAST(24.00 AS Decimal(5, 2)), CAST(11.00 AS Decimal(5, 2)), CAST(26.00 AS Decimal(5, 2)), CAST(3.00 AS Decimal(5, 2)), CAST(23.00 AS Decimal(5, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(12.00 AS Decimal(5, 2)), CAST(3.00 AS Decimal(5, 2)), N'Alerta Moderada', CAST(N'2025-06-25T01:20:28.453' AS DateTime))
INSERT [dbo].[parametros_alertas] ([id], [ph_max], [ph_min], [ox_max], [ox_min], [temp_max], [temp_min], [turb_max], [turb_min], [nivel_alerta], [fecha_actualizacion]) VALUES (1019, CAST(25.00 AS Decimal(5, 2)), CAST(11.00 AS Decimal(5, 2)), CAST(25.00 AS Decimal(5, 2)), CAST(3.00 AS Decimal(5, 2)), CAST(23.00 AS Decimal(5, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(12.00 AS Decimal(5, 2)), CAST(3.00 AS Decimal(5, 2)), N'Alerta Moderada', CAST(N'2025-06-25T01:20:32.237' AS DateTime))
INSERT [dbo].[parametros_alertas] ([id], [ph_max], [ph_min], [ox_max], [ox_min], [temp_max], [temp_min], [turb_max], [turb_min], [nivel_alerta], [fecha_actualizacion]) VALUES (1020, CAST(25.00 AS Decimal(5, 2)), CAST(11.00 AS Decimal(5, 2)), CAST(25.00 AS Decimal(5, 2)), CAST(3.00 AS Decimal(5, 2)), CAST(24.00 AS Decimal(5, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(11.00 AS Decimal(5, 2)), CAST(3.00 AS Decimal(5, 2)), N'Alerta Crítica', CAST(N'2025-06-25T01:20:36.873' AS DateTime))
INSERT [dbo].[parametros_alertas] ([id], [ph_max], [ph_min], [ox_max], [ox_min], [temp_max], [temp_min], [turb_max], [turb_min], [nivel_alerta], [fecha_actualizacion]) VALUES (1021, CAST(25.00 AS Decimal(5, 2)), CAST(11.00 AS Decimal(5, 2)), CAST(35.00 AS Decimal(5, 2)), CAST(12.00 AS Decimal(5, 2)), CAST(27.00 AS Decimal(5, 2)), CAST(20.00 AS Decimal(5, 2)), CAST(34.00 AS Decimal(5, 2)), CAST(11.00 AS Decimal(5, 2)), N'Alerta Moderada', CAST(N'2025-06-25T23:23:13.923' AS DateTime))
INSERT [dbo].[parametros_alertas] ([id], [ph_max], [ph_min], [ox_max], [ox_min], [temp_max], [temp_min], [turb_max], [turb_min], [nivel_alerta], [fecha_actualizacion]) VALUES (1022, CAST(25.00 AS Decimal(5, 2)), CAST(11.00 AS Decimal(5, 2)), CAST(16.00 AS Decimal(5, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(36.00 AS Decimal(5, 2)), CAST(14.00 AS Decimal(5, 2)), CAST(55.00 AS Decimal(5, 2)), CAST(12.00 AS Decimal(5, 2)), N'Alerta Moderada', CAST(N'2025-06-25T23:27:33.350' AS DateTime))
INSERT [dbo].[parametros_alertas] ([id], [ph_max], [ph_min], [ox_max], [ox_min], [temp_max], [temp_min], [turb_max], [turb_min], [nivel_alerta], [fecha_actualizacion]) VALUES (1023, CAST(25.00 AS Decimal(5, 2)), CAST(11.00 AS Decimal(5, 2)), CAST(16.00 AS Decimal(5, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(36.00 AS Decimal(5, 2)), CAST(14.00 AS Decimal(5, 2)), CAST(55.00 AS Decimal(5, 2)), CAST(12.00 AS Decimal(5, 2)), N'Alerta Crítica', CAST(N'2025-06-25T23:27:37.520' AS DateTime))
INSERT [dbo].[parametros_alertas] ([id], [ph_max], [ph_min], [ox_max], [ox_min], [temp_max], [temp_min], [turb_max], [turb_min], [nivel_alerta], [fecha_actualizacion]) VALUES (1024, CAST(15.00 AS Decimal(5, 2)), CAST(2.00 AS Decimal(5, 2)), CAST(12.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(25.00 AS Decimal(5, 2)), CAST(2.00 AS Decimal(5, 2)), CAST(22.00 AS Decimal(5, 2)), CAST(13.00 AS Decimal(5, 2)), N'Alerta Moderada', CAST(N'2025-06-25T23:32:38.627' AS DateTime))
INSERT [dbo].[parametros_alertas] ([id], [ph_max], [ph_min], [ox_max], [ox_min], [temp_max], [temp_min], [turb_max], [turb_min], [nivel_alerta], [fecha_actualizacion]) VALUES (1025, CAST(12.00 AS Decimal(5, 2)), CAST(2.00 AS Decimal(5, 2)), CAST(12.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(12.00 AS Decimal(5, 2)), CAST(2.00 AS Decimal(5, 2)), CAST(21.00 AS Decimal(5, 2)), CAST(13.00 AS Decimal(5, 2)), N'Alerta Crítica', CAST(N'2025-06-25T23:33:11.600' AS DateTime))
INSERT [dbo].[parametros_alertas] ([id], [ph_max], [ph_min], [ox_max], [ox_min], [temp_max], [temp_min], [turb_max], [turb_min], [nivel_alerta], [fecha_actualizacion]) VALUES (1026, CAST(12.00 AS Decimal(5, 2)), CAST(2.00 AS Decimal(5, 2)), CAST(12.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(25.00 AS Decimal(5, 2)), CAST(2.00 AS Decimal(5, 2)), CAST(21.00 AS Decimal(5, 2)), CAST(13.00 AS Decimal(5, 2)), N'Alerta Moderada', CAST(N'2025-06-25T23:34:17.973' AS DateTime))
INSERT [dbo].[parametros_alertas] ([id], [ph_max], [ph_min], [ox_max], [ox_min], [temp_max], [temp_min], [turb_max], [turb_min], [nivel_alerta], [fecha_actualizacion]) VALUES (1027, CAST(12.00 AS Decimal(5, 2)), CAST(2.00 AS Decimal(5, 2)), CAST(12.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(25.00 AS Decimal(5, 2)), CAST(2.00 AS Decimal(5, 2)), CAST(21.00 AS Decimal(5, 2)), CAST(13.00 AS Decimal(5, 2)), N'Alerta Crítica', CAST(N'2025-06-25T23:34:19.983' AS DateTime))
INSERT [dbo].[parametros_alertas] ([id], [ph_max], [ph_min], [ox_max], [ox_min], [temp_max], [temp_min], [turb_max], [turb_min], [nivel_alerta], [fecha_actualizacion]) VALUES (1028, CAST(3.00 AS Decimal(5, 2)), CAST(2.00 AS Decimal(5, 2)), CAST(12.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(25.00 AS Decimal(5, 2)), CAST(2.00 AS Decimal(5, 2)), CAST(21.00 AS Decimal(5, 2)), CAST(13.00 AS Decimal(5, 2)), N'Alerta Crítica', CAST(N'2025-06-25T23:34:46.137' AS DateTime))
SET IDENTITY_INSERT [dbo].[parametros_alertas] OFF
GO
SET IDENTITY_INSERT [dbo].[sensores] ON 

INSERT [dbo].[sensores] ([id], [tipo_sensor], [num_sensor], [fecha_inicio], [fecha_revision]) VALUES (4, N'Temperatura', 123456, 12052025, 12062025)
INSERT [dbo].[sensores] ([id], [tipo_sensor], [num_sensor], [fecha_inicio], [fecha_revision]) VALUES (5, N'Oxigenación', 156, 13022025, 26122025)
INSERT [dbo].[sensores] ([id], [tipo_sensor], [num_sensor], [fecha_inicio], [fecha_revision]) VALUES (6, N'Temperatura', 129529, 10102024, 2022025)
INSERT [dbo].[sensores] ([id], [tipo_sensor], [num_sensor], [fecha_inicio], [fecha_revision]) VALUES (7, N'Humedad', 1563, 31012025, 25022026)
INSERT [dbo].[sensores] ([id], [tipo_sensor], [num_sensor], [fecha_inicio], [fecha_revision]) VALUES (8, N'Grande', 151, 31012025, 25022026)
INSERT [dbo].[sensores] ([id], [tipo_sensor], [num_sensor], [fecha_inicio], [fecha_revision]) VALUES (9, N'Mediano', 1492, 23112022, 25122025)
INSERT [dbo].[sensores] ([id], [tipo_sensor], [num_sensor], [fecha_inicio], [fecha_revision]) VALUES (10, N'Mediano', 764, 4042023, 14092025)
INSERT [dbo].[sensores] ([id], [tipo_sensor], [num_sensor], [fecha_inicio], [fecha_revision]) VALUES (1006, N'Grande', 895, 12012025, 12022025)
INSERT [dbo].[sensores] ([id], [tipo_sensor], [num_sensor], [fecha_inicio], [fecha_revision]) VALUES (1007, N'Mediano', 8957, 22022025, 6032025)
INSERT [dbo].[sensores] ([id], [tipo_sensor], [num_sensor], [fecha_inicio], [fecha_revision]) VALUES (1008, N'Pequeño', 679, 22032025, 27042025)
INSERT [dbo].[sensores] ([id], [tipo_sensor], [num_sensor], [fecha_inicio], [fecha_revision]) VALUES (1009, N'Pequeño', 116, 2042025, 7052025)
INSERT [dbo].[sensores] ([id], [tipo_sensor], [num_sensor], [fecha_inicio], [fecha_revision]) VALUES (1010, N'Mediano', 907, 18052025, 27062025)
INSERT [dbo].[sensores] ([id], [tipo_sensor], [num_sensor], [fecha_inicio], [fecha_revision]) VALUES (1011, N'Mediano', 189, 22062025, 28072025)
INSERT [dbo].[sensores] ([id], [tipo_sensor], [num_sensor], [fecha_inicio], [fecha_revision]) VALUES (1012, N'Pequeño', 85, 22062025, 28072025)
INSERT [dbo].[sensores] ([id], [tipo_sensor], [num_sensor], [fecha_inicio], [fecha_revision]) VALUES (1014, N'Pequeño', 852, 1052025, 28052025)
INSERT [dbo].[sensores] ([id], [tipo_sensor], [num_sensor], [fecha_inicio], [fecha_revision]) VALUES (1015, N'Pequeño', 111, 6042025, 28052025)
INSERT [dbo].[sensores] ([id], [tipo_sensor], [num_sensor], [fecha_inicio], [fecha_revision]) VALUES (1017, N'Pequeño', 114, 11032025, 20042025)
INSERT [dbo].[sensores] ([id], [tipo_sensor], [num_sensor], [fecha_inicio], [fecha_revision]) VALUES (1018, N'Mediano', 66, 10032025, 20042025)
INSERT [dbo].[sensores] ([id], [tipo_sensor], [num_sensor], [fecha_inicio], [fecha_revision]) VALUES (1019, N'Mediano', 86, 16012025, 21022025)
INSERT [dbo].[sensores] ([id], [tipo_sensor], [num_sensor], [fecha_inicio], [fecha_revision]) VALUES (1020, N'Mediano', 789, 12052025, 13042026)
INSERT [dbo].[sensores] ([id], [tipo_sensor], [num_sensor], [fecha_inicio], [fecha_revision]) VALUES (1021, N'Mediano', 4564, 12052024, 12072025)
INSERT [dbo].[sensores] ([id], [tipo_sensor], [num_sensor], [fecha_inicio], [fecha_revision]) VALUES (1023, N'Mediano', 1012, 12052025, 12072025)
SET IDENTITY_INSERT [dbo].[sensores] OFF
GO
/****** Object:  Index [UQ_num_sensor]    Script Date: 26/06/2025 12:08:35 ******/
ALTER TABLE [dbo].[sensores] ADD  CONSTRAINT [UQ_num_sensor] UNIQUE NONCLUSTERED 
(
	[num_sensor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[actualizaciones_sensores] ADD  DEFAULT (getdate()) FOR [fecha_actualizacion]
GO
ALTER TABLE [dbo].[parametros_alertas] ADD  DEFAULT (getdate()) FOR [fecha_actualizacion]
GO
ALTER TABLE [dbo].[actualizaciones_sensores]  WITH CHECK ADD FOREIGN KEY([num_sensor])
REFERENCES [dbo].[sensores] ([num_sensor])
GO
USE [master]
GO
ALTER DATABASE [SistemaSensores] SET  READ_WRITE 
GO
