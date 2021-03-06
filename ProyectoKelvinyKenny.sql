USE [master]
GO
/****** Object:  Database [Proyecto2]    Script Date: 11/24/2021 2:27:17 PM ******/
CREATE DATABASE [Proyecto2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Proyecto2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Proyecto2.mdf' , SIZE = 3547136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Proyecto2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Proyecto2_log.ldf' , SIZE = 10100736KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Proyecto2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Proyecto2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Proyecto2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Proyecto2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Proyecto2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Proyecto2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Proyecto2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Proyecto2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Proyecto2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Proyecto2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Proyecto2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Proyecto2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Proyecto2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Proyecto2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Proyecto2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Proyecto2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Proyecto2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Proyecto2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Proyecto2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Proyecto2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Proyecto2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Proyecto2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Proyecto2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Proyecto2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Proyecto2] SET RECOVERY FULL 
GO
ALTER DATABASE [Proyecto2] SET  MULTI_USER 
GO
ALTER DATABASE [Proyecto2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Proyecto2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Proyecto2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Proyecto2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Proyecto2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Proyecto2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Proyecto2', N'ON'
GO
ALTER DATABASE [Proyecto2] SET QUERY_STORE = OFF
GO
USE [Proyecto2]
GO
/****** Object:  User [UsuarioRespaldo]    Script Date: 11/24/2021 2:27:17 PM ******/
CREATE USER [UsuarioRespaldo] FOR LOGIN [UsuarioRespaldo] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [UsuarioNormal]    Script Date: 11/24/2021 2:27:17 PM ******/
CREATE USER [UsuarioNormal] FOR LOGIN [UsuarioNormal] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [SuperUsuario]    Script Date: 11/24/2021 2:27:17 PM ******/
CREATE USER [SuperUsuario] FOR LOGIN [SuperUsuario] WITH DEFAULT_SCHEMA=[SuperUsuario]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [UsuarioRespaldo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [UsuarioNormal]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [UsuarioNormal]
GO
/****** Object:  Schema [cliente]    Script Date: 11/24/2021 2:27:17 PM ******/
CREATE SCHEMA [cliente]
GO
/****** Object:  Schema [credito]    Script Date: 11/24/2021 2:27:17 PM ******/
CREATE SCHEMA [credito]
GO
/****** Object:  Schema [finanza]    Script Date: 11/24/2021 2:27:17 PM ******/
CREATE SCHEMA [finanza]
GO
/****** Object:  Schema [SuperUsuario]    Script Date: 11/24/2021 2:27:17 PM ******/
CREATE SCHEMA [SuperUsuario]
GO
/****** Object:  Table [cliente].[application_train]    Script Date: 11/24/2021 2:27:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [cliente].[application_train](
	[SK_ID_CURR] [int] NOT NULL,
	[TARGET] [int] NOT NULL,
	[NAME_CONTRACT_TYPE] [nchar](25) NULL,
	[CODE_GENDER] [nchar](3) NULL,
	[FLAG_OWN_CAR] [nchar](2) NULL,
	[FLAG_OWN_REALTY] [nchar](2) NULL,
	[CNT_CHILDREN] [int] NULL,
	[AMT_INCOME_TOTAL] [int] NULL,
 CONSTRAINT [PK_application_test] PRIMARY KEY CLUSTERED 
(
	[SK_ID_CURR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [cliente].[bureau]    Script Date: 11/24/2021 2:27:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [cliente].[bureau](
	[SK_ID_CURR] [int] NULL,
	[SK_ID_BUREAU] [int] NOT NULL,
	[CREDIT_ACTIVE] [nchar](10) NULL,
	[CREDIT_CURRENCY] [nchar](10) NULL,
	[DAYS_CREDIT] [int] NULL,
 CONSTRAINT [PK_bureau] PRIMARY KEY CLUSTERED 
(
	[SK_ID_BUREAU] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [credito].[bureau_balance]    Script Date: 11/24/2021 2:27:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [credito].[bureau_balance](
	[SK_ID_BUREAU] [int] NULL,
	[MONTHS_BALANCE] [int] NULL,
	[STATUS] [nchar](2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [credito].[credit_card_balance]    Script Date: 11/24/2021 2:27:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [credito].[credit_card_balance](
	[SK_ID_PREV] [int] NULL,
	[SK_ID_CURR] [int] NULL,
	[MONTHS_BALANCE] [int] NULL,
	[AMT_BALANCE] [int] NULL,
	[AMT_CREDIT_LIMIT_ACTUAL] [int] NULL,
	[AMT_DRAWINGS_ATM_CURRENT] [int] NULL,
	[AMT_DRAWINGS_CURRENT] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [credito].[installments_payments]    Script Date: 11/24/2021 2:27:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [credito].[installments_payments](
	[SK_ID_PREV] [int] NULL,
	[SK_ID_CURR] [int] NULL,
	[NUM_INSTALMENT_VERSION] [int] NULL,
	[NUM_INSTALMENT_NUMBER] [int] NULL,
	[DAYS_INSTALMENT] [int] NULL,
	[DAYS_ENTRY_PAYMENT] [int] NULL,
	[AMT_INSTALMENT] [int] NULL,
	[AMT_PAYMENT] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[test_bureau_balance]    Script Date: 11/24/2021 2:27:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test_bureau_balance](
	[SK_ID_BUREAU] [int] NOT NULL,
	[MONTHS_BALANCE] [int] NULL,
	[STATUS] [nchar](2) NULL
) ON [PRIMARY]
GO
/****** Object:  Index [indiceTestBureauBalance]    Script Date: 11/24/2021 2:27:17 PM ******/
CREATE CLUSTERED INDEX [indiceTestBureauBalance] ON [dbo].[test_bureau_balance]
(
	[SK_ID_BUREAU] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[test_credit_card_balance]    Script Date: 11/24/2021 2:27:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test_credit_card_balance](
	[SK_ID_PREV] [int] NULL,
	[SK_ID_CURR] [int] NULL,
	[MONTHS_BALANCE] [int] NULL,
	[AMT_BALANCE] [int] NULL,
	[AMT_CREDIT_LIMIT_ACTUAL] [int] NULL,
	[AMT_DRAWINGS_ATM_CURRENT] [int] NULL,
	[AMT_DRAWINGS_CURRENT] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[test_installments]    Script Date: 11/24/2021 2:27:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test_installments](
	[SK_ID_PREV] [float] NULL,
	[SK_ID_CURR] [float] NULL,
	[NUM_INSTALMENT_VERSION] [float] NULL,
	[NUM_INSTALMENT_NUMBER] [float] NULL,
	[DAYS_INSTALMENT] [float] NULL,
	[DAYS_ENTRY_PAYMENT] [float] NULL,
	[AMT_INSTALMENT] [float] NULL,
	[AMT_PAYMENT] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[test_POS_CASH_balance]    Script Date: 11/24/2021 2:27:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test_POS_CASH_balance](
	[SK_ID_PREV] [float] NULL,
	[SK_ID_CURR] [float] NULL,
	[MONTHS_BALANCE] [float] NULL,
	[CNT_INSTALMENT] [float] NULL,
	[CNT_INSTALMENT_FUTURE] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [finanza].[POS_CASH_balance]    Script Date: 11/24/2021 2:27:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [finanza].[POS_CASH_balance](
	[SK_ID_PREV] [int] NULL,
	[SK_ID_CURR] [int] NULL,
	[MONTHS_BALANCE] [int] NULL,
	[CNT_INSTALMENT] [int] NULL,
	[CNT_INSTALMENTE_FUTURE] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [finanza].[previous_application]    Script Date: 11/24/2021 2:27:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [finanza].[previous_application](
	[SK_ID_PREV] [int] NOT NULL,
	[SK_ID_CURR] [int] NULL,
	[NAME_CONTRACT_TYPE] [nchar](25) NULL,
	[AMT_ANNUITY] [int] NOT NULL,
	[AMT_APPLICATION] [int] NULL,
 CONSTRAINT [PK_previous_application] PRIMARY KEY CLUSTERED 
(
	[SK_ID_PREV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [indiceIncome]    Script Date: 11/24/2021 2:27:17 PM ******/
CREATE NONCLUSTERED INDEX [indiceIncome] ON [cliente].[application_train]
(
	[AMT_INCOME_TOTAL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [indiceBalance]    Script Date: 11/24/2021 2:27:17 PM ******/
CREATE NONCLUSTERED INDEX [indiceBalance] ON [dbo].[test_credit_card_balance]
(
	[AMT_BALANCE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [indicePayment]    Script Date: 11/24/2021 2:27:17 PM ******/
CREATE NONCLUSTERED INDEX [indicePayment] ON [dbo].[test_installments]
(
	[AMT_PAYMENT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [indiceAnnuity]    Script Date: 11/24/2021 2:27:17 PM ******/
CREATE NONCLUSTERED INDEX [indiceAnnuity] ON [finanza].[previous_application]
(
	[AMT_ANNUITY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [indiceApplication]    Script Date: 11/24/2021 2:27:17 PM ******/
CREATE NONCLUSTERED INDEX [indiceApplication] ON [finanza].[previous_application]
(
	[AMT_APPLICATION] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [cliente].[bureau]  WITH CHECK ADD  CONSTRAINT [FK_bureau_application_train] FOREIGN KEY([SK_ID_CURR])
REFERENCES [cliente].[application_train] ([SK_ID_CURR])
GO
ALTER TABLE [cliente].[bureau] CHECK CONSTRAINT [FK_bureau_application_train]
GO
ALTER TABLE [credito].[bureau_balance]  WITH CHECK ADD  CONSTRAINT [FK_bureau_balance_bureau] FOREIGN KEY([SK_ID_BUREAU])
REFERENCES [cliente].[bureau] ([SK_ID_BUREAU])
GO
ALTER TABLE [credito].[bureau_balance] CHECK CONSTRAINT [FK_bureau_balance_bureau]
GO
ALTER TABLE [credito].[credit_card_balance]  WITH CHECK ADD  CONSTRAINT [FK_credit_card_balance_application_train] FOREIGN KEY([SK_ID_CURR])
REFERENCES [cliente].[application_train] ([SK_ID_CURR])
GO
ALTER TABLE [credito].[credit_card_balance] CHECK CONSTRAINT [FK_credit_card_balance_application_train]
GO
ALTER TABLE [credito].[credit_card_balance]  WITH CHECK ADD  CONSTRAINT [FK_credit_card_balance_previous_application] FOREIGN KEY([SK_ID_PREV])
REFERENCES [finanza].[previous_application] ([SK_ID_PREV])
GO
ALTER TABLE [credito].[credit_card_balance] CHECK CONSTRAINT [FK_credit_card_balance_previous_application]
GO
ALTER TABLE [credito].[installments_payments]  WITH CHECK ADD  CONSTRAINT [FK_installments_payments_application_train] FOREIGN KEY([SK_ID_CURR])
REFERENCES [cliente].[application_train] ([SK_ID_CURR])
GO
ALTER TABLE [credito].[installments_payments] CHECK CONSTRAINT [FK_installments_payments_application_train]
GO
ALTER TABLE [credito].[installments_payments]  WITH CHECK ADD  CONSTRAINT [FK_installments_payments_previous_application] FOREIGN KEY([SK_ID_PREV])
REFERENCES [finanza].[previous_application] ([SK_ID_PREV])
GO
ALTER TABLE [credito].[installments_payments] CHECK CONSTRAINT [FK_installments_payments_previous_application]
GO
ALTER TABLE [finanza].[POS_CASH_balance]  WITH CHECK ADD  CONSTRAINT [FK_POS_CASH_balance_application_train] FOREIGN KEY([SK_ID_CURR])
REFERENCES [cliente].[application_train] ([SK_ID_CURR])
GO
ALTER TABLE [finanza].[POS_CASH_balance] CHECK CONSTRAINT [FK_POS_CASH_balance_application_train]
GO
ALTER TABLE [finanza].[POS_CASH_balance]  WITH CHECK ADD  CONSTRAINT [FK_POS_CASH_balance_previous_application] FOREIGN KEY([SK_ID_PREV])
REFERENCES [finanza].[previous_application] ([SK_ID_PREV])
GO
ALTER TABLE [finanza].[POS_CASH_balance] CHECK CONSTRAINT [FK_POS_CASH_balance_previous_application]
GO
ALTER TABLE [finanza].[previous_application]  WITH CHECK ADD  CONSTRAINT [FK_previous_application_application_train] FOREIGN KEY([SK_ID_CURR])
REFERENCES [cliente].[application_train] ([SK_ID_CURR])
GO
ALTER TABLE [finanza].[previous_application] CHECK CONSTRAINT [FK_previous_application_application_train]
GO
/****** Object:  StoredProcedure [dbo].[spInsertarApplicationTrain]    Script Date: 11/24/2021 2:27:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsertarApplicationTrain]
(@SK_ID_CURR INT, @TARGET INT, @NAME_CONTRACT_TYPE nchar(25),
@CODE_GENDER NCHAR(3), @FLAG_OWN_CAR NCHAR(2), @FLAG_OWN_REALTY nchar(2), @CNT_CHILDREN INT, @AMT_INCOME_TOTAL int)
AS
BEGIN 
	INSERT INTO cliente.application_train (SK_ID_CURR, TARGET, NAME_CONTRACT_TYPE, CODE_GENDER, FLAG_OWN_CAR, FLAG_OWN_REALTY, CNT_CHILDREN, AMT_INCOME_TOTAL)
	VALUES(@SK_ID_CURR, @TARGET, @NAME_CONTRACT_TYPE, @CODE_GENDER, @FLAG_OWN_CAR, @FLAG_OWN_REALTY, @CNT_CHILDREN, @AMT_INCOME_TOTAL);
	print ('VALORES HAN SIDO INSERTADOS')
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertarBureau]    Script Date: 11/24/2021 2:27:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsertarBureau]
(@SK_ID_CURR INT, @SK_ID_BUREAU INT, @CREDIT_ACTIVE NCHAR(10), @CREDIT_CURRENCY NCHAR(10), @DAYS_CREDIT INT)
AS
BEGIN 
	INSERT INTO cliente.bureau (SK_ID_CURR, SK_ID_BUREAU, CREDIT_ACTIVE , CREDIT_CURRENCY ,DAYS_CREDIT)
	VALUES(@SK_ID_CURR, @SK_ID_BUREAU, @CREDIT_ACTIVE, @CREDIT_CURRENCY , @DAYS_CREDIT);
	print ('VALORES HAN SIDO INSERTADOS')
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertarBureauBalance]    Script Date: 11/24/2021 2:27:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsertarBureauBalance]
(@SK_ID_BUREAU INT, @MONTHS_BALANCE INT, @STATUS NCHAR(2))
AS
BEGIN 
	INSERT INTO test_bureau_balance(SK_ID_BUREAU, MONTHS_BALANCE, STATUS)
	VALUES(@SK_ID_BUREAU , @MONTHS_BALANCE , @STATUS);
	print ('VALORES HAN SIDO INSERTADOS')
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertarCreditCardBalance]    Script Date: 11/24/2021 2:27:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsertarCreditCardBalance]
(@SK_ID_PREV INT, @SK_ID_CURR INT, @MONTHS_BALANCE INT, @AMT_BALANCE INT, @AMT_CREDIT_LIMIT_ACTUAL INT, @AMT_DRAWINGS_AMT_CURRENT INT, @AMT_DRAWINGS_CURRENT INT)
AS
BEGIN 
	INSERT INTO test_credit_card_balance(SK_ID_PREV, SK_ID_CURR, MONTHS_BALANCE, AMT_BALANCE, AMT_CREDIT_LIMIT_ACTUAL, AMT_DRAWINGS_ATM_CURRENT, AMT_DRAWINGS_CURRENT)
	VALUES(@SK_ID_PREV , @SK_ID_CURR , @MONTHS_BALANCE , @AMT_BALANCE , @AMT_CREDIT_LIMIT_ACTUAL , @AMT_DRAWINGS_AMT_CURRENT , @AMT_DRAWINGS_CURRENT );
	print ('VALORES HAN SIDO INSERTADOS')
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertarPosCash]    Script Date: 11/24/2021 2:27:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsertarPosCash]
(@SK_ID_PREV float, @SK_ID_CURR float, @MONTHS_BALANCE float, @CNT_INSTALMENT float, @CNT_INSTALMENT_FUTURE float)
AS
BEGIN 
	INSERT INTO test_POS_CASH_balance(SK_ID_PREV, SK_ID_CURR, MONTHS_BALANCE, CNT_INSTALMENT, CNT_INSTALMENT_FUTURE)
	VALUES(@SK_ID_PREV , @SK_ID_CURR , @MONTHS_BALANCE , @CNT_INSTALMENT , @CNT_INSTALMENT_FUTURE );
	print ('VALORES HAN SIDO INSERTADOS')
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertarPrevious]    Script Date: 11/24/2021 2:27:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsertarPrevious]
(@SK_ID_PREV INT, @SK_ID_CURR INT, @NAME_CONTRACT_TYPE NCHAR(25), @AMT_ANNUITY INT, @AMT_APPLICATION INT)
AS
BEGIN 
	INSERT INTO finanza.previous_application(SK_ID_PREV, SK_ID_CURR, NAME_CONTRACT_TYPE, AMT_ANNUITY, AMT_APPLICATION)
	VALUES(@SK_ID_PREV , @SK_ID_CURR , @NAME_CONTRACT_TYPE , @AMT_ANNUITY , @AMT_APPLICATION );
	print ('VALORES HAN SIDO INSERTADOS')
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertarTestInstallments]    Script Date: 11/24/2021 2:27:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsertarTestInstallments]
(@SK_ID_PREV float, @SK_ID_CURR float, @NUM_INSTALMENT_VERSION float,  @NUM_INSTALMENT_NUMBER float, @DAYS_INSTALMENT float,
                    @DAYS_ENTRY_PAYMENT float, @AMT_INSTALMENT float, @AMT_PAYMENT float)
AS
BEGIN 
	INSERT INTO test_installments(SK_ID_PREV, SK_ID_CURR, NUM_INSTALMENT_VERSION, NUM_INSTALMENT_NUMBER, DAYS_INSTALMENT, DAYS_ENTRY_PAYMENT, AMT_INSTALMENT, AMT_PAYMENT)
	VALUES(@SK_ID_PREV , @SK_ID_CURR , @NUM_INSTALMENT_VERSION ,  @NUM_INSTALMENT_NUMBER , @DAYS_INSTALMENT ,
                    @DAYS_ENTRY_PAYMENT , @AMT_INSTALMENT , @AMT_PAYMENT );
	print ('VALORES HAN SIDO INSERTADOS')
END
GO
USE [master]
GO
ALTER DATABASE [Proyecto2] SET  READ_WRITE 
GO
