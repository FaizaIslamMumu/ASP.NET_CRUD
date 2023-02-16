USE [master]
GO
/****** Object:  Database [AirmanDB2]    Script Date: 01/11/2022 12:29:07 PM ******/
CREATE DATABASE [AirmanDB2]
GO
USE [AirmanDB2]
GO
USE [AirmanDB2]
GO
/****** Object:  Sequence [dbo].[testSequence]    Script Date: 01/11/2022 12:29:07 PM ******/
CREATE SEQUENCE [dbo].[testSequence] 
 AS [bigint]
 START WITH 2
 INCREMENT BY 2
 MINVALUE 2
 MAXVALUE 20
 CYCLE 
 CACHE  10 
GO
/****** Object:  Table [dbo].[tbl_Airman]    Script Date: 01/11/2022 12:29:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Airman](
	[aId] [int] IDENTITY(1,1) NOT NULL,
	[aName] [nvarchar](50) NOT NULL,
	[age] [int] NOT NULL,
	[joinDate] [date] NOT NULL,
	[rankId] [int] NOT NULL,
	[picture] [nvarchar](100) NULL,
	[isInService] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[aId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Rank]    Script Date: 01/11/2022 12:29:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Rank](
	[rankId] [int] IDENTITY(1,1) NOT NULL,
	[rankName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[rankId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_Airman]  WITH CHECK ADD FOREIGN KEY([rankId])
REFERENCES [dbo].[tbl_Rank] ([rankId])
GO
USE [master]
GO
ALTER DATABASE [AirmanDB2] SET  READ_WRITE 
GO
