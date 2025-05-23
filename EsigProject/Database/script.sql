USE [master]
GO
/****** Object:  Database [db_esig]    Script Date: 04/05/2025 13:39:36 ******/
CREATE DATABASE [db_esig]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_esig', FILENAME = N'D:\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\db_esig.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'db_esig_log', FILENAME = N'D:\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\db_esig_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [db_esig] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_esig].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_esig] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_esig] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_esig] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_esig] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_esig] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_esig] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [db_esig] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_esig] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_esig] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_esig] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_esig] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_esig] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_esig] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_esig] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_esig] SET  DISABLE_BROKER 
GO
ALTER DATABASE [db_esig] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_esig] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_esig] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_esig] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_esig] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_esig] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_esig] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_esig] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [db_esig] SET  MULTI_USER 
GO
ALTER DATABASE [db_esig] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_esig] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_esig] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_esig] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [db_esig] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [db_esig] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [db_esig] SET QUERY_STORE = ON
GO
ALTER DATABASE [db_esig] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [db_esig]
GO
/****** Object:  Table [dbo].[cargo]    Script Date: 04/05/2025 13:39:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cargo](
	[ID] [float] NULL,
	[Nome] [nvarchar](255) NULL,
	[Salario] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pessoa]    Script Date: 04/05/2025 13:39:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pessoa](
	[ID] [float] NULL,
	[Nome] [nvarchar](255) NULL,
	[Cidade] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[CEP] [nvarchar](255) NULL,
	[Enderco] [nvarchar](255) NULL,
	[Pais] [nvarchar](255) NULL,
	[Usuario] [nvarchar](255) NULL,
	[Telefone] [nvarchar](255) NULL,
	[Data_Nascimento] [datetime] NULL,
	[Cargo_ID] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pessoa_salario]    Script Date: 04/05/2025 13:39:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pessoa_salario](
	[pessoa_id] [int] NULL,
	[pessoa_nome] [varchar](100) NULL,
	[cargo_nome] [varchar](100) NULL,
	[salario] [decimal](10, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[calcular_salarios]    Script Date: 04/05/2025 13:39:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[calcular_salarios]
AS
BEGIN
    -- Remove os dados antigos
    DELETE FROM pessoa_salario;

    -- Insere os dados atualizados
    INSERT INTO pessoa_salario (pessoa_id, pessoa_nome, cargo_nome, salario)
    SELECT 
        p.ID,
        p.Nome,
        c.Nome,
        c.Salario
    FROM pessoa p
    INNER JOIN cargo c ON p.cargo_id = c.id;
END;
GO
USE [master]
GO
ALTER DATABASE [db_esig] SET  READ_WRITE 
GO
