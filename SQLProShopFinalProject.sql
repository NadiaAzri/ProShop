USE [master]
GO
/****** Object:  Database [ProShop]    Script Date: 5/2/2025 2:18:13 PM ******/
CREATE DATABASE [ProShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ProShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ProShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ProShop] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProShop] SET  MULTI_USER 
GO
ALTER DATABASE [ProShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ProShop] SET QUERY_STORE = ON
GO
ALTER DATABASE [ProShop] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ProShop]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 5/2/2025 2:18:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentID] [varchar](7) NOT NULL,
	[DeptName] [varchar](25) NULL,
	[FoundedIn] [int] NULL,
	[Extension] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Education]    Script Date: 5/2/2025 2:18:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Education](
	[EducationID] [varchar](7) NOT NULL,
	[Degree] [varchar](5) NULL,
	[Level] [varchar](20) NULL,
	[Field] [varchar](30) NULL,
	[InstitutionName] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[EducationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 5/2/2025 2:18:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [varchar](7) NOT NULL,
	[FirstName] [varchar](30) NOT NULL,
	[LastName] [varchar](30) NOT NULL,
	[Gender] [char](2) NULL,
	[BirthDate] [date] NULL,
	[HireDate] [date] NULL,
	[Email] [varchar](30) NULL,
	[Phone] [varchar](12) NULL,
	[DepartmentID] [varchar](7) NULL,
	[ManagerID] [varchar](7) NULL,
	[JobTitleID] [varchar](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeEducation]    Script Date: 5/2/2025 2:18:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeEducation](
	[EmployeeID] [varchar](7) NOT NULL,
	[EducationID] [varchar](7) NOT NULL,
	[GraduationYear] [int] NULL,
	[GPA] [decimal](3, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC,
	[EducationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeTraining]    Script Date: 5/2/2025 2:18:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeTraining](
	[EmployeeID] [varchar](7) NOT NULL,
	[TrainingID] [varchar](7) NOT NULL,
	[TrainerID] [varchar](7) NOT NULL,
	[CompletingDate] [date] NULL,
	[Score] [decimal](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC,
	[TrainingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobTitle]    Script Date: 5/2/2025 2:18:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobTitle](
	[JobTitleID] [varchar](7) NOT NULL,
	[Title] [varchar](20) NOT NULL,
	[RemoteEligibility] [bit] NULL,
	[BaseSalary] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[JobTitleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Training]    Script Date: 5/2/2025 2:18:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Training](
	[TrainingID] [varchar](7) NOT NULL,
	[Title] [varchar](100) NOT NULL,
	[Year] [int] NOT NULL,
	[DurationDays] [int] NULL,
	[DepartmentID] [varchar](7) NULL,
	[CreatedBy] [varchar](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[TrainingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Department] ([DepartmentID], [DeptName], [FoundedIn], [Extension]) VALUES (N'D01', N'IT', 2005, 552)
INSERT [dbo].[Department] ([DepartmentID], [DeptName], [FoundedIn], [Extension]) VALUES (N'D02', N'HR', 2010, 553)
INSERT [dbo].[Department] ([DepartmentID], [DeptName], [FoundedIn], [Extension]) VALUES (N'D03', N'Finance', 2008, 554)
INSERT [dbo].[Department] ([DepartmentID], [DeptName], [FoundedIn], [Extension]) VALUES (N'D04', N'Operations', 2011, 555)
GO
INSERT [dbo].[Education] ([EducationID], [Degree], [Level], [Field], [InstitutionName]) VALUES (N'ED01', N'B.Sc', N'Bachelor of Science', N'Comp. Science', N'Touro University')
INSERT [dbo].[Education] ([EducationID], [Degree], [Level], [Field], [InstitutionName]) VALUES (N'ED03', N'B.A.', N'Bachelor of Arts', N'HR Management', N'NYU')
INSERT [dbo].[Education] ([EducationID], [Degree], [Level], [Field], [InstitutionName]) VALUES (N'ED04', N'M.Sc', N'Master of Science', N'Systems Engineering', N'St. Johns University')
GO
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Gender], [BirthDate], [HireDate], [Email], [Phone], [DepartmentID], [ManagerID], [JobTitleID]) VALUES (N'E001', N'Ana', N'Torres', N'F ', CAST(N'1990-03-15' AS Date), CAST(N'2020-06-01' AS Date), N'ana@email.com', N'5551234567', N'D01', N'E005', N'J01')
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Gender], [BirthDate], [HireDate], [Email], [Phone], [DepartmentID], [ManagerID], [JobTitleID]) VALUES (N'E002', N'Luis', N'Reyes', N'M ', CAST(N'1985-07-10' AS Date), CAST(N'2018-04-12' AS Date), N'luis@email.com', N'555-456-7890', N'D02', N'E001', N'J02')
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Gender], [BirthDate], [HireDate], [Email], [Phone], [DepartmentID], [ManagerID], [JobTitleID]) VALUES (N'E003', N'Maria', N'Silva', N'F ', CAST(N'1992-01-20' AS Date), CAST(N'2021-11-05' AS Date), N'maria@email.com', N'555-789-6543', N'D03', N'E004', N'J03')
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Gender], [BirthDate], [HireDate], [Email], [Phone], [DepartmentID], [ManagerID], [JobTitleID]) VALUES (N'E004', N'Jorge', N'Diaz', N'M ', CAST(N'1988-10-30' AS Date), CAST(N'2017-08-20' AS Date), N'jorge@email.com', N'555-888-1234', N'D04', N'E002', N'J04')
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Gender], [BirthDate], [HireDate], [Email], [Phone], [DepartmentID], [ManagerID], [JobTitleID]) VALUES (N'E005', N'Carla', N'Moreno', N'F ', CAST(N'1995-09-12' AS Date), CAST(N'2022-01-17' AS Date), N'carla2@gmail.com', N'555-111-2222', N'D01', N'E001', N'J01')
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Gender], [BirthDate], [HireDate], [Email], [Phone], [DepartmentID], [ManagerID], [JobTitleID]) VALUES (N'FIN01', N'Isabella', N'Rossi', N'F ', CAST(N'1992-07-24' AS Date), CAST(N'2015-11-09' AS Date), N'isabella@email.com', N'555-203-3456', N'D03', N'E004', N'J03')
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Gender], [BirthDate], [HireDate], [Email], [Phone], [DepartmentID], [ManagerID], [JobTitleID]) VALUES (N'HR01', N'Natalie', N'Chen', N'F ', CAST(N'1989-02-17' AS Date), CAST(N'2016-03-14' AS Date), N'natalie@email.com', N'555-201-1234', N'D02', NULL, N'J02')
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Gender], [BirthDate], [HireDate], [Email], [Phone], [DepartmentID], [ManagerID], [JobTitleID]) VALUES (N'IT01', N'Ahmed', N'El-Sayed', N'M ', CAST(N'1985-11-03' AS Date), CAST(N'2014-07-21' AS Date), N'ahmed@email.com', N'555-202-2345', N'D01', N'E005', N'J01')
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Gender], [BirthDate], [HireDate], [Email], [Phone], [DepartmentID], [ManagerID], [JobTitleID]) VALUES (N'OPS01', N'Samuel', N'Ofori', N'M ', CAST(N'1988-05-11' AS Date), CAST(N'2013-05-27' AS Date), N'samuel@email.com', N'555-204-4567', N'D04', N'E002', N'J04')
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Gender], [BirthDate], [HireDate], [Email], [Phone], [DepartmentID], [ManagerID], [JobTitleID]) VALUES (N'TR01', N'Leila', N'Haddad', N'F ', CAST(N'1991-09-08' AS Date), CAST(N'2016-08-01' AS Date), N'leila@email.com', N'555-205-5678', N'D02', NULL, N'J02')
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Gender], [BirthDate], [HireDate], [Email], [Phone], [DepartmentID], [ManagerID], [JobTitleID]) VALUES (N'TR03', N'David', N'Kim', N'M ', CAST(N'1990-12-30' AS Date), CAST(N'2012-01-16' AS Date), N'david@email.com', N'555-206-6789', N'D01', N'E005', N'J01')
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Gender], [BirthDate], [HireDate], [Email], [Phone], [DepartmentID], [ManagerID], [JobTitleID]) VALUES (N'TR04', N'Fatima', N'Alvarez', N'F ', CAST(N'1993-04-15' AS Date), CAST(N'2015-04-30' AS Date), N'fatima@email.com', N'555-207-7890', N'D03', N'E004', N'J03')
GO
INSERT [dbo].[EmployeeEducation] ([EmployeeID], [EducationID], [GraduationYear], [GPA]) VALUES (N'E001', N'ED01', 2012, CAST(3.80 AS Decimal(3, 2)))
INSERT [dbo].[EmployeeEducation] ([EmployeeID], [EducationID], [GraduationYear], [GPA]) VALUES (N'E001', N'ED04', 2015, CAST(3.90 AS Decimal(3, 2)))
INSERT [dbo].[EmployeeEducation] ([EmployeeID], [EducationID], [GraduationYear], [GPA]) VALUES (N'E002', N'ED03', 2008, CAST(3.50 AS Decimal(3, 2)))
INSERT [dbo].[EmployeeEducation] ([EmployeeID], [EducationID], [GraduationYear], [GPA]) VALUES (N'E003', N'ED03', 2013, CAST(3.70 AS Decimal(3, 2)))
INSERT [dbo].[EmployeeEducation] ([EmployeeID], [EducationID], [GraduationYear], [GPA]) VALUES (N'E004', N'ED04', 2014, CAST(3.90 AS Decimal(3, 2)))
INSERT [dbo].[EmployeeEducation] ([EmployeeID], [EducationID], [GraduationYear], [GPA]) VALUES (N'E005', N'ED01', 2018, CAST(3.85 AS Decimal(3, 2)))
INSERT [dbo].[EmployeeEducation] ([EmployeeID], [EducationID], [GraduationYear], [GPA]) VALUES (N'HR01', N'ED03', 2008, CAST(3.90 AS Decimal(3, 2)))
GO
INSERT [dbo].[EmployeeTraining] ([EmployeeID], [TrainingID], [TrainerID], [CompletingDate], [Score]) VALUES (N'E001', N'T001', N'TR01', CAST(N'2023-03-10' AS Date), CAST(90.00 AS Decimal(5, 2)))
INSERT [dbo].[EmployeeTraining] ([EmployeeID], [TrainingID], [TrainerID], [CompletingDate], [Score]) VALUES (N'E002', N'T001', N'TR01', CAST(N'2023-03-10' AS Date), CAST(88.00 AS Decimal(5, 2)))
INSERT [dbo].[EmployeeTraining] ([EmployeeID], [TrainingID], [TrainerID], [CompletingDate], [Score]) VALUES (N'E002', N'T005', N'TR01', CAST(N'2023-06-10' AS Date), CAST(97.00 AS Decimal(5, 2)))
INSERT [dbo].[EmployeeTraining] ([EmployeeID], [TrainingID], [TrainerID], [CompletingDate], [Score]) VALUES (N'E003', N'T003', N'TR03', CAST(N'2023-07-15' AS Date), CAST(91.00 AS Decimal(5, 2)))
INSERT [dbo].[EmployeeTraining] ([EmployeeID], [TrainingID], [TrainerID], [CompletingDate], [Score]) VALUES (N'E004', N'T004', N'TR04', CAST(N'2024-03-25' AS Date), CAST(89.00 AS Decimal(5, 2)))
INSERT [dbo].[EmployeeTraining] ([EmployeeID], [TrainingID], [TrainerID], [CompletingDate], [Score]) VALUES (N'E005', N'T005', N'TR01', CAST(N'2023-06-10' AS Date), CAST(94.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[JobTitle] ([JobTitleID], [Title], [RemoteEligibility], [BaseSalary]) VALUES (N'J01', N'Developer', 1, 70000)
INSERT [dbo].[JobTitle] ([JobTitleID], [Title], [RemoteEligibility], [BaseSalary]) VALUES (N'J02', N'Manager', 1, 85000)
INSERT [dbo].[JobTitle] ([JobTitleID], [Title], [RemoteEligibility], [BaseSalary]) VALUES (N'J03', N'Analyst', 0, 60000)
INSERT [dbo].[JobTitle] ([JobTitleID], [Title], [RemoteEligibility], [BaseSalary]) VALUES (N'J04', N'Systems Admin', 0, 60000)
GO
INSERT [dbo].[Training] ([TrainingID], [Title], [Year], [DurationDays], [DepartmentID], [CreatedBy]) VALUES (N'T001', N'Agile Basics', 2023, 5, N'D02', N'HR01')
INSERT [dbo].[Training] ([TrainingID], [Title], [Year], [DurationDays], [DepartmentID], [CreatedBy]) VALUES (N'T003', N'Financial Modeling', 2023, 6, N'D03', N'FIN01')
INSERT [dbo].[Training] ([TrainingID], [Title], [Year], [DurationDays], [DepartmentID], [CreatedBy]) VALUES (N'T004', N'Network Security', 2024, 8, N'D04', N'OPS01')
INSERT [dbo].[Training] ([TrainingID], [Title], [Year], [DurationDays], [DepartmentID], [CreatedBy]) VALUES (N'T005', N'Python Essentials', 2023, 10, N'D01', N'IT01')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UNIQUE_Department_DeptName]    Script Date: 5/2/2025 2:18:13 PM ******/
ALTER TABLE [dbo].[Department] ADD  CONSTRAINT [UNIQUE_Department_DeptName] UNIQUE NONCLUSTERED 
(
	[DeptName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UNIQUE_Department_Extension]    Script Date: 5/2/2025 2:18:13 PM ******/
ALTER TABLE [dbo].[Department] ADD  CONSTRAINT [UNIQUE_Department_Extension] UNIQUE NONCLUSTERED 
(
	[Extension] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Unique_Employee_Email]    Script Date: 5/2/2025 2:18:13 PM ******/
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [Unique_Employee_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UNIQUE_JobTitle_Title]    Script Date: 5/2/2025 2:18:13 PM ******/
ALTER TABLE [dbo].[JobTitle] ADD  CONSTRAINT [UNIQUE_JobTitle_Title] UNIQUE NONCLUSTERED 
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Department_DepartmentID] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Department_DepartmentID]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_JobTitle_JobTitleID] FOREIGN KEY([JobTitleID])
REFERENCES [dbo].[JobTitle] ([JobTitleID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_JobTitle_JobTitleID]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Manager_EmployeeID] FOREIGN KEY([ManagerID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Manager_EmployeeID]
GO
ALTER TABLE [dbo].[EmployeeEducation]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeEducation_Education_EducationID] FOREIGN KEY([EducationID])
REFERENCES [dbo].[Education] ([EducationID])
GO
ALTER TABLE [dbo].[EmployeeEducation] CHECK CONSTRAINT [FK_EmployeeEducation_Education_EducationID]
GO
ALTER TABLE [dbo].[EmployeeEducation]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeEducation_Employee_EmployeeID] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[EmployeeEducation] CHECK CONSTRAINT [FK_EmployeeEducation_Employee_EmployeeID]
GO
ALTER TABLE [dbo].[EmployeeTraining]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeTraining_Employee_EmployeeID] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[EmployeeTraining] CHECK CONSTRAINT [FK_EmployeeTraining_Employee_EmployeeID]
GO
ALTER TABLE [dbo].[EmployeeTraining]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeTraining_Employee_TrainerID] FOREIGN KEY([TrainerID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[EmployeeTraining] CHECK CONSTRAINT [FK_EmployeeTraining_Employee_TrainerID]
GO
ALTER TABLE [dbo].[EmployeeTraining]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeTraining_Training_TrainingID] FOREIGN KEY([TrainingID])
REFERENCES [dbo].[Training] ([TrainingID])
GO
ALTER TABLE [dbo].[EmployeeTraining] CHECK CONSTRAINT [FK_EmployeeTraining_Training_TrainingID]
GO
ALTER TABLE [dbo].[Training]  WITH CHECK ADD  CONSTRAINT [FK_Training_Department_DepartmentID] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
GO
ALTER TABLE [dbo].[Training] CHECK CONSTRAINT [FK_Training_Department_DepartmentID]
GO
ALTER TABLE [dbo].[Training]  WITH CHECK ADD  CONSTRAINT [FK_Training_Employee_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Training] CHECK CONSTRAINT [FK_Training_Employee_CreatedBy]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [CK_Department_FoundedIn] CHECK  (([FoundedIn]>='1900' AND [FoundedIn]<=getdate()))
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [CK_Department_FoundedIn]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [CK_Employee_BirthDate] CHECK  ((datediff(year,[BirthDate],getdate())>=(18)))
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [CK_Employee_BirthDate]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [CK_Employee_Gender] CHECK  (([Gender]='U' OR [Gender]='F' OR [Gender]='M'))
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [CK_Employee_Gender]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [CK_Employee_HireDate] CHECK  (([HireDate]<getdate()))
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [CK_Employee_HireDate]
GO
ALTER TABLE [dbo].[EmployeeEducation]  WITH CHECK ADD  CONSTRAINT [CHECK_EmployeeEducation_GPA] CHECK  (([GPA]>=(0) AND [GPA]<=(4)))
GO
ALTER TABLE [dbo].[EmployeeEducation] CHECK CONSTRAINT [CHECK_EmployeeEducation_GPA]
GO
ALTER TABLE [dbo].[EmployeeTraining]  WITH CHECK ADD  CONSTRAINT [CHECK_EmployeeTraining_Score] CHECK  (([Score]>=(0) AND [Score]<=(100)))
GO
ALTER TABLE [dbo].[EmployeeTraining] CHECK CONSTRAINT [CHECK_EmployeeTraining_Score]
GO
ALTER TABLE [dbo].[JobTitle]  WITH CHECK ADD  CONSTRAINT [CHECK_JobTitle_BaseSalary] CHECK  (([BaseSalary]>=(0)))
GO
ALTER TABLE [dbo].[JobTitle] CHECK CONSTRAINT [CHECK_JobTitle_BaseSalary]
GO
ALTER TABLE [dbo].[Training]  WITH CHECK ADD  CONSTRAINT [CHECK_Training_Duration] CHECK  (([DurationDays]>(0)))
GO
ALTER TABLE [dbo].[Training] CHECK CONSTRAINT [CHECK_Training_Duration]
GO
ALTER TABLE [dbo].[Training]  WITH CHECK ADD  CONSTRAINT [CHECK_Training_Year] CHECK  (([Year]>=(2010)))
GO
ALTER TABLE [dbo].[Training] CHECK CONSTRAINT [CHECK_Training_Year]
GO
USE [master]
GO
ALTER DATABASE [ProShop] SET  READ_WRITE 
GO
