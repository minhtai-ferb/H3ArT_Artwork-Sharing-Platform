CREATE DATABASE [ArtworkSharingPlatform]

USE [ArtworkSharingPlatform]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 14/03/2024 1:07:04 CH ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 14/03/2024 1:07:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 14/03/2024 1:07:04 CH ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 14/03/2024 1:07:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [nvarchar](450) NOT NULL,
	[UserId] [nvarchar](225) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 14/03/2024 1:07:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](225) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 14/03/2024 1:07:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](225) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 14/03/2024 1:07:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](225) NOT NULL,
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
	[AvatarImage] [nvarchar](max) NULL,
	[DateOfBirth] [date] NULL,
	[Discriminator] [nvarchar](21) NOT NULL,
	[FullName] [nvarchar](max) NULL,
	[Gender] [bit] NULL,
	[Status] [bit] NULL,
	[avaiblePost] [int] NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 14/03/2024 1:07:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](225) NOT NULL,
	[LoginProvider] [nvarchar](128) NULL,
	[Name] [nvarchar](128) NULL,
	[Value] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblArtwork]    Script Date: 14/03/2024 1:07:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblArtwork](
	[artworkID] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NULL,
	[artistID] [nvarchar](225) NULL,
	[categoryID] [int] NULL,
	[description] [nvarchar](max) NULL,
	[imageURL] [nvarchar](max) NULL,
	[createAt] [datetime2](7) NULL,
	[price] [float] NULL,
	[isPremium] [bit] NULL,
	[isBought] [bit] NULL,
	[reportedConfirm] [bit] NULL,
 CONSTRAINT [PK_tblArtwork] PRIMARY KEY CLUSTERED 
(
	[artworkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBlog]    Script Date: 14/03/2024 1:07:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBlog](
	[blogID] [int] IDENTITY(1,1) NOT NULL,
	[creatorID] [nvarchar](225) NULL,
	[title] [nvarchar](225) NULL,
	[description] [nvarchar](max) NULL,
	[createdAt] [datetime2](7) NULL,
	[imageUrl] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblBlog] PRIMARY KEY CLUSTERED 
(
	[blogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 14/03/2024 1:07:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[categoryID] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [nvarchar](50) NULL,
	[displayOrder] [int] NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 14/03/2024 1:07:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[orderHeaderId] [int] NULL,
	[artworkId] [int] NULL,
	[count] [int] NULL,
	[price] [float] NULL,
 CONSTRAINT [PK_tblOrderDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetailPackage]    Script Date: 14/03/2024 1:07:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetailPackage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[orderHeaderId] [int] NULL,
	[packageId] [int] NULL,
	[price] [float] NULL,
 CONSTRAINT [PK_tblOrderDetailPackage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderHeader]    Script Date: 14/03/2024 1:07:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderHeader](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[applicationUserId] [nvarchar](225) NULL,
	[orderDate] [datetime2](7) NULL,
	[orderTotal] [float] NULL,
	[orderStatus] [nvarchar](max) NULL,
	[paymentStatus] [nvarchar](max) NULL,
	[paymentDate] [datetime2](7) NULL,
	[paymentIntentId] [nvarchar](max) NULL,
	[name] [nvarchar](max) NULL,
	[phoneNumber] [nvarchar](max) NULL,
	[sessionId] [nvarchar](max) NULL,
	[isPackageOrder] [bit] NULL,
 CONSTRAINT [PK_tblOrderHeader] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPackage]    Script Date: 14/03/2024 1:07:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPackage](
	[packageID] [int] IDENTITY(1,1) NOT NULL,
	[packageName] [nvarchar](200) NULL,
	[price] [float] NULL,
	[amountPost] [int] NULL,
	[description] [nvarchar](max) NULL,
	[adminID] [nvarchar](225) NULL,
 CONSTRAINT [PK_tblPackage] PRIMARY KEY CLUSTERED 
(
	[packageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblReportArtist]    Script Date: 14/03/2024 1:07:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblReportArtist](
	[reportArtistID] [int] IDENTITY(1,1) NOT NULL,
	[artistID] [nvarchar](225) NULL,
	[reporterUserID] [nvarchar](225) NULL,
	[reason] [nvarchar](max) NULL,
 CONSTRAINT [PK_ReportArtist] PRIMARY KEY CLUSTERED 
(
	[reportArtistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblReportArtwork]    Script Date: 14/03/2024 1:07:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblReportArtwork](
	[reportArtworkID] [int] IDENTITY(1,1) NOT NULL,
	[artworkID] [int] NULL,
	[reporterUserID] [nvarchar](225) NULL,
	[reason] [nvarchar](max) NULL,
 CONSTRAINT [PK_ReportArtwork] PRIMARY KEY CLUSTERED 
(
	[reportArtworkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblReportBlog]    Script Date: 14/03/2024 1:07:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblReportBlog](
	[reportBlogID] [int] IDENTITY(1,1) NOT NULL,
	[blogID] [int] NULL,
	[reporterUserID] [nvarchar](225) NULL,
	[reason] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblReportBlog] PRIMARY KEY CLUSTERED 
(
	[reportBlogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblShoppingCart]    Script Date: 14/03/2024 1:07:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblShoppingCart](
	[shoppingCartID] [int] IDENTITY(1,1) NOT NULL,
	[buyerID] [nvarchar](225) NULL,
	[artistID] [nvarchar](225) NULL,
	[artworkID] [int] NULL,
	[orderID] [int] NULL,
	[artisticServiceID] [int] NULL,
	[count] [int] NULL,
	[isNew] [bit] NULL,
 CONSTRAINT [PK_tblShoppingCart_1] PRIMARY KEY CLUSTERED 
(
	[shoppingCartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240124175253_addIdentityTable', N'8.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240124180648_ExtendIdentityUser', N'8.0.1')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'52250872-ad29-4dee-b714-03e381be49cf', N'Moderator', N'MODERATOR', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'8606d05d-9f9c-4264-af8f-41eb6a84c25a', N'Creator', N'CREATOR', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'94e32895-2eeb-430b-8593-b50a4f044158', N'Customer', N'CUSTOMER', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'ede018c6-8e8f-4c3f-9758-f98b31890587', N'Admin', N'ADMIN', NULL)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'07c7eadc-5738-464c-bb16-95a5335cb4a5', N'ede018c6-8e8f-4c3f-9758-f98b31890587')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f8655c5f-6a79-47c3-b71b-c8b87067aaf7', N'52250872-ad29-4dee-b714-03e381be49cf')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a4d3a019-da59-45fb-8148-7f6bd60836bd', N'8606d05d-9f9c-4264-af8f-41eb6a84c25a')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'97598e1b-e9ca-4d82-8d08-ad7748506836', N'94e32895-2eeb-430b-8593-b50a4f044158')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'adee750b-4174-45b7-bebb-18e279d58d2a', N'94e32895-2eeb-430b-8593-b50a4f044158')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'92d59e0b-1acf-4d35-a2f4-652e9b8b50be', N'94e32895-2eeb-430b-8593-b50a4f044158')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'47f5f7d5-93ae-47a2-bb73-ca3c66c13d90', N'94e32895-2eeb-430b-8593-b50a4f044158')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'83b4c0db-1e83-4330-9bc4-8eff08fc5dae', N'94e32895-2eeb-430b-8593-b50a4f044158')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3a87c690-0563-4d37-9054-f39ffe1922e8', N'94e32895-2eeb-430b-8593-b50a4f044158')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'694898da-d705-48bb-87cb-e420e3eb7d8a', N'94e32895-2eeb-430b-8593-b50a4f044158')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'528812eb-9287-41e3-a25b-a36230c4aa82', N'94e32895-2eeb-430b-8593-b50a4f044158')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'31685a11-52c8-4a1f-83c2-333c68e437aa', N'52250872-ad29-4dee-b714-03e381be49cf')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'2874f35d-536d-481e-a3b5-23c6011e5933', N'8606d05d-9f9c-4264-af8f-41eb6a84c25a')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AvatarImage], [DateOfBirth], [Discriminator], [FullName], [Gender], [Status], [avaiblePost]) VALUES (N'07c7eadc-5738-464c-bb16-95a5335cb4a5', N'testadmin@gmail.com', N'TESTADMIN@GMAIL.COM', N'testadmin@gmail.com', N'TESTADMIN@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAENOP8LrS0nP5KjFt4B462cp9hxuKo75PvChQRVslaaIA1isTIzGe7TpEgLwWouec6g==', N'HCD4CKZRH3LQIS4LYLDAGI2GMGFMTLQP', N'5d58d78f-00eb-4ec6-b689-597ce694b2d5', N'0337824924', 0, 0, NULL, 1, 0, NULL, NULL, N'ApplicationUser', N'Admin', 1, 1, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AvatarImage], [DateOfBirth], [Discriminator], [FullName], [Gender], [Status], [avaiblePost]) VALUES (N'2874f35d-536d-481e-a3b5-23c6011e5933', N'testcreator2@gmail.com', N'TESTCREATOR2@GMAIL.COM', N'testcreator2@gmail.com', N'TESTCREATOR2@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEO0jtifK4PUpjwKxIrcqU0m2nHm39cjh8NtwNPzp8zX1hJOq4Ou4h0VRuW3AkCZL/Q==', N'BMOZT2Q6THZBOLFYJGSFT4DUJ4CJR23C', N'e88acfc0-f9aa-4c41-953b-fe75e30156a9', NULL, 0, 0, CAST(N'2024-03-04T19:01:57.5647953+07:00' AS DateTimeOffset), 1, 0, NULL, NULL, N'ApplicationUser', N'Creator two', 1, 1, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AvatarImage], [DateOfBirth], [Discriminator], [FullName], [Gender], [Status], [avaiblePost]) VALUES (N'31685a11-52c8-4a1f-83c2-333c68e437aa', N'minhtai7112003@gmail.com', N'MINHTAI7112003@GMAIL.COM', N'minhtai7112003@gmail.com', N'MINHTAI7112003@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEBsnvgG10Os0IAPeOlo9bQ86hzr5Cml0zTnJ9tPbvnsrhNqdWaWfNtkbhc7lWcbsew==', N'A66J5RWJOFGKDHIXJNXF4V7TAWIZVOSG', N'77e1defd-d603-44be-a94f-ce4f562a1f95', N'0336626193', 0, 0, NULL, 1, 0, N'\image\avatar\58b29b8d-9c8c-427b-b97f-8c2a4e25a868.jpg', NULL, N'ApplicationUser', N'Dang Cong Hung', 1, 1, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AvatarImage], [DateOfBirth], [Discriminator], [FullName], [Gender], [Status], [avaiblePost]) VALUES (N'3a87c690-0563-4d37-9054-f39ffe1922e8', N'thanhcong@gmail.com', N'THANHCONG@GMAIL.COM', N'thanhcong@gmail.com', N'THANHCONG@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEBzl++RqiE9Ygkm9ZR7XHzRoh7HuLuy+uFODGRwrQqeF+RbkqU1Zk2nrkGvm7DbWIA==', N'YER2H5DBTNV7INSGKNIPV3HTX77SB3D7', N'1ca4620e-a865-4863-b3c8-44d58899f6bf', NULL, 0, 0, NULL, 1, 0, NULL, NULL, N'ApplicationUser', N'Dang Cong Hung', 1, 1, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AvatarImage], [DateOfBirth], [Discriminator], [FullName], [Gender], [Status], [avaiblePost]) VALUES (N'47f5f7d5-93ae-47a2-bb73-ca3c66c13d90', N'1@gmail.com', N'1@GMAIL.COM', N'1@gmail.com', N'1@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEPUeRtAUEJXMYBV6dKWCwEelremnAOYKplntcGzWrsf0Za/zXWVX38t2tqvnDMWtrg==', N'IMWQIUJI74TCP4TI3VFENMQXNB2WYWCO', N'91054b74-c991-491a-938c-35b8358ed92f', NULL, 0, 0, CAST(N'3024-03-13T06:09:39.4184725+07:00' AS DateTimeOffset), 1, 0, NULL, NULL, N'ApplicationUser', N'Nguyen Tan Hung', 1, 1, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AvatarImage], [DateOfBirth], [Discriminator], [FullName], [Gender], [Status], [avaiblePost]) VALUES (N'528812eb-9287-41e3-a25b-a36230c4aa82', N'hungne@gmail.com', N'HUNGNE@GMAIL.COM', N'hungne@gmail.com', N'HUNGNE@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAECRNy8BlKmm1LUjL2L76VhlrhXN9DKd6u/Hn1vlTHSmy9YrjpQPBulfsEEGYyz1rdw==', N'UWAN4JRDH7KKDGSXSJ7P7WMEJA2KZNXW', N'671dfda1-db51-43eb-bb92-3e038dc684a5', NULL, 0, 0, NULL, 1, 0, NULL, NULL, N'ApplicationUser', N'Dang Cong Hung', 0, 1, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AvatarImage], [DateOfBirth], [Discriminator], [FullName], [Gender], [Status], [avaiblePost]) VALUES (N'694898da-d705-48bb-87cb-e420e3eb7d8a', N'thanhcongchac@gmail.com', N'THANHCONGCHAC@GMAIL.COM', N'thanhcongchac@gmail.com', N'THANHCONGCHAC@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEGKzcDtHThusMd1o01yZ+qPeYS0DzpRdZ2hV8CiCta5k7tdOmvrKvAJJmFd9LgLj8Q==', N'AFYKZAJH7PNGXBJRKISC5JQEOQWGFFLS', N'de00638d-15a8-4d06-8f65-b1450ffca5f2', NULL, 0, 0, NULL, 1, 0, NULL, NULL, N'ApplicationUser', N'Dang Cong Hung', 1, 1, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AvatarImage], [DateOfBirth], [Discriminator], [FullName], [Gender], [Status], [avaiblePost]) VALUES (N'83b4c0db-1e83-4330-9bc4-8eff08fc5dae', N'hungdang@gmail.com', N'HUNGDANG@GMAIL.COM', N'hungdang@gmail.com', N'HUNGDANG@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEJKg6/ex4jWlR1dbIFXbOiz/WKbbVQcFZJ9Y68P4tfE2uFkeyfcvbXSZXtpFBmvTBQ==', N'2NHSR7FWV5RYXQMVXSVODHFHQVLQABVJ', N'9b5d2c70-30a2-46f3-a806-6f7d29b8e442', NULL, 0, 0, NULL, 1, 0, NULL, NULL, N'ApplicationUser', N'Dang Cong Hung', 0, 1, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AvatarImage], [DateOfBirth], [Discriminator], [FullName], [Gender], [Status], [avaiblePost]) VALUES (N'92d59e0b-1acf-4d35-a2f4-652e9b8b50be', N'1234@gmail.com', N'1234@GMAIL.COM', N'1234@gmail.com', N'1234@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEOSIcKq8gjsLRGPHwbCYHzPT4iumoAKSmPLZQgRJBjIYY3Vp1XE0P6pd+8QsQRBvUw==', N'COQMX7IX7QPCKWYPWL3O4IIY4SBDQ54R', N'f7697047-6617-457f-9e47-1452eddc607f', NULL, 0, 0, CAST(N'3024-03-14T10:13:23.8394279+07:00' AS DateTimeOffset), 1, 0, NULL, NULL, N'ApplicationUser', N'Nguyen Huu Minh Tai', 1, 1, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AvatarImage], [DateOfBirth], [Discriminator], [FullName], [Gender], [Status], [avaiblePost]) VALUES (N'97598e1b-e9ca-4d82-8d08-ad7748506836', N'testcustomer@gmail.com', N'TESTCUSTOMER@GMAIL.COM', N'testcustomer@gmail.com', N'TESTCUSTOMER@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEHQATHLknqr49mBlxWNsTgaICvnC6lrBFuuFw0di+oElW5tgvFVeLjMlYHowuF82og==', N'M3CTSQEIWSJHOK6ZRJXLVW3ZUYDQ3SZH', N'affe3a79-1351-4501-a631-b8f902ffd491', NULL, 0, 0, CAST(N'2024-02-29T14:17:47.7524398+07:00' AS DateTimeOffset), 1, 0, NULL, NULL, N'ApplicationUser', N'Nguyen Huu Minh Tai', 1, 1, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AvatarImage], [DateOfBirth], [Discriminator], [FullName], [Gender], [Status], [avaiblePost]) VALUES (N'a4d3a019-da59-45fb-8148-7f6bd60836bd', N'testcreator@gmail.com', N'TESTCREATOR@GMAIL.COM', N'testcreator@gmail.com', N'TESTCREATOR@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEF+MDMaXzVEMGjUekqUDC8u46UCPwvHJFZOYFCHq8yGYv6Mia6bgP6eUJCeYN+XwPw==', N'CPRNVV5JYFMMB2BRG6QWIXX6DQOHMWGH', N'ef577da0-72b3-4e03-917e-0c3fb5b7f43e', N'0336626193', 0, 0, CAST(N'2024-03-14T10:14:49.0538100+07:00' AS DateTimeOffset), 1, 0, N'\image\avatar\92095ea3-0849-4868-bd4c-52342db54bc3.jpg', NULL, N'ApplicationUser', N'Dang Cong Hung', 1, 0, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AvatarImage], [DateOfBirth], [Discriminator], [FullName], [Gender], [Status], [avaiblePost]) VALUES (N'adee750b-4174-45b7-bebb-18e279d58d2a', N'123@gmail.com', N'123@GMAIL.COM', N'123@gmail.com', N'123@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEF/TdQnqjzF9V9ysWOZHul0jA5A965F4QlalW1yxnHGfZ77aeu+bF3k/7fMirsDhbA==', N'664UIYOGJ6WM6FFZTV3PN2TADZK7YYYG', N'804ee65b-d796-4b1a-971d-2c36cc2caa38', NULL, 0, 0, NULL, 1, 0, NULL, NULL, N'ApplicationUser', N'Pham Le Quy Anh', 1, 1, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AvatarImage], [DateOfBirth], [Discriminator], [FullName], [Gender], [Status], [avaiblePost]) VALUES (N'f8655c5f-6a79-47c3-b71b-c8b87067aaf7', N'testmoderator@gmail.com', N'TESTMODERATOR@GMAIL.COM', N'testmoderator@gmail.com', N'TESTMODERATOR@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEKoy2V5rPr2dam+1DunuazyiY+DFIG1hzqRytnQIf9e6uA3G2pyJQHLiuCEMhPyGHQ==', N'XQSNHMAHTJJC7OEBRXX2JK42KNBU26Q6', N'87607848-da72-4543-a10b-bd8a2fe04de7', N'0336626193', 0, 0, NULL, 1, 0, NULL, NULL, N'ApplicationUser', N'Pham Le Quy Anh', 1, 1, NULL)
