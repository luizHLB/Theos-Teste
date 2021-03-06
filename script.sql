USE [Library]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 24/03/2019 21:07:13 ******/
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
/****** Object:  Table [dbo].[Book]    Script Date: 24/03/2019 21:07:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[Id] [uniqueidentifier] NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Version] [int] NOT NULL,
	[Active] [bit] NOT NULL,
	[KeyId] [uniqueidentifier] NOT NULL,
	[Title] [varchar](100) NOT NULL,
	[Author] [varchar](100) NOT NULL,
	[Description] [varchar](500) NOT NULL,
	[Image] [varchar](100) NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookKey]    Script Date: 24/03/2019 21:07:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookKey](
	[Id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_BookKey] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Log]    Script Date: 24/03/2019 21:07:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log](
	[Id] [uniqueidentifier] NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Version] [int] NOT NULL,
	[Active] [bit] NOT NULL,
	[OriginId] [uniqueidentifier] NOT NULL,
	[Table] [varchar](100) NOT NULL,
	[Field] [varchar](50) NOT NULL,
	[Value] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Log] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 24/03/2019 21:07:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [uniqueidentifier] NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Version] [int] NOT NULL,
	[Active] [bit] NOT NULL,
	[KeyId] [uniqueidentifier] NOT NULL,
	[Login] [varchar](100) NOT NULL,
	[Password] [varchar](100) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserKey]    Script Date: 24/03/2019 21:07:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserKey](
	[Id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_UserKey] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_BookKey_KeyId] FOREIGN KEY([KeyId])
REFERENCES [dbo].[BookKey] ([Id])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_BookKey_KeyId]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_UserKey_KeyId] FOREIGN KEY([KeyId])
REFERENCES [dbo].[UserKey] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_UserKey_KeyId]
GO

INSERT INTO USERKEY (ID) VALUES
('6D1FC865-8DA6-44F7-9100-7276C570BDA3');

INSERT INTO [USER] (ID, DATE, USERID, VERSION, ACTIVE, KEYID, LOGIN, PASSWORD) values
(NEWID(), GETDATE(), '00000000-0000-0000-0000-000000000000', 1, 1, '6D1FC865-8DA6-44F7-9100-7276C570BDA3', 'admin', 'ILdc/0VG9DUQLdL7hlN+akQi9ttqh9uPSteH0RkHpxA=');

INSERT INTO [dbo].[__EFMigrationsHistory] ([MigrationId],[ProductVersion]) VALUES
('20190324160308_CreateDatabase','2.1.4-rtm-31024');
