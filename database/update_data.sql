USE [ProjectPrjDB]
GO
/****** Object:  User [quan]    Script Date: 5/28/2025 11:00:58 PM ******/
CREATE USER [quan] FOR LOGIN [quan] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [quan]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [quan]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [quan]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [quan]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [quan]
GO
ALTER ROLE [db_datareader] ADD MEMBER [quan]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [quan]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [quan]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [quan]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/28/2025 11:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Xóa dữ liệu cũ nếu cần
-- DELETE FROM [dbo].[Users] WHERE username = 'username_cần_xóa';
-- GO

-- Thêm dữ liệu mới
INSERT [dbo].[Users] ([username], [password]) VALUES (N'admin', N'admin')
INSERT [dbo].[Users] ([username], [password]) VALUES (N'aido', N'123456')
INSERT [dbo].[Users] ([username], [password]) VALUES (N'chimto', N'12345678')
INSERT [dbo].[Users] ([username], [password]) VALUES (N'khoa', N'12345678')
INSERT [dbo].[Users] ([username], [password]) VALUES (N'quan', N'1')
GO

-- Cập nhật dữ liệu nếu cần
-- UPDATE [dbo].[Users] SET password = 'new_password' WHERE username = 'username_cần_cập_nhật';
-- GO
