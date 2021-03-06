USE [master]
GO
/****** Object:  Database [WebGaragem]    Script Date: 13/06/2020 16:29:32 ******/
CREATE DATABASE [WebGaragem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebGaragem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS01\MSSQL\DATA\WebGaragem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WebGaragem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS01\MSSQL\DATA\WebGaragem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [WebGaragem] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebGaragem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebGaragem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebGaragem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebGaragem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebGaragem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebGaragem] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebGaragem] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [WebGaragem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebGaragem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebGaragem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebGaragem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebGaragem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebGaragem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebGaragem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebGaragem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebGaragem] SET  ENABLE_BROKER 
GO
ALTER DATABASE [WebGaragem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebGaragem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebGaragem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebGaragem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebGaragem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebGaragem] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [WebGaragem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebGaragem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WebGaragem] SET  MULTI_USER 
GO
ALTER DATABASE [WebGaragem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebGaragem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebGaragem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebGaragem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WebGaragem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WebGaragem] SET QUERY_STORE = OFF
GO
USE [WebGaragem]
GO
/****** Object:  User [paulo]    Script Date: 13/06/2020 16:29:32 ******/
CREATE USER [paulo] FOR LOGIN [paulo] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [fluig]    Script Date: 13/06/2020 16:29:32 ******/
CREATE USER [fluig] FOR LOGIN [fluig] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [paulo]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [paulo]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [paulo]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [paulo]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [paulo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [paulo]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [paulo]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [paulo]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [paulo]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 13/06/2020 16:29:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AcessoTipoUsuario]    Script Date: 13/06/2020 16:29:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AcessoTipoUsuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NomeFuncionalidade] [nvarchar](128) NOT NULL,
	[IdTipoUsuario] [int] NOT NULL,
 CONSTRAINT [PK_AcessoTipoUsuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Anuncio]    Script Date: 13/06/2020 16:29:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Anuncio](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdMarca] [int] NOT NULL,
	[IdModelo] [int] NOT NULL,
	[AnoVeiculo] [nvarchar](4) NULL,
	[ValorCompra] [float] NULL,
	[ValorVenda] [float] NULL,
	[Cor] [nvarchar](250) NULL,
	[TipoCombustivel] [nvarchar](250) NULL,
	[DataVenda] [datetime] NULL,
 CONSTRAINT [PK_Anuncio] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 13/06/2020 16:29:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 13/06/2020 16:29:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 13/06/2020 16:29:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 13/06/2020 16:29:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 13/06/2020 16:29:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 13/06/2020 16:29:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 13/06/2020 16:29:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marca]    Script Date: 13/06/2020 16:29:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marca](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NomeMarca] [nvarchar](256) NULL,
 CONSTRAINT [PK_Marca] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Modelo]    Script Date: 13/06/2020 16:29:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Modelo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NomeModelo] [nvarchar](256) NULL,
 CONSTRAINT [PK_Modelo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PerfilUsuario]    Script Date: 13/06/2020 16:29:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PerfilUsuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[IdTipoUsuario] [int] NOT NULL,
 CONSTRAINT [PK_PerfilUsuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoUsuario]    Script Date: 13/06/2020 16:29:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoUsuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NomeTipoUsuario] [nvarchar](256) NULL,
 CONSTRAINT [PK_TipoUsuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'00000000000000_CreateIdentitySchema', N'2.2.6-servicing-10079')
SET IDENTITY_INSERT [dbo].[AcessoTipoUsuario] ON 

