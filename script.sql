USE [master]
GO
/****** Object:  Database [Cookedchain]    Script Date: 17-04-2024 11:39:46 ******/
CREATE DATABASE [Cookedchain]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Cookedchain', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Cookedchain.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Cookedchain_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Cookedchain_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Cookedchain] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Cookedchain].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Cookedchain] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Cookedchain] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Cookedchain] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Cookedchain] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Cookedchain] SET ARITHABORT OFF 
GO
ALTER DATABASE [Cookedchain] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Cookedchain] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Cookedchain] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Cookedchain] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Cookedchain] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Cookedchain] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Cookedchain] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Cookedchain] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Cookedchain] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Cookedchain] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Cookedchain] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Cookedchain] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Cookedchain] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Cookedchain] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Cookedchain] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Cookedchain] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Cookedchain] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Cookedchain] SET RECOVERY FULL 
GO
ALTER DATABASE [Cookedchain] SET  MULTI_USER 
GO
ALTER DATABASE [Cookedchain] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Cookedchain] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Cookedchain] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Cookedchain] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Cookedchain] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Cookedchain] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Cookedchain] SET QUERY_STORE = ON
GO
ALTER DATABASE [Cookedchain] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Cookedchain]
GO
/****** Object:  Table [dbo].[DistrictTable]    Script Date: 17-04-2024 11:39:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DistrictTable](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[StateID] [nchar](10) NULL,
 CONSTRAINT [PK_DistrictTable] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Logistics]    Script Date: 17-04-2024 11:39:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logistics](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[UserName] [varchar](max) NULL,
	[PhoneNumber] [nvarchar](13) NULL,
	[Email] [nvarchar](50) NULL,
	[VechicalNumber] [varchar](50) NULL,
	[DrivingLicense] [varchar](50) NULL,
	[District] [int] NULL,
	[State] [int] NULL,
 CONSTRAINT [PK_Logistics] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderFood]    Script Date: 17-04-2024 11:39:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderFood](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[OrderBy] [int] NOT NULL,
	[PhoneNumber] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[District] [int] NOT NULL,
	[State] [int] NOT NULL,
	[CreatedDateTime] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderFoodDetails]    Script Date: 17-04-2024 11:39:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderFoodDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[OrderedFood] [varchar](50) NOT NULL,
	[FoodQuantity] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StateTable]    Script Date: 17-04-2024 11:39:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StateTable](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](max) NULL,
	[Description] [varchar](max) NULL,
 CONSTRAINT [PK_StateTable] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserMasterTable]    Script Date: 17-04-2024 11:39:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserMasterTable](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[UserName] [varchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[Address] [varchar](max) NULL,
	[District] [varchar](max) NULL,
	[State] [varchar](max) NULL,
 CONSTRAINT [PK_UserMasterTable] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DistrictTable] ON 

INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (1, N'Ariyalur', N'23        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (2, N'Chengalpattu', N'23        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (3, N'Chennai', N'23        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (4, N'Coimbatore', N'23        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (5, N'Cuddalore', N'23        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (6, N'Dharmapuri', N'23        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (7, N'Dindigul', N'23        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (8, N'Erode', N'23        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (9, N'Kallakurichi', N'23        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (10, N'Kanchipuram', N'23        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (11, N'Kanyakumari', N'23        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (12, N'Karur', N'23        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (13, N'Krishnagiri', N'23        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (14, N'Madurai', N'23        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (15, N'Nagapattinam', N'23        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (16, N'Namakkal', N'23        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (17, N'Nilgiris', N'23        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (18, N'Perambalur', N'23        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (19, N'Pudukkottai', N'23        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (20, N'Ramanathapuram', N'23        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (21, N'Ranipet', N'23        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (22, N'Salem', N'23        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (23, N'Sivaganga', N'23        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (24, N'Tenkasi', N'23        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (25, N'Thanjavur', N'23        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (26, N'Theni', N'23        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (27, N'Thoothukudi', N'23        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (28, N'Tiruchirappalli', N'23        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (29, N'Tirunelveli', N'23        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (30, N'Tirupathur', N'23        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (31, N'Tiruppur', N'23        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (32, N'Tiruvallur', N'23        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (33, N'Tiruvannamalai', N'23        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (34, N'Tiruvarur', N'23        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (35, N'Vellore', N'23        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (36, N'Viluppuram', N'23        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (37, N'Virudhunagar', N'23        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (38, N'Alappuzha', N'24        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (39, N'Ernakulam', N'24        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (40, N'Idukki', N'24        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (41, N'Kannur', N'24        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (42, N'Kasaragod', N'24        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (43, N'Kollam', N'24        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (44, N'Kottayam', N'24        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (45, N'Kozhikode', N'24        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (46, N'Malappuram', N'24        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (47, N'Palakkad', N'24        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (48, N'Pathanamthitta', N'24        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (49, N'Thiruvananthapuram', N'24        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (50, N'Thrissur', N'24        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (51, N'Wayanad', N'24        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (52, N'Bagalkot', N'35        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (53, N'Ballari (Bellary)', N'35        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (54, N'Belagavi (Belgaum)', N'35        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (55, N'Bengaluru Rural', N'35        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (56, N'Bengaluru Urban', N'35        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (57, N'Bidar', N'35        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (58, N'Chamarajanagar', N'35        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (59, N'Chikkaballapur', N'35        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (60, N'Chikkamagaluru (Chikmagalur)', N'35        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (61, N'Chitradurga', N'35        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (62, N'Dakshina Kannada', N'35        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (63, N'Davangere', N'35        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (64, N'Dharwad', N'35        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (65, N'Gadag', N'35        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (66, N'Hassan', N'35        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (67, N'Haveri', N'35        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (68, N'Kalaburagi (Gulbarga)', N'35        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (69, N'Kodagu', N'35        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (70, N'Kolar', N'35        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (71, N'Koppal', N'35        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (72, N'Mandya', N'35        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (73, N'Mysuru (Mysore)', N'35        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (74, N'Raichur', N'35        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (75, N'Ramanagara', N'35        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (76, N'Shivamogga (Shimoga)', N'35        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (77, N'Tumakuru (Tumkur)', N'35        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (78, N'Udupi', N'35        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (79, N'Uttara Kannada (Karwar)', N'35        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (80, N'Vijayapura (Bijapur)', N'35        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (81, N'Yadgir', N'35        ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (82, N'Anantapur', N'1         ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (83, N'Chittoor', N'1         ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (84, N'East Godavari', N'1         ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (85, N'Guntur', N'1         ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (86, N'Krishna', N'1         ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (87, N'Kurnool', N'1         ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (88, N'Prakasam', N'1         ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (89, N'Srikakulam', N'1         ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (90, N'Sri Potti Sriramulu Nellore', N'1         ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (91, N'Visakhapatnam', N'1         ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (92, N'Vizianagaram', N'1         ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (93, N'West Godavari', N'1         ')
INSERT [dbo].[DistrictTable] ([ID], [Name], [StateID]) VALUES (94, N'YSR Kadapa', N'1         ')
SET IDENTITY_INSERT [dbo].[DistrictTable] OFF
GO
SET IDENTITY_INSERT [dbo].[Logistics] ON 

INSERT [dbo].[Logistics] ([ID], [UserID], [UserName], [PhoneNumber], [Email], [VechicalNumber], [DrivingLicense], [District], [State]) VALUES (1, 1, N'Karthikeyan', N'231212', N'karthisabari44@gmail.com', N'weqqe', N'asdads', 1, 1)
INSERT [dbo].[Logistics] ([ID], [UserID], [UserName], [PhoneNumber], [Email], [VechicalNumber], [DrivingLicense], [District], [State]) VALUES (2, 2, N'sad', N'sad', N'asd', N'Observers.png', N'sda', 1, 1)
SET IDENTITY_INSERT [dbo].[Logistics] OFF
GO
SET IDENTITY_INSERT [dbo].[StateTable] ON 

INSERT [dbo].[StateTable] ([ID], [Name], [Description]) VALUES (1, N'Andhra Pradesh', N'Andhra Pradesh')
INSERT [dbo].[StateTable] ([ID], [Name], [Description]) VALUES (2, N'Arunachal Pradesh', N'Arunachal Pradesh')
INSERT [dbo].[StateTable] ([ID], [Name], [Description]) VALUES (3, N'Assam', N'Assam')
INSERT [dbo].[StateTable] ([ID], [Name], [Description]) VALUES (4, N'Bihar', N'Bihar')
INSERT [dbo].[StateTable] ([ID], [Name], [Description]) VALUES (5, N'Chhattisgarh', N'Chhattisgarh')
INSERT [dbo].[StateTable] ([ID], [Name], [Description]) VALUES (6, N'Goa', N'Goa')
INSERT [dbo].[StateTable] ([ID], [Name], [Description]) VALUES (7, N'Gujarat', N'Gujarat')
INSERT [dbo].[StateTable] ([ID], [Name], [Description]) VALUES (8, N'Haryana', N'Haryana')
INSERT [dbo].[StateTable] ([ID], [Name], [Description]) VALUES (9, N'Himachal Pradesh', N'Himachal Pradesh')
INSERT [dbo].[StateTable] ([ID], [Name], [Description]) VALUES (10, N'Jharkhand', N'Jharkhand')
INSERT [dbo].[StateTable] ([ID], [Name], [Description]) VALUES (11, N'Karnataka', N'Karnataka')
INSERT [dbo].[StateTable] ([ID], [Name], [Description]) VALUES (12, N'Kerala', N'Kerala')
INSERT [dbo].[StateTable] ([ID], [Name], [Description]) VALUES (13, N'Madhya Pradesh', N'Madhya Pradesh')
INSERT [dbo].[StateTable] ([ID], [Name], [Description]) VALUES (14, N'Maharashtra', N'Maharashtra')
INSERT [dbo].[StateTable] ([ID], [Name], [Description]) VALUES (15, N'Manipur', N'Manipur')
INSERT [dbo].[StateTable] ([ID], [Name], [Description]) VALUES (16, N'Meghalaya', N'Meghalaya')
INSERT [dbo].[StateTable] ([ID], [Name], [Description]) VALUES (17, N'Mizoram', N'Mizoram')
INSERT [dbo].[StateTable] ([ID], [Name], [Description]) VALUES (18, N'Nagaland', N'Nagaland')
INSERT [dbo].[StateTable] ([ID], [Name], [Description]) VALUES (19, N'Odisha', N'Odisha')
INSERT [dbo].[StateTable] ([ID], [Name], [Description]) VALUES (20, N'Punjab', N'Punjab')
INSERT [dbo].[StateTable] ([ID], [Name], [Description]) VALUES (21, N'Rajasthan', N'Rajasthan')
INSERT [dbo].[StateTable] ([ID], [Name], [Description]) VALUES (22, N'Sikkim', N'Sikkim')
INSERT [dbo].[StateTable] ([ID], [Name], [Description]) VALUES (23, N'Tamil Nadu', N'Tamil Nadu')
INSERT [dbo].[StateTable] ([ID], [Name], [Description]) VALUES (24, N'Telangana', N'Telangana')
INSERT [dbo].[StateTable] ([ID], [Name], [Description]) VALUES (25, N'Tripura', N'Tripura')
INSERT [dbo].[StateTable] ([ID], [Name], [Description]) VALUES (26, N'Uttar Pradesh', N'Uttar Pradesh')
INSERT [dbo].[StateTable] ([ID], [Name], [Description]) VALUES (27, N'Uttarakhand', N'Uttarakhand')
INSERT [dbo].[StateTable] ([ID], [Name], [Description]) VALUES (28, N'West Bengal', N'West Bengal')
SET IDENTITY_INSERT [dbo].[StateTable] OFF
GO
SET IDENTITY_INSERT [dbo].[UserMasterTable] ON 

INSERT [dbo].[UserMasterTable] ([ID], [UserID], [UserName], [Email], [Password], [PhoneNumber], [Address], [District], [State]) VALUES (1, 1, N'Karthikeyan', N'karthisabari44@gmail.com', N'karthi', N'7010059099', N'Trichy', N'Trichy', N'TamilNadu')
INSERT [dbo].[UserMasterTable] ([ID], [UserID], [UserName], [Email], [Password], [PhoneNumber], [Address], [District], [State]) VALUES (2, 2, N'string', N'string', N'string', N'string', N'string', N'string', N'string')
INSERT [dbo].[UserMasterTable] ([ID], [UserID], [UserName], [Email], [Password], [PhoneNumber], [Address], [District], [State]) VALUES (3, 3, N'string', N'string', N'string', N'string', N'string', N'string', N'string')
INSERT [dbo].[UserMasterTable] ([ID], [UserID], [UserName], [Email], [Password], [PhoneNumber], [Address], [District], [State]) VALUES (4, 4, N'a', N'a@gmail.com', N'a', N'1234567890', N'a', N'a', N'a')
INSERT [dbo].[UserMasterTable] ([ID], [UserID], [UserName], [Email], [Password], [PhoneNumber], [Address], [District], [State]) VALUES (5, 5, N'BharathKumar', N'bharath@gmail.com', N'bharath', N'9876543210', N'karur', N'karur', N'Tamilnadu')
INSERT [dbo].[UserMasterTable] ([ID], [UserID], [UserName], [Email], [Password], [PhoneNumber], [Address], [District], [State]) VALUES (6, 6, N'Karthi', N'karthi@gmail.com', N'karthi', N'0987654321', N'karur', N'karur', N'tamilnadu')
INSERT [dbo].[UserMasterTable] ([ID], [UserID], [UserName], [Email], [Password], [PhoneNumber], [Address], [District], [State]) VALUES (7, 7, N'Bharath', N'karthi@gmail.com', N'karthi', N'0987654321', N'karur', N'karur', N'tamilnadu')
INSERT [dbo].[UserMasterTable] ([ID], [UserID], [UserName], [Email], [Password], [PhoneNumber], [Address], [District], [State]) VALUES (8, 8, N'KarthikeyanAshwini', N'karthi@gmail.com', N'ashu', N'0987654321', N'karur', N'karur', N'kerala')
INSERT [dbo].[UserMasterTable] ([ID], [UserID], [UserName], [Email], [Password], [PhoneNumber], [Address], [District], [State]) VALUES (9, 9, N'karthiaswini', N'karthi@gmail.com', N'ashwini', N'0987654321', N'karur', N'karur', N'karnataka')
INSERT [dbo].[UserMasterTable] ([ID], [UserID], [UserName], [Email], [Password], [PhoneNumber], [Address], [District], [State]) VALUES (10, 10, N'kural', N'kural@gmail.com', N'kural9943', N'7708061554', N'alg', N'kru', N'tn')
INSERT [dbo].[UserMasterTable] ([ID], [UserID], [UserName], [Email], [Password], [PhoneNumber], [Address], [District], [State]) VALUES (11, 11, N'kural', N'kural@gmail.com', N'kural9943', N'7708061554', N'alg', N'kru', N'tn')
INSERT [dbo].[UserMasterTable] ([ID], [UserID], [UserName], [Email], [Password], [PhoneNumber], [Address], [District], [State]) VALUES (12, 12, N'kural', N'kural@gmail.com', N'kural9943', N'7708061554', N'alg', N'kru', N'tn')
INSERT [dbo].[UserMasterTable] ([ID], [UserID], [UserName], [Email], [Password], [PhoneNumber], [Address], [District], [State]) VALUES (13, 13, N'kural', N'kural@gmail.com', N'kural', N'987654321', N'kuyt', N'qwr', N'ert')
INSERT [dbo].[UserMasterTable] ([ID], [UserID], [UserName], [Email], [Password], [PhoneNumber], [Address], [District], [State]) VALUES (14, 14, N'string', N'string', N'string', N'string', N'string', N'string', N'string')
INSERT [dbo].[UserMasterTable] ([ID], [UserID], [UserName], [Email], [Password], [PhoneNumber], [Address], [District], [State]) VALUES (15, 15, N'Bharath', N'bharath@gmail.com', N'bharath', N'9876543210', N'pli', N'Trichy', N'tamilnadu')
INSERT [dbo].[UserMasterTable] ([ID], [UserID], [UserName], [Email], [Password], [PhoneNumber], [Address], [District], [State]) VALUES (16, 16, N'string', N'string', N'string', N'string', N'string', N'string', N'string')
INSERT [dbo].[UserMasterTable] ([ID], [UserID], [UserName], [Email], [Password], [PhoneNumber], [Address], [District], [State]) VALUES (17, 17, N'string', N'string', N'string', N'string', N'string', N'string', N'string')
INSERT [dbo].[UserMasterTable] ([ID], [UserID], [UserName], [Email], [Password], [PhoneNumber], [Address], [District], [State]) VALUES (18, 18, N'Bharath', N'bharath@gmail.com', N'bharath', N'9876543210', N'pli', N'Trichy', N'tamilnadu')
INSERT [dbo].[UserMasterTable] ([ID], [UserID], [UserName], [Email], [Password], [PhoneNumber], [Address], [District], [State]) VALUES (19, 19, N'Bharath', N'bharath@gmail.com', N'bharath', N'9876543210', N'pli', N'Trichy', N'tamilnadu')
INSERT [dbo].[UserMasterTable] ([ID], [UserID], [UserName], [Email], [Password], [PhoneNumber], [Address], [District], [State]) VALUES (20, 20, N'Bharath', N'bharath@gmail.com', N'bharath', N'9876543210', N'pli', N'Trichy', N'tamilnadu')
INSERT [dbo].[UserMasterTable] ([ID], [UserID], [UserName], [Email], [Password], [PhoneNumber], [Address], [District], [State]) VALUES (21, 21, N'Bharath', N'bharath@gmail.com', N'bharath', N'9876543210', N'pli', N'Trichy', N'tamilnadu')
INSERT [dbo].[UserMasterTable] ([ID], [UserID], [UserName], [Email], [Password], [PhoneNumber], [Address], [District], [State]) VALUES (22, 22, N'string', N'string', N'string', N'string', N'string', N'string', N'string')
INSERT [dbo].[UserMasterTable] ([ID], [UserID], [UserName], [Email], [Password], [PhoneNumber], [Address], [District], [State]) VALUES (23, 23, N'string', N'string', N'string', N'string', N'string', N'string', N'string')
INSERT [dbo].[UserMasterTable] ([ID], [UserID], [UserName], [Email], [Password], [PhoneNumber], [Address], [District], [State]) VALUES (24, 24, N'Bharath', N'bharath@gmail.com', N'bharath', N'9876543210', N'pli', N'Trichy', N'tamilnadu')
INSERT [dbo].[UserMasterTable] ([ID], [UserID], [UserName], [Email], [Password], [PhoneNumber], [Address], [District], [State]) VALUES (25, 25, N'Bharath', N'bharath@gmail.com', N'bharath', N'9876543210', N'pli', N'Trichy', N'tamilnadu')
INSERT [dbo].[UserMasterTable] ([ID], [UserID], [UserName], [Email], [Password], [PhoneNumber], [Address], [District], [State]) VALUES (26, 26, N'Bharath', N'bharath@gmail.com', N'bharath', N'9876543210', N'pli', N'Trichy', N'tamilnadu')
INSERT [dbo].[UserMasterTable] ([ID], [UserID], [UserName], [Email], [Password], [PhoneNumber], [Address], [District], [State]) VALUES (27, 27, N'Bharath', N'bharath@gmail.com', N'bharath', N'9876543210', N'pli', N'Trichy', N'tamilnadu')
INSERT [dbo].[UserMasterTable] ([ID], [UserID], [UserName], [Email], [Password], [PhoneNumber], [Address], [District], [State]) VALUES (28, 28, N'Bharath', N'bharath@gmail.com', N'bharath', N'9876543210', N'pli', N'Trichy', N'tamilnadu')
INSERT [dbo].[UserMasterTable] ([ID], [UserID], [UserName], [Email], [Password], [PhoneNumber], [Address], [District], [State]) VALUES (29, 29, N'Bharath', N'bharath@gmail.com', N'bharath', N'9876543210', N'pli', N'Trichy', N'tamilnadu')
INSERT [dbo].[UserMasterTable] ([ID], [UserID], [UserName], [Email], [Password], [PhoneNumber], [Address], [District], [State]) VALUES (30, 30, N'string', N'string', N'string', N'string', N'string', N'string', N'string')
INSERT [dbo].[UserMasterTable] ([ID], [UserID], [UserName], [Email], [Password], [PhoneNumber], [Address], [District], [State]) VALUES (31, 31, N'Bharath', N'bharath@gmail.com', N'bharath', N'9876543210', N'pli', N'Trichy', N'tamilnadu')
INSERT [dbo].[UserMasterTable] ([ID], [UserID], [UserName], [Email], [Password], [PhoneNumber], [Address], [District], [State]) VALUES (32, 32, N'Karthikeyan', N'karthisabari44@gmail.com', N'karthi', N'7010059099', N'Trichy', N'Trichy', N'TamilNadu')
INSERT [dbo].[UserMasterTable] ([ID], [UserID], [UserName], [Email], [Password], [PhoneNumber], [Address], [District], [State]) VALUES (33, 33, N'Karthikeyan', N'karthisabari44@gmail.com', N'karthi', N'7010059099', N'Trichy', N'Trichy', N'TamilNadu')
INSERT [dbo].[UserMasterTable] ([ID], [UserID], [UserName], [Email], [Password], [PhoneNumber], [Address], [District], [State]) VALUES (34, 34, N'string', N'string', N'string', N'string', N'string', N'string', N'string')
INSERT [dbo].[UserMasterTable] ([ID], [UserID], [UserName], [Email], [Password], [PhoneNumber], [Address], [District], [State]) VALUES (35, 35, N'Bharath', N'bharath@gmail.com', N'bharath', N'9876543210', N'pli', N'Trichy', N'tamilnadu')
INSERT [dbo].[UserMasterTable] ([ID], [UserID], [UserName], [Email], [Password], [PhoneNumber], [Address], [District], [State]) VALUES (36, 36, N'Bharath', N'bharath@gmail.com', N'bharath', N'9876543210', N'pli', N'Trichy', N'tamilnadu')
INSERT [dbo].[UserMasterTable] ([ID], [UserID], [UserName], [Email], [Password], [PhoneNumber], [Address], [District], [State]) VALUES (37, 37, N'Bharath', N'bharath@gmail.com', N'bharath', N'9876543210', N'pli', N'Trichy', N'tamilnadu')
INSERT [dbo].[UserMasterTable] ([ID], [UserID], [UserName], [Email], [Password], [PhoneNumber], [Address], [District], [State]) VALUES (38, 38, N'Karthi', N'karthisabari@gmail.com', N'karthi', N'9876543210', N'karur', N'karur', N'Tamil Nadu')
INSERT [dbo].[UserMasterTable] ([ID], [UserID], [UserName], [Email], [Password], [PhoneNumber], [Address], [District], [State]) VALUES (39, 39, N'Karthi', N'karthisabari@gmail.com', N'karthi', N'9876543210', N'karur', N'karur', N'Tamil Nadu')
SET IDENTITY_INSERT [dbo].[UserMasterTable] OFF
GO
/****** Object:  StoredProcedure [dbo].[CookedchainDeposit]    Script Date: 17-04-2024 11:39:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CookedchainDeposit]
    @userId int
	
AS
begin 

select UserName from UserMasterTable WHERE UserID=@userId
 end

--exec CookedchainProfile 1

GO
/****** Object:  StoredProcedure [dbo].[CookedchainLogin]    Script Date: 17-04-2024 11:39:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CookedchainLogin] 
@Email nvarchar(MAX),
@Password nvarchar(MAX)
AS
BEGIN
Declare @UserID int

 set  @UserID = (select distinct UserID from UserMasterTable where Email = @Email AND Password = @Password)
 

 --if @@rowcount>0

If @UserID>0  
BEGIN

Select UserID, UserName  from UserMasterTable where Email=@Email AND Password = @Password
END
Else
   RAISERROR('Invalid UserName or Password',11,1)
 

END
-- exec CookedchainLogin 'karthisabari44@gmail.com','karthi'
 






GO
/****** Object:  StoredProcedure [dbo].[CookedchainProfile]    Script Date: 17-04-2024 11:39:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CookedchainProfile]
    @userId int
	
AS
begin 

select UserName,Email,PhoneNumber,Address,District,State from UserMasterTable WHERE UserID=@userId
 end

--exec CookedchainProfile 1

GO
/****** Object:  StoredProcedure [dbo].[GetDistrict]    Script Date: 17-04-2024 11:39:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[GetDistrict]
AS
  SET NOCOUNT ON;
SELECT ID, Name, StateID FROM DistrictTable
GO
/****** Object:  StoredProcedure [dbo].[GetState]    Script Date: 17-04-2024 11:39:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[GetState]
AS
  SET NOCOUNT ON;
SELECT ID, Name, Description FROM StateTable
GO
/****** Object:  StoredProcedure [dbo].[Sp_Home]    Script Date: 17-04-2024 11:39:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_Home]
   
   @foodname Varchar(MAX),
	@quantity int,
	@email nvarchar(50),
	@phonenumber nvarchar(13),
	@address varchar(max),
	@district int,
	@state int
AS
begin 
Declare @max int
Declare @NO int
set @max =(select max(UserID)from Home)

if(@max > 0)
	set @NO =@max +1;
else
	set @NO=1;
insert into Home(UserID,FoodName,Quantity,Email,PhoneNumber,Address,District,State)
				Values(@NO,@foodname,@quantity,@email,@phonenumber,@address,@district,@state)
 end

--exec Sp_UserMaster 'Karthikeyan','karthisabari44@gmail.com','karthi',7010059099,'Trichy','Trichy','TamilNadu';

GO
/****** Object:  StoredProcedure [dbo].[Sp_Logistics]    Script Date: 17-04-2024 11:39:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_Logistics]
   
   @username Varchar(MAX),
   @phonenumber nvarchar(13),
   @email nvarchar(50),
	@drivinglicense varchar(50),
	@vechicalnumber varchar(50),

	@district int,
	@state int
AS
begin 
Declare @max int
Declare @NO int
set @max =(select max(UserID)from Logistics)

if(@max > 0)
	set @NO =@max +1;
else
	set @NO=1;
insert into  Logistics(UserID,UserName,PhoneNumber,Email,VechicalNumber,DrivingLicense,District,State)
				Values(@NO,@username, @phonenumber,@email,@drivinglicense,@vechicalnumber,@district,@state)
 end

--exec Sp_Home 'Karthikeyan','2','karthisabari44@gmail.com',7010059099,'Trichy',1,1;

GO
/****** Object:  StoredProcedure [dbo].[sp_OrderFoodDetailsInsert]    Script Date: 17-04-2024 11:39:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- EXEC [sp_OrderFoodDetailsInsert] 1, 'Dhosa', 10
CREATE PROCEDURE[dbo].[sp_OrderFoodDetailsInsert]

@OrderID int,
@OrderedFood varchar(50),
@FoodQuantity int

AS
  
  BEGIN

  insert into OrderFoodDetails 

  (OrderID, OrderedFood, FoodQuantity) values

  (@OrderID, @OrderedFood, @FoodQuantity)

  END
GO
/****** Object:  StoredProcedure [dbo].[sp_OrderFoodInsert]    Script Date: 17-04-2024 11:39:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- EXEC sp_OrderFoodInsert 1,'asd','sad',1,1
CREATE PROCEDURE[dbo].[sp_OrderFoodInsert]

@orderBy int,
@phoneNo Varchar(50) ,
@address Varchar(50),
@district int,
@state int

AS
  
  BEGIN

Declare @max int
Declare @NO int

set @max =(select max(OrderID)from OrderFood )

if(@max > 0)
	set @NO =@max +1;
else
	set @NO=1;

insert into OrderFood 
	(OrderID, OrderBy, PhoneNumber, Address, District, State, CreatedDateTime) values 
	(@No, @orderBy, @phoneNo, @address, @district, @state, GETDATE())

select OrderID from OrderFood where OrderID = @NO

  END
GO
/****** Object:  StoredProcedure [dbo].[Sp_UserMaster]    Script Date: 17-04-2024 11:39:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_UserMaster]

    @username Varchar(MAX),
	@email nvarchar(MAX),
	@password nvarchar(MAX),
	@phonenumber nvarchar(13),
	@address varchar(max),
	@district varchar(max),
	@state varchar(max)
AS
begin 
Declare @max int
Declare @NO int
set @max =(select max(UserID)from UserMasterTable)

if(@max > 0)
	set @NO =@max +1;
else
	set @NO=1;
	Begin
insert into UserMasterTable(UserID,UserName,Email,Password,PhoneNumber,Address,District,State)
				Values(@NO,@username,@email,@password,@phonenumber,@address,@district,@state)
	End
	Begin
	select  Top 1 UserID from UserMasterTable order by UserID desc
 end
 end
--exec Sp_UserMaster 'Karthikeyan','karthisabari44@gmail.com','karthi',7010059099,'Trichy','Trichy','TamilNadu';

GO
USE [master]
GO
ALTER DATABASE [Cookedchain] SET  READ_WRITE 
GO