GO
INSERT [dbo].[AspNetUserTokens] ([UserId], [LoginProvider], [Name], [Value]) VALUES (N'07c7eadc-5738-464c-bb16-95a5335cb4a5', N'[AspNetUserStore]', N'AuthenticatorKey', N'UD5MYI7LLF6RFQS6HM7QBXXSOJ5YZXZR')
INSERT [dbo].[AspNetUserTokens] ([UserId], [LoginProvider], [Name], [Value]) VALUES (N'a4d3a019-da59-45fb-8148-7f6bd60836bd', N'[AspNetUserStore]', N'AuthenticatorKey', N'S7OFMV3RBUV6ZL42ZELQO6JYWHL6GJLK')
INSERT [dbo].[AspNetUserTokens] ([UserId], [LoginProvider], [Name], [Value]) VALUES (N'f8655c5f-6a79-47c3-b71b-c8b87067aaf7', N'[AspNetUserStore]', N'AuthenticatorKey', N'XBMYSZIYBLEFWAPYA7AIFCW42AJOH5AR')
GO
SET IDENTITY_INSERT [dbo].[tblArtwork] ON 

INSERT [dbo].[tblArtwork] ([artworkID], [title], [artistID], [categoryID], [description], [imageURL], [createAt], [price], [isPremium], [isBought], [reportedConfirm]) VALUES (2, N'Artwork 2', N'a4d3a019-da59-45fb-8148-7f6bd60836bd', 1, N'The swirling night sky dances with vibrant hues of blue and yellow, capturing the imagination with its tumultuous energy. A crescent moon hangs serenely amidst the tumult, casting its gentle glow over the quaint village below. The cypress trees reach desperately towards the heavens, their dark silhouettes contrasting sharply against the luminous backdrop. Van Gogh''s masterful strokes create a sense of movement and emotion, inviting the viewer to lose themselves in the mesmerizing beauty of the night.', N'https://i.pinimg.com/564x/19/75/d6/1975d6e559da17936176eb6168161089.jpg', CAST(N'2024-02-02T02:36:29.4000000' AS DateTime2), 100, 0, 0, 0)
INSERT [dbo].[tblArtwork] ([artworkID], [title], [artistID], [categoryID], [description], [imageURL], [createAt], [price], [isPremium], [isBought], [reportedConfirm]) VALUES (3, N'Artwork 3', N'a4d3a019-da59-45fb-8148-7f6bd60836bd', 2, N'In Dalí''s surreal landscape, time appears to melt away like the soft, drooping clocks that litter the scene. The barren landscape is bathed in an eerie light, casting shadows that seem to stretch and warp with the passage of time. A solitary figure, perhaps a represe...', N'https://media.cnn.com/api/v1/images/stellar/prod/190430171751-mona-lisa.jpg?q=w_3000,h_4470,x_0,y_0,c_fill', CAST(N'2024-02-02T02:36:29.4000000' AS DateTime2), 150, 1, 0, 0)
INSERT [dbo].[tblArtwork] ([artworkID], [title], [artistID], [categoryID], [description], [imageURL], [createAt], [price], [isPremium], [isBought], [reportedConfirm]) VALUES (4, N'Artwork 4', N'a4d3a019-da59-45fb-8148-7f6bd60836bd', 3, N'A towering wave looms menacingly overhead, its frothy crest frozen in time against a backdrop of serene Mount Fuji. The tiny boats below are dwarfed by the sheer power and scale of nature, struggling to navigate the treacherous waters. Hokusai''s use of bold lines and dynamic composition captures the raw energy and majesty of the ocean, while the distant silhouette of Mount Fuji serves as a symbol of enduring strength and tranquility amidst the chaos.', N'https://news.artnet.com/app/news-upload/2014/07/Johannes_Vermeer_1632-1675_-_The_Girl_With_The_Pearl_Earring_1665-e1435072137333.jpg', CAST(N'2024-02-02T02:36:29.4000000' AS DateTime2), 200, 1, 0, 0)
INSERT [dbo].[tblArtwork] ([artworkID], [title], [artistID], [categoryID], [description], [imageURL], [createAt], [price], [isPremium], [isBought], [reportedConfirm]) VALUES (5, N'Artwork 5', N'a4d3a019-da59-45fb-8148-7f6bd60836bd', 4, N'The artwork depicts a serene landscape with a small boat sailing on a tranquil river. The warm sunlight bathes the scene, casting long shadows and creating a peaceful atmosphere. The artist has captured the beauty of nature with delicate brushstrokes and vibrant colors, inviting the viewer to escape into this idyllic setting.', N'https://www.singulart.com/blog/wp-content/uploads/2023/09/Self-portrait-with-Straw-Hat-1887-88.jpg', CAST(N'2024-02-02T02:36:29.4000000' AS DateTime2), 120, 1, 1, 0)
INSERT [dbo].[tblArtwork] ([artworkID], [title], [artistID], [categoryID], [description], [imageURL], [createAt], [price], [isPremium], [isBought], [reportedConfirm]) VALUES (6, N'Artwork 6', N'a4d3a019-da59-45fb-8148-7f6bd60836bd', 5, N'The vibrant colors and dynamic composition of the artwork evoke a sense of energy and movement. The artists bold use of shapes and lines creates a visually striking piece that captivates the viewer attention. Through this artwork, the artist explores themes of life, vitality, and the interconnectedness of all things.', N'https://www.getty.edu/art/exhibitions/19th_century_highlights/images/1_00089801_2000x2000_x1024.jpg', CAST(N'2024-02-02T02:36:29.4000000' AS DateTime2), 180, 1, 1, 0)
INSERT [dbo].[tblArtwork] ([artworkID], [title], [artistID], [categoryID], [description], [imageURL], [createAt], [price], [isPremium], [isBought], [reportedConfirm]) VALUES (7, N'Artwork 7', N'a4d3a019-da59-45fb-8148-7f6bd60836bd', 1, N'The artwork portrays a serene countryside scene, with rolling hills and lush greenery. A winding path leads the viewers eye through the landscape, inviting them to explore its beauty. The artist has captured the tranquility of the countryside with delicate brushstrokes and soft, muted colors, creating a sense of peace and harmony.', N'https://d3d00swyhr67nd.cloudfront.net/w1200h1200/collection/LNE/RAFM/LNE_RAFM_FA05477-001.jpg', CAST(N'2024-02-02T02:36:29.4000000' AS DateTime2), 90, 0, 0, 0)
INSERT [dbo].[tblArtwork] ([artworkID], [title], [artistID], [categoryID], [description], [imageURL], [createAt], [price], [isPremium], [isBought], [reportedConfirm]) VALUES (8, N'Artwork 8', N'a4d3a019-da59-45fb-8148-7f6bd60836bd', 2, N'The artwork depicts a bustling cityscape, alive with activity and energy. Bright lights illuminate the streets, casting vibrant reflections in the rain-soaked pavement below. The artist has captured the frenetic pace of urban life with bold brushstrokes and dynamic composition, creating a sense of movement and vitality.', N'https://media.mutualart.com/Images//2022_02/14/07/071558039/a6477e77-09c7-479e-b297-6a9c7285ba01.Jpeg', CAST(N'2024-02-02T02:36:29.4000000' AS DateTime2), 160, 1, 0, 0)
INSERT [dbo].[tblArtwork] ([artworkID], [title], [artistID], [categoryID], [description], [imageURL], [createAt], [price], [isPremium], [isBought], [reportedConfirm]) VALUES (9, N'Artwork 9', N'a4d3a019-da59-45fb-8148-7f6bd60836bd', 3, N'The artwork portrays a tranquil garden scene, with colorful flowers blooming amidst lush green foliage. A gentle breeze rustles the leaves of the trees, creating a sense of movement and life. The artist has captured the beauty of nature with delicate brushstrokes and vibrant colors, inviting the viewer to escape into this idyllic setting.', N'https://upload.wikimedia.org/wikipedia/commons/2/2b/Portrait_of_a_gentleman_at_an_organ_English_19th_century.jpg', CAST(N'2024-02-02T02:36:29.4000000' AS DateTime2), 220, 1, 0, 0)
INSERT [dbo].[tblArtwork] ([artworkID], [title], [artistID], [categoryID], [description], [imageURL], [createAt], [price], [isPremium], [isBought], [reportedConfirm]) VALUES (10, N'Artwork 10', N'a4d3a019-da59-45fb-8148-7f6bd60836bd', 4, N'The artwork depicts a serene seascape, with waves crashing against jagged cliffs. A storm brews on the horizon, casting dark clouds across the sky. The artist has captured the power and majesty of the ocean with bold brushstrokes and dynamic composition, creating a sense of drama and tension.', N'https://hips.hearstapps.com/hmg-prod/images/vincent_van_gogh_self_portrait_painting_musee_dorsay_via_wikimedia_commons_promojpg.jpg', CAST(N'2024-02-02T02:36:29.4000000' AS DateTime2), 130, 0, 0, 0)
INSERT [dbo].[tblArtwork] ([artworkID], [title], [artistID], [categoryID], [description], [imageURL], [createAt], [price], [isPremium], [isBought], [reportedConfirm]) VALUES (11, N'Artwork 11', N'a4d3a019-da59-45fb-8148-7f6bd60836bd', 5, N'The artwork portrays a tranquil forest scene, with sunlight filtering through the trees and casting dappled shadows on the forest floor. A winding path leads the viewer deeper into the woods, inviting them to explore its beauty. The artist has captured the serenity of the forest with delicate brushstrokes and soft, muted colors, creating a sense of peace and tranquility.', N'https://image.invaluable.com/housePhotos/potomackcompany/37/722837/H1122-L287813289_original.JPG', CAST(N'2024-02-02T02:36:29.4000000' AS DateTime2), 190, 1, 0, 0)
INSERT [dbo].[tblArtwork] ([artworkID], [title], [artistID], [categoryID], [description], [imageURL], [createAt], [price], [isPremium], [isBought], [reportedConfirm]) VALUES (12, N'Artwork 12', N'a4d3a019-da59-45fb-8148-7f6bd60836bd', 1, N'The artwork depicts a majestic mountain landscape, with snow-capped peaks rising into the sky. A winding river cuts through the valley below, reflecting the beauty of the surrounding scenery. The artist has captured the grandeur of the mountains with bold brushstrokes and dynamic composition, creating a sense of awe and wonder.', N'https://i.ebayimg.com/images/g/-dAAAOSwh8djxFll/s-l1200.webp', CAST(N'2024-02-02T02:36:29.4000000' AS DateTime2), 110, 0, 0, 0)
INSERT [dbo].[tblArtwork] ([artworkID], [title], [artistID], [categoryID], [description], [imageURL], [createAt], [price], [isPremium], [isBought], [reportedConfirm]) VALUES (13, N'Artwork 13', N'a4d3a019-da59-45fb-8148-7f6bd60836bd', 2, N'The artwork portrays a serene beach scene, with palm trees swaying in the gentle breeze and waves lapping at the shore. The warm sunlight bathes the scene, casting long shadows and creating a peaceful atmosphere. The artist has captured the beauty of the beach with delicate brushstrokes and vibrant colors, inviting the viewer to escape into this idyllic setting.', N'https://media.mutualart.com/Images//2019_06/28/15/152450767/58a8ff20-98f6-4ba2-ab5d-b7434e599d7a.Jpeg', CAST(N'2024-02-02T02:36:29.4000000' AS DateTime2), 170, 1, 0, 0)
INSERT [dbo].[tblArtwork] ([artworkID], [title], [artistID], [categoryID], [description], [imageURL], [createAt], [price], [isPremium], [isBought], [reportedConfirm]) VALUES (14, N'Artwork 14', N'a4d3a019-da59-45fb-8148-7f6bd60836bd', 3, N'The artwork depicts a vibrant cityscape, alive with color and movement. Bright lights illuminate the streets, casting vibrant reflections in the rain-soaked pavement below. The artist has captured the energy and vitality of the city with bold brushstrokes and dynamic composition, creating a sense of excitement and wonder.', N'https://www.hunterandrose.co.uk/cdn/shop/products/DSC_0440ok_1024x1024.jpg?v=1600342904', CAST(N'2024-02-02T02:36:29.4000000' AS DateTime2), 230, 1, 0, 0)
INSERT [dbo].[tblArtwork] ([artworkID], [title], [artistID], [categoryID], [description], [imageURL], [createAt], [price], [isPremium], [isBought], [reportedConfirm]) VALUES (15, N'Artwork 15', N'a4d3a019-da59-45fb-8148-7f6bd60836bd', 4, N'The artwork portrays a tranquil countryside scene, with rolling hills and lush green fields stretching into the distance. A winding road leads the viewers eye through the landscape, inviting them to explore its beauty. The artist has captured the tranquility of the countryside with delicate brushstrokes and soft, muted colors, creating a sense of peace and harmony.', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxEpJnx0GdNSzdZJIqE-l3GLN6KQ21k4wMZU8V21FUkcVe-IpuW-qICo_wfn9H7NQzVLc&usqp=CAU', CAST(N'2024-02-02T02:36:29.4000000' AS DateTime2), 140, 0, 0, 0)
INSERT [dbo].[tblArtwork] ([artworkID], [title], [artistID], [categoryID], [description], [imageURL], [createAt], [price], [isPremium], [isBought], [reportedConfirm]) VALUES (16, N'Artwork 16', N'a4d3a019-da59-45fb-8148-7f6bd60836bd', 5, N'The artwork depicts a bustling market scene, with vendors selling their wares amidst a cacophony of sights and sounds. Brightly colored fabrics hang from awnings, while exotic fruits and spices fill the air with their sweet scent. The artist has captured the vibrancy of the market with bold brushstrokes and dynamic composition, creating a sense of excitement and energy.', N'https://cdn2.picryl.com/photo/1836/12/31/ada-lovelacefxd-b693d4-640.jpg', CAST(N'2024-02-02T02:36:29.4000000' AS DateTime2), 200, 1, 0, 0)
INSERT [dbo].[tblArtwork] ([artworkID], [title], [artistID], [categoryID], [description], [imageURL], [createAt], [price], [isPremium], [isBought], [reportedConfirm]) VALUES (17, N'Artwork 17', N'a4d3a019-da59-45fb-8148-7f6bd60836bd', 1, N'The artwork portrays a tranquil garden scene, with colorful flowers blooming amidst lush green foliage. A gentle breeze rustles the leaves of the trees, creating a sense of movement and life. The artist has captured the beauty of nature with delicate brushstrokes and vibrant colors, inviting the viewer to escape into this idyllic setting.', N'https://i.pinimg.com/736x/cb/02/1e/cb021e1342f32fab891a347f3ed7cd10.jpg', CAST(N'2024-02-02T02:36:29.4000000' AS DateTime2), 120, 0, 0, 0)
INSERT [dbo].[tblArtwork] ([artworkID], [title], [artistID], [categoryID], [description], [imageURL], [createAt], [price], [isPremium], [isBought], [reportedConfirm]) VALUES (18, N'Artwork 18', N'a4d3a019-da59-45fb-8148-7f6bd60836bd', 2, N'The artwork depicts a serene beach scene, with palm trees swaying in the gentle breeze and waves lapping at the shore. The warm sunlight bathes the scene, casting long shadows and creating a peaceful atmosphere. The artist has captured the beauty of the beach with delicate brushstrokes and vibrant colors, inviting the viewer to escape into this idyllic setting.', N'https://images.fineartamerica.com/images/artworkimages/mediumlarge/1/german-master-1st-half-of-the-19th-century--portrait-of-a-young-gentleman-german-master.jpg', CAST(N'2024-02-02T02:36:29.4000000' AS DateTime2), 180, 1, 0, 0)
INSERT [dbo].[tblArtwork] ([artworkID], [title], [artistID], [categoryID], [description], [imageURL], [createAt], [price], [isPremium], [isBought], [reportedConfirm]) VALUES (19, N'Artwork 19', N'a4d3a019-da59-45fb-8148-7f6bd60836bd', 3, N'The artwork portrays a tranquil forest scene, with sunlight filtering through the trees and casting dappled shadows on the forest floor. A winding path leads the viewer deeper into the woods, inviting them to explore its beauty. The artist has captured the serenity of the forest with delicate brushstrokes and soft, muted colors, creating a sense of peace and tranquility.', N'https://cdn.mos.cms.futurecdn.net/CttrhmaDBRtmT6gj3iNRdn-320-80.jpeg', CAST(N'2024-02-02T02:36:29.4000000' AS DateTime2), 240, 1, 0, 0)
INSERT [dbo].[tblArtwork] ([artworkID], [title], [artistID], [categoryID], [description], [imageURL], [createAt], [price], [isPremium], [isBought], [reportedConfirm]) VALUES (20, N'Artwork 20', N'a4d3a019-da59-45fb-8148-7f6bd60836bd', 4, N'The artwork depicts a bustling cityscape, alive with activity and energy. Bright lights illuminate the streets, casting vibrant reflections in the rain-soaked pavement below. The artist has captured the frenetic pace of urban life with bold brushstrokes and dynamic composition, creating a sense of movement and vitality.', N'https://image.invaluable.com/housePhotos/andrewjonesauctions/33/689833/H21356-L234915322_original.JPG', CAST(N'2024-02-02T02:36:29.4000000' AS DateTime2), 150, 0, 0, 0)
INSERT [dbo].[tblArtwork] ([artworkID], [title], [artistID], [categoryID], [description], [imageURL], [createAt], [price], [isPremium], [isBought], [reportedConfirm]) VALUES (21, N'Tên tác phẩm 20', N'a4d3a019-da59-45fb-8148-7f6bd60836bd', 5, N'Mô tả tác phẩm 20', N'https://image.invaluable.com/housePhotos/potomackcompany/23/743723/H1122-L324891066.JPG', CAST(N'2024-02-02T02:36:29.4000000' AS DateTime2), 210, 1, 0, 0)
INSERT [dbo].[tblArtwork] ([artworkID], [title], [artistID], [categoryID], [description], [imageURL], [createAt], [price], [isPremium], [isBought], [reportedConfirm]) VALUES (74, N'123123aaaaa', N'2874f35d-536d-481e-a3b5-23c6011e5933', 4, N'<p>hfufejfhfncj 12421nfs 124214 kasdsaf</p>', N'\image\artwork\3d6329af-27f3-488f-a517-5bab3e9d6461.jpg', CAST(N'2024-03-13T23:50:56.5256022' AS DateTime2), 214, 1, 1, 0)
SET IDENTITY_INSERT [dbo].[tblArtwork] OFF
GO
SET IDENTITY_INSERT [dbo].[tblBlog] ON 

INSERT [dbo].[tblBlog] ([blogID], [creatorID], [title], [description], [createdAt], [imageUrl]) VALUES (1, N'2874f35d-536d-481e-a3b5-23c6011e5933', N'You Just Bought a Painting at Art Basel. Now What?
', N'Most losses occur in transit, making professional art handlers essential for packing and crating. Consider, for example, a collector who was told by the general carrier he used that the sculpture he purchased overseas and was shipping to his home was lost and could not be located. Or the collector who used a general contents moving company to transport a high-value painting only to see the work arrive with bubble wrap stuck to the acrylic paint and surface scratches from not being properly packed and secured within the truck. Chubb’s specialists can advise on packing best practices and can connect clients with best-in-class transporters. If the artwork needs to travel a long distance, it’s important to confirm whether the shipper will use a subcontractor – and if so, ensure all trucks follow the same protective measures such as air-ride suspension, climate controls, GPS tracking, and alarms, with two drivers so trucks are not unattended. ', CAST(N'2024-04-02T00:00:00.0000000' AS DateTime2), N'https://upload.wikimedia.org/wikipedia/commons/1/16/ART_Basel_2009-06-10.jpg')
INSERT [dbo].[tblBlog] ([blogID], [creatorID], [title], [description], [createdAt], [imageUrl]) VALUES (7, N'2874f35d-536d-481e-a3b5-23c6011e5933', N'Ancient Frescoes of Mythological Refugee Siblings ', N'A fresco depicting two Greek mythological siblings Phrixus and Helle has been found in the ancient Roman city Pompeii.

“History has repeated itself,” the director of Pompeii Archaeological Park Gabriel Zuchtriegel said, according to the Guardian, in an update on the excavation and restoration work. “It is a beautiful fresco in an excellent state of conservation. The myth of Phrixus and Helle is widespread at Pompeii but it is topical too. They are two refugees at sea, a brother and sister, forced to flee because their stepmother wants rid of them and she does so with deception and corruption. She [Helle] fell into the water and drowned.”', CAST(N'2024-02-02T00:00:00.0000000' AS DateTime2), N'https://greekreporter.com/wp-content/uploads/2024/03/pompeii-ancient-greek-siblings-credit-archaeological-park-pompeii.jpg')
INSERT [dbo].[tblBlog] ([blogID], [creatorID], [title], [description], [createdAt], [imageUrl]) VALUES (8, N'2874f35d-536d-481e-a3b5-23c6011e5933', N'Joan Semmel Details Her Painting on A.i.A.’s', N'I use myself as a model, but I don’t think of my works as self-portraits. Portraits talk about characters in more specific ways, whereas I just use myself as the model because it’s convenient, and because I don’t want to objectify anyone else. In this particular painting, I used two versions of the same model. The couch image has usually been seductive in nature, with a nude spread out and being relatively sexy. I’m painting myself, an older person, in contrast to that. One image is of my older body in a seductive pose, but the second image, [the one on the cover], shows me in a much more defensive posture. The figure is holding her arm up, almost as if warding off the viewer. ', CAST(N'2024-01-01T00:00:00.0000000' AS DateTime2), N'https://static01.nyt.com/images/2021/11/15/t-magazine/15tmag-semmel-slide-NSBO/15tmag-semmel-slide-NSBO-superJumbo.jpg')
INSERT [dbo].[tblBlog] ([blogID], [creatorID], [title], [description], [createdAt], [imageUrl]) VALUES (9, N'a4d3a019-da59-45fb-8148-7f6bd60836bd', N'Cyber Deals on Tech for Artists Continue Today—Updated', N'It’s Cyber Monday! Not all sale items are actually good buys, but we’ve done the research and found real (if sometimes modest) deals on electronics, photography gear, and software. Our recommendations below will help you get a jump on your holiday gift shopping for family, friends, and even yourself. We’ll be updating this page throughout the weekend, so check back often.

How we pick each product:
Our mission is to recommend the most appropriate artists’ tool or supply for your needs. Whether you are looking for top-of-the line equipment or beginners’ basics, we’ll make sure that you get good value for your money by doing the research for you. We scour the Internet for information on how art supplies are used and read customer reviews by real users; we ask experts for their advice; and of course, we rely on our own accumulated expertise as artists, teachers, and craftspeople.', CAST(N'2023-11-21T00:00:00.0000000' AS DateTime2), N'https://img.freepik.com/premium-photo/digital-camera-table_980804-776.jpg')
INSERT [dbo].[tblBlog] ([blogID], [creatorID], [title], [description], [createdAt], [imageUrl]) VALUES (10, N'a4d3a019-da59-45fb-8148-7f6bd60836bd', N'Cyber Deals on Art Supplies and Gifts Continue Today', N'<p><span style="font-family: ''trebuchet ms'', geneva, sans-serif;">It&rsquo;s Cyber Monday! Many US retailers have marked down selected wares, including art and craft supplies. To help you parse the offerings, we&rsquo;ll be tracking some of the best deals on artists&rsquo; tools, from pastels to tablets, to give as gifts or to keep for yourself. We will be updating this page, so check in with us often. A word of advice: Move fast, as many of these products will sell out quickly. (All prices current at time of publication.) How we pick each product: Our mission is to recommend the most appropriate artists&rsquo; tool or supply for your needs. Whether you are looking for top-of-the line equipment or beginners&rsquo; basics, we&rsquo;ll make sure that you get good value for your money by doing the research for you. We scour the Internet for information on how art supplies are used and read customer reviews by real users; we ask experts for their advice; and of course, we rely on our own accumulated expertise as artists, teachers, and craftspeople.</span></p>', CAST(N'2024-01-01T00:00:00.0000000' AS DateTime2), N'https://www.veganeasy.org/wp-content/uploads/2022/08/vegan_art_materials_101.jpg')
INSERT [dbo].[tblBlog] ([blogID], [creatorID], [title], [description], [createdAt], [imageUrl]) VALUES (11, N'a4d3a019-da59-45fb-8148-7f6bd60836bd', N'The Best Gel Pens for Writers, Artists, and Students', N'Overwhelmed by which pen to buy? That’s understandable, considering that there are many types of pens, not to mention hundreds of different brands and designs within these types. Consider the gel pen, which offers a pleasurable and user-friendly writing experience. Like ballpoint and rollerball pens, they feature a small revolving ball at the tip that deposits ink from the pen’s reservoir to the paper. The difference is while ballpoint pens use thick, oil-based inks, and rollerballs use a free-flowing, water- and dye-based ink, gel pens use ink made of pigment in a water-based gel made from xanthan gum and polyacrylate thickeners. What you get are particularly vibrant lines that flow smoothly so you can apply less pressure as you write. They are also generally the best pick for signing documents because of their pigment load, which makes your checks and other vital documents resistant to tampering. The ink does tend to take a bit longer to dry, however, which can be a problem for lefties (but see the Zebra Sarasa below). Dive into some of our favorites in this family, below.

', CAST(N'2024-01-01T00:00:00.0000000' AS DateTime2), N'https://www.truphaeinc.com/cdn/shop/articles/image1.jpg?v=1681507933')
SET IDENTITY_INSERT [dbo].[tblBlog] OFF
GO
SET IDENTITY_INSERT [dbo].[tblCategory] ON 

INSERT [dbo].[tblCategory] ([categoryID], [categoryName], [displayOrder]) VALUES (1, N'Painting', 1)
INSERT [dbo].[tblCategory] ([categoryID], [categoryName], [displayOrder]) VALUES (2, N'Sculpture', 2)
INSERT [dbo].[tblCategory] ([categoryID], [categoryName], [displayOrder]) VALUES (3, N'Photography', 2)
INSERT [dbo].[tblCategory] ([categoryID], [categoryName], [displayOrder]) VALUES (4, N'Digital Art', 5)
INSERT [dbo].[tblCategory] ([categoryID], [categoryName], [displayOrder]) VALUES (5, N'Mixed Media', 4)
SET IDENTITY_INSERT [dbo].[tblCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[tblOrderDetail] ON 

INSERT [dbo].[tblOrderDetail] ([Id], [orderHeaderId], [artworkId], [count], [price]) VALUES (89, 50, 6, 1, 180)
INSERT [dbo].[tblOrderDetail] ([Id], [orderHeaderId], [artworkId], [count], [price]) VALUES (90, 51, 8, 1, 160)
INSERT [dbo].[tblOrderDetail] ([Id], [orderHeaderId], [artworkId], [count], [price]) VALUES (92, 53, 74, 1, 214)
INSERT [dbo].[tblOrderDetail] ([Id], [orderHeaderId], [artworkId], [count], [price]) VALUES (93, 54, 74, 1, 214)
SET IDENTITY_INSERT [dbo].[tblOrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[tblOrderHeader] ON 

INSERT [dbo].[tblOrderHeader] ([Id], [applicationUserId], [orderDate], [orderTotal], [orderStatus], [paymentStatus], [paymentDate], [paymentIntentId], [name], [phoneNumber], [sessionId], [isPackageOrder]) VALUES (49, N'2874f35d-536d-481e-a3b5-23c6011e5933', CAST(N'2024-03-13T23:39:03.4049301' AS DateTime2), 999, N'Done', N'Approved', CAST(N'2024-03-13T23:39:52.5375713' AS DateTime2), N'pi_3OtuqGAKnLcEuWdy0kPctMQi', N'Hung Dep Trai', N'0336626193', N'cs_test_a13HdxEWVMvGFJISTYZ85J26zHixqNd6On4g8ld6UEx8g5woHUziH15uTQ', 1)
INSERT [dbo].[tblOrderHeader] ([Id], [applicationUserId], [orderDate], [orderTotal], [orderStatus], [paymentStatus], [paymentDate], [paymentIntentId], [name], [phoneNumber], [sessionId], [isPackageOrder]) VALUES (50, N'2874f35d-536d-481e-a3b5-23c6011e5933', CAST(N'2024-03-13T23:40:52.6731376' AS DateTime2), 180, N'Approved', N'Approved', CAST(N'2024-03-13T23:41:20.8871342' AS DateTime2), N'pi_3OturhAKnLcEuWdy2dEBb3b3', N'Creator two', N'0336626193', N'cs_test_a1hfuRPZ0SqKb76PhwZIP9HanYazPZ0EeMNbgmN3KeojG40YpF1PNOuriV', NULL)
INSERT [dbo].[tblOrderHeader] ([Id], [applicationUserId], [orderDate], [orderTotal], [orderStatus], [paymentStatus], [paymentDate], [paymentIntentId], [name], [phoneNumber], [sessionId], [isPackageOrder]) VALUES (51, N'2874f35d-536d-481e-a3b5-23c6011e5933', CAST(N'2024-03-13T23:44:27.6439266' AS DateTime2), 160, N'Cancelled', N'Cancelled', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, N'Creator two', N'0336626193', N'cs_test_a18ftwpvH21hc6UIcUwcfHV5QlBwfu9bpzN3B7AFlIytCVixYRptx9rkP2', NULL)
INSERT [dbo].[tblOrderHeader] ([Id], [applicationUserId], [orderDate], [orderTotal], [orderStatus], [paymentStatus], [paymentDate], [paymentIntentId], [name], [phoneNumber], [sessionId], [isPackageOrder]) VALUES (52, N'2874f35d-536d-481e-a3b5-23c6011e5933', CAST(N'2024-03-13T23:45:04.6443713' AS DateTime2), 160, N'Pending', N'Pending', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, N'Creator two', N'0336626193', N'cs_test_a1l0bY9Y8DBMfQJr2RzGTPINjIal6J30C6iRldSBHUJOTr5XZ6t8rbrDfi', NULL)
INSERT [dbo].[tblOrderHeader] ([Id], [applicationUserId], [orderDate], [orderTotal], [orderStatus], [paymentStatus], [paymentDate], [paymentIntentId], [name], [phoneNumber], [sessionId], [isPackageOrder]) VALUES (53, N'a4d3a019-da59-45fb-8148-7f6bd60836bd', CAST(N'2024-03-14T10:07:07.5030955' AS DateTime2), 214, N'Cancelled', N'Cancelled', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, N'Dang Cong Hung', N'0336662923', N'cs_test_a16YghYIrFfPdCnMkdVPcCEO0mvjnvqGPmEujnqZeKnvkHHagHwdnIuCIV', NULL)
INSERT [dbo].[tblOrderHeader] ([Id], [applicationUserId], [orderDate], [orderTotal], [orderStatus], [paymentStatus], [paymentDate], [paymentIntentId], [name], [phoneNumber], [sessionId], [isPackageOrder]) VALUES (54, N'a4d3a019-da59-45fb-8148-7f6bd60836bd', CAST(N'2024-03-14T10:10:54.0173625' AS DateTime2), 214, N'Done', N'Approved', CAST(N'2024-03-14T10:11:08.6967363' AS DateTime2), N'pi_3Ou4hBAKnLcEuWdy0C0aH64g', N'Dang Cong Hung', N'0336626132', N'cs_test_a1osFNHBN7hJV5x3j6avQdoF7TEhSKAmDQ5YXqt5XxTqzdMQ8iE6ZmOCyZ', NULL)
SET IDENTITY_INSERT [dbo].[tblOrderHeader] OFF
GO
SET IDENTITY_INSERT [dbo].[tblPackage] ON 

INSERT [dbo].[tblPackage] ([packageID], [packageName], [price], [amountPost], [description], [adminID]) VALUES (2, N'Basic Upgrade', 50, 10, N'Upgrade your account to access additional features.', N'07c7eadc-5738-464c-bb16-95a5335cb4a5')
INSERT [dbo].[tblPackage] ([packageID], [packageName], [price], [amountPost], [description], [adminID]) VALUES (3, N'Premium Upgrade', 100, 20, N'Unlock premium features and priority support.', N'07c7eadc-5738-464c-bb16-95a5335cb4a5')
INSERT [dbo].[tblPackage] ([packageID], [packageName], [price], [amountPost], [description], [adminID]) VALUES (4, N'Deluxe Upgrade', 150, 39, N'Enjoy the ultimate experience with exclusive perks.', N'07c7eadc-5738-464c-bb16-95a5335cb4a5')
SET IDENTITY_INSERT [dbo].[tblPackage] OFF
GO
SET IDENTITY_INSERT [dbo].[tblReportArtist] ON 

INSERT [dbo].[tblReportArtist] ([reportArtistID], [artistID], [reporterUserID], [reason]) VALUES (5, N'a4d3a019-da59-45fb-8148-7f6bd60836bd', N'2874f35d-536d-481e-a3b5-23c6011e5933', N'Hateful activities')
INSERT [dbo].[tblReportArtist] ([reportArtistID], [artistID], [reporterUserID], [reason]) VALUES (6, N'a4d3a019-da59-45fb-8148-7f6bd60836bd', N'2874f35d-536d-481e-a3b5-23c6011e5933', N'Dangerous goods')
SET IDENTITY_INSERT [dbo].[tblReportArtist] OFF
GO
SET IDENTITY_INSERT [dbo].[tblReportArtwork] ON 

INSERT [dbo].[tblReportArtwork] ([reportArtworkID], [artworkID], [reporterUserID], [reason]) VALUES (9, 5, N'2874f35d-536d-481e-a3b5-23c6011e5933', N'Dangerous goods')
SET IDENTITY_INSERT [dbo].[tblReportArtwork] OFF
GO
SET IDENTITY_INSERT [dbo].[tblShoppingCart] ON 

INSERT [dbo].[tblShoppingCart] ([shoppingCartID], [buyerID], [artistID], [artworkID], [orderID], [artisticServiceID], [count], [isNew]) VALUES (76, N'2874f35d-536d-481e-a3b5-23c6011e5933', N'a4d3a019-da59-45fb-8148-7f6bd60836bd', 11, NULL, NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[tblShoppingCart] OFF
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  CONSTRAINT [DF__AspNetUse__Discr__6442E2C9]  DEFAULT (N'') FOR [Discriminator]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers]
GO
ALTER TABLE [dbo].[tblArtwork]  WITH CHECK ADD  CONSTRAINT [FK_tblArtwork_AspNetUsers] FOREIGN KEY([artistID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[tblArtwork] CHECK CONSTRAINT [FK_tblArtwork_AspNetUsers]
GO
ALTER TABLE [dbo].[tblArtwork]  WITH CHECK ADD  CONSTRAINT [FK_tblArtwork_tblCategory] FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategory] ([categoryID])
GO
ALTER TABLE [dbo].[tblArtwork] CHECK CONSTRAINT [FK_tblArtwork_tblCategory]
GO
ALTER TABLE [dbo].[tblBlog]  WITH CHECK ADD  CONSTRAINT [FK_tblBlog_AspNetUsers] FOREIGN KEY([creatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[tblBlog] CHECK CONSTRAINT [FK_tblBlog_AspNetUsers]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblArtwork] FOREIGN KEY([artworkId])
REFERENCES [dbo].[tblArtwork] ([artworkID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblArtwork]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblOrderHeader] FOREIGN KEY([orderHeaderId])
REFERENCES [dbo].[tblOrderHeader] ([Id])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblOrderHeader]
GO
ALTER TABLE [dbo].[tblOrderDetailPackage]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetailPackage_tblOrderHeader] FOREIGN KEY([orderHeaderId])
REFERENCES [dbo].[tblOrderHeader] ([Id])
GO
ALTER TABLE [dbo].[tblOrderDetailPackage] CHECK CONSTRAINT [FK_tblOrderDetailPackage_tblOrderHeader]
GO
ALTER TABLE [dbo].[tblOrderDetailPackage]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetailPackage_tblPackage] FOREIGN KEY([packageId])
REFERENCES [dbo].[tblPackage] ([packageID])
GO
ALTER TABLE [dbo].[tblOrderDetailPackage] CHECK CONSTRAINT [FK_tblOrderDetailPackage_tblPackage]
GO
ALTER TABLE [dbo].[tblOrderHeader]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderHeader_AspNetUsers] FOREIGN KEY([applicationUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[tblOrderHeader] CHECK CONSTRAINT [FK_tblOrderHeader_AspNetUsers]
GO
ALTER TABLE [dbo].[tblPackage]  WITH CHECK ADD  CONSTRAINT [FK_tblPackage_AspNetUsers] FOREIGN KEY([adminID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[tblPackage] CHECK CONSTRAINT [FK_tblPackage_AspNetUsers]
GO
ALTER TABLE [dbo].[tblReportArtist]  WITH CHECK ADD  CONSTRAINT [FK_tblReportArtist_AspNetUsers] FOREIGN KEY([artistID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[tblReportArtist] CHECK CONSTRAINT [FK_tblReportArtist_AspNetUsers]
GO
ALTER TABLE [dbo].[tblReportArtist]  WITH CHECK ADD  CONSTRAINT [FK_tblReportArtist_AspNetUsers1] FOREIGN KEY([reporterUserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[tblReportArtist] CHECK CONSTRAINT [FK_tblReportArtist_AspNetUsers1]
GO
ALTER TABLE [dbo].[tblReportArtwork]  WITH CHECK ADD  CONSTRAINT [FK_tblReportArtwork_tblArtwork] FOREIGN KEY([artworkID])
REFERENCES [dbo].[tblArtwork] ([artworkID])
GO
ALTER TABLE [dbo].[tblReportArtwork] CHECK CONSTRAINT [FK_tblReportArtwork_tblArtwork]
GO
ALTER TABLE [dbo].[tblReportBlog]  WITH CHECK ADD  CONSTRAINT [FK_tblReportBlog_tblBlog] FOREIGN KEY([blogID])
REFERENCES [dbo].[tblBlog] ([blogID])
GO
ALTER TABLE [dbo].[tblReportBlog] CHECK CONSTRAINT [FK_tblReportBlog_tblBlog]
GO
ALTER TABLE [dbo].[tblShoppingCart]  WITH CHECK ADD  CONSTRAINT [FK_tblShoppingCart_AspNetUsers] FOREIGN KEY([buyerID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[tblShoppingCart] CHECK CONSTRAINT [FK_tblShoppingCart_AspNetUsers]
GO
ALTER TABLE [dbo].[tblShoppingCart]  WITH CHECK ADD  CONSTRAINT [FK_tblShoppingCart_tblArtwork] FOREIGN KEY([artworkID])
REFERENCES [dbo].[tblArtwork] ([artworkID])
GO
ALTER TABLE [dbo].[tblShoppingCart] CHECK CONSTRAINT [FK_tblShoppingCart_tblArtwork]
GO