INSERT [dbo].[AcessoTipoUsuario] ([Id], [NomeFuncionalidade], [IdTipoUsuario]) VALUES (3, N'Tela de Tipo Usuário', 1)
INSERT [dbo].[AcessoTipoUsuario] ([Id], [NomeFuncionalidade], [IdTipoUsuario]) VALUES (4, N'Tela de Acesso Tipo Usuário', 1)
INSERT [dbo].[AcessoTipoUsuario] ([Id], [NomeFuncionalidade], [IdTipoUsuario]) VALUES (5, N'Tela Perfil Usuário', 1)
INSERT [dbo].[AcessoTipoUsuario] ([Id], [NomeFuncionalidade], [IdTipoUsuario]) VALUES (6, N'Tela Marca', 1)
INSERT [dbo].[AcessoTipoUsuario] ([Id], [NomeFuncionalidade], [IdTipoUsuario]) VALUES (7, N'Tela Modelo', 1)
INSERT [dbo].[AcessoTipoUsuario] ([Id], [NomeFuncionalidade], [IdTipoUsuario]) VALUES (8, N'Tela Anuncio', 1)
SET IDENTITY_INSERT [dbo].[AcessoTipoUsuario] OFF
SET IDENTITY_INSERT [dbo].[Anuncio] ON 

INSERT [dbo].[Anuncio] ([Id], [IdMarca], [IdModelo], [AnoVeiculo], [ValorCompra], [ValorVenda], [Cor], [TipoCombustivel], [DataVenda]) VALUES (14, 1, 1, N'2020', 10000, 15000, N'Preto', N'Gasolina', CAST(N'2020-06-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Anuncio] ([Id], [IdMarca], [IdModelo], [AnoVeiculo], [ValorCompra], [ValorVenda], [Cor], [TipoCombustivel], [DataVenda]) VALUES (15, 2, 2, N'2020', 50000, 50000, N'Prata', N'Gasolina', CAST(N'2020-06-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Anuncio] ([Id], [IdMarca], [IdModelo], [AnoVeiculo], [ValorCompra], [ValorVenda], [Cor], [TipoCombustivel], [DataVenda]) VALUES (16, 2, 3, N'2015', 15000, 16000, N'Vermelho', N'Gasolina', CAST(N'2020-06-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Anuncio] ([Id], [IdMarca], [IdModelo], [AnoVeiculo], [ValorCompra], [ValorVenda], [Cor], [TipoCombustivel], [DataVenda]) VALUES (17, 4, 4, N'2020', 20000, 25000, N'Preto', N'Flex', CAST(N'2020-06-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Anuncio] ([Id], [IdMarca], [IdModelo], [AnoVeiculo], [ValorCompra], [ValorVenda], [Cor], [TipoCombustivel], [DataVenda]) VALUES (21, 3, 5, N'2020', 10000, 25000, N'Azul', N'Flex', CAST(N'2020-06-13T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Anuncio] OFF
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'4d1b1972-6bda-4418-b878-da9c08f3548c', N'comprador@questor.com.br', N'COMPRADOR@QUESTOR.COM.BR', N'comprador@questor.com.br', N'COMPRADOR@QUESTOR.COM.BR', 0, N'AQAAAAEAACcQAAAAEBATWAKPkXajimHQf0MpbmHyqMeUhiLp1AXWNrKdsxalMB9uqU1FBGJ1LysVlgZ2rQ==', N'57JISGDXGW7JKHD4GATBUHFP4LPFZHQB', N'be81e93a-4024-4662-aa16-d235b3584567', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'97cd6b19-f7c9-4255-8f59-6d9931b0b303', N'paulobastian@gmail.com', N'PAULOBASTIAN@GMAIL.COM', N'paulobastian@gmail.com', N'PAULOBASTIAN@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEHWTeSFzknGqhpd7JfG8UW37GUejvthTtzPmdvgjIFaFhiJY4z1lnWP0ExKwml20Lw==', N'HNIMWLHTCYVE26HIVQEJB7YDQGLJIRX2', N'd5a19e8d-b8cd-4eab-8bb0-d969a4d8ba9e', NULL, 0, 0, NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[Marca] ON 

INSERT [dbo].[Marca] ([Id], [NomeMarca]) VALUES (1, N'VW')
INSERT [dbo].[Marca] ([Id], [NomeMarca]) VALUES (2, N'Ford')
INSERT [dbo].[Marca] ([Id], [NomeMarca]) VALUES (3, N'Fiat')
INSERT [dbo].[Marca] ([Id], [NomeMarca]) VALUES (4, N'GM')
SET IDENTITY_INSERT [dbo].[Marca] OFF
SET IDENTITY_INSERT [dbo].[Modelo] ON 

INSERT [dbo].[Modelo] ([Id], [NomeModelo]) VALUES (1, N'Gol 1.0')
INSERT [dbo].[Modelo] ([Id], [NomeModelo]) VALUES (2, N'Focus')
INSERT [dbo].[Modelo] ([Id], [NomeModelo]) VALUES (3, N'Fiesta')
INSERT [dbo].[Modelo] ([Id], [NomeModelo]) VALUES (4, N'Celta')
INSERT [dbo].[Modelo] ([Id], [NomeModelo]) VALUES (5, N'Palio')
SET IDENTITY_INSERT [dbo].[Modelo] OFF
SET IDENTITY_INSERT [dbo].[PerfilUsuario] ON 

INSERT [dbo].[PerfilUsuario] ([Id], [UserId], [IdTipoUsuario]) VALUES (1, N'97cd6b19-f7c9-4255-8f59-6d9931b0b303', 1)
SET IDENTITY_INSERT [dbo].[PerfilUsuario] OFF
SET IDENTITY_INSERT [dbo].[TipoUsuario] ON 

INSERT [dbo].[TipoUsuario] ([Id], [NomeTipoUsuario]) VALUES (1, N'Administrador')
INSERT [dbo].[TipoUsuario] ([Id], [NomeTipoUsuario]) VALUES (2, N'Comprador')
SET IDENTITY_INSERT [dbo].[TipoUsuario] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 13/06/2020 16:29:33 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 13/06/2020 16:29:33 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 13/06/2020 16:29:33 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 13/06/2020 16:29:33 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 13/06/2020 16:29:33 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 13/06/2020 16:29:33 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 13/06/2020 16:29:33 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AcessoTipoUsuario]  WITH CHECK ADD  CONSTRAINT [FK_AcessoTipoUsuario_TipoUsuario_IdTipoUsuario] FOREIGN KEY([IdTipoUsuario])
REFERENCES [dbo].[TipoUsuario] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AcessoTipoUsuario] CHECK CONSTRAINT [FK_AcessoTipoUsuario_TipoUsuario_IdTipoUsuario]
GO
ALTER TABLE [dbo].[Anuncio]  WITH CHECK ADD  CONSTRAINT [FK_Anuncio_Marca_IdMarca] FOREIGN KEY([IdMarca])
REFERENCES [dbo].[Marca] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Anuncio] CHECK CONSTRAINT [FK_Anuncio_Marca_IdMarca]
GO
ALTER TABLE [dbo].[Anuncio]  WITH CHECK ADD  CONSTRAINT [FK_Anuncio_Modelo_IdModelo] FOREIGN KEY([IdModelo])
REFERENCES [dbo].[Modelo] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Anuncio] CHECK CONSTRAINT [FK_Anuncio_Modelo_IdModelo]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[PerfilUsuario]  WITH CHECK ADD  CONSTRAINT [FK_PerfilUsuario_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PerfilUsuario] CHECK CONSTRAINT [FK_PerfilUsuario_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[PerfilUsuario]  WITH CHECK ADD  CONSTRAINT [FK_PerfilUsuario_TipoUsuario_IdTipoUsuario] FOREIGN KEY([IdTipoUsuario])
REFERENCES [dbo].[TipoUsuario] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PerfilUsuario] CHECK CONSTRAINT [FK_PerfilUsuario_TipoUsuario_IdTipoUsuario]
GO
USE [master]
GO
ALTER DATABASE [WebGaragem] SET  READ_WRITE 
GO
