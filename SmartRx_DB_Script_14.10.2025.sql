USE [master]
GO
/****** Object:  Database [SmartRxDB3]    Script Date: 10/14/2025 12:08:30 AM ******/

ALTER DATABASE [SmartRxDB3] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SmartRxDB3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SmartRxDB3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SmartRxDB3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SmartRxDB3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SmartRxDB3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SmartRxDB3] SET ARITHABORT OFF 
GO
ALTER DATABASE [SmartRxDB3] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SmartRxDB3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SmartRxDB3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SmartRxDB3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SmartRxDB3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SmartRxDB3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SmartRxDB3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SmartRxDB3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SmartRxDB3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SmartRxDB3] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SmartRxDB3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SmartRxDB3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SmartRxDB3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SmartRxDB3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SmartRxDB3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SmartRxDB3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SmartRxDB3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SmartRxDB3] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SmartRxDB3] SET  MULTI_USER 
GO
ALTER DATABASE [SmartRxDB3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SmartRxDB3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SmartRxDB3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SmartRxDB3] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SmartRxDB3] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SmartRxDB3] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SmartRxDB3] SET QUERY_STORE = ON
GO
ALTER DATABASE [SmartRxDB3] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200)
GO
USE [SmartRxDB3]
GO
/****** Object:  User [shahanaz]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE USER [shahanaz] FOR LOGIN [shahanaz] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 10/14/2025 12:08:30 AM ******/
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
/****** Object:  Table [dbo].[Configuration_AdviceFAQ]    Script Date: 10/14/2025 12:08:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configuration_AdviceFAQ](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Question] [nvarchar](1000) NOT NULL,
	[Answer] [nvarchar](4000) NOT NULL,
	[TagSearchKeyword] [nvarchar](4000) NOT NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedById] [bigint] NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[ModifiedById] [bigint] NULL,
	[IconFileExtension] [nvarchar](10) NULL,
	[IconFileName] [nvarchar](300) NULL,
	[IconFilePath] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Configuration_AdviceFAQ] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Configuration_ChiefComplaint]    Script Date: 10/14/2025 12:08:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configuration_ChiefComplaint](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Code] [nchar](10) NOT NULL,
	[Name] [nvarchar](300) NOT NULL,
	[Abbreviation] [nvarchar](100) NOT NULL,
	[FullForm] [nvarchar](100) NOT NULL,
	[Details] [nvarchar](1500) NOT NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedById] [bigint] NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[ModifiedById] [bigint] NULL,
 CONSTRAINT [PK_Configuration_ChiefComplaint] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Configuration_City]    Script Date: 10/14/2025 12:08:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configuration_City](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Code] [nchar](5) NOT NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedById] [bigint] NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[ModifiedById] [bigint] NULL,
	[CountryId] [bigint] NULL,
	[DistrictId] [bigint] NULL,
 CONSTRAINT [PK_Configuration_City] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Configuration_Country]    Script Date: 10/14/2025 12:08:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configuration_Country](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[Code] [nchar](3) NOT NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedById] [bigint] NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[ModifiedById] [bigint] NULL,
 CONSTRAINT [PK_Configuration_Country] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Configuration_Department]    Script Date: 10/14/2025 12:08:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configuration_Department](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](5) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[SectionId] [bigint] NULL,
	[HospitalId] [bigint] NOT NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedById] [bigint] NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[ModifiedById] [bigint] NULL,
 CONSTRAINT [PK_Configuration_Department] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Configuration_DepartmentSection]    Script Date: 10/14/2025 12:08:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configuration_DepartmentSection](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](5) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[HospitalId] [bigint] NOT NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedById] [bigint] NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[ModifiedById] [bigint] NULL,
 CONSTRAINT [PK_Configuration_DepartmentSection] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Configuration_Designation]    Script Date: 10/14/2025 12:08:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configuration_Designation](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](5) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedById] [bigint] NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[ModifiedById] [bigint] NULL,
 CONSTRAINT [PK_Configuration_Designation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Configuration_DiagnosisCenterWiseTest]    Script Date: 10/14/2025 12:08:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configuration_DiagnosisCenterWiseTest](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TestCenterId] [bigint] NOT NULL,
	[TestId] [bigint] NOT NULL,
	[DiagnosticCenterGivenTestName] [nvarchar](1000) NOT NULL,
	[DiagnosticCenterGivenPrice] [decimal](10, 2) NULL,
	[DiscountByAuthority] [decimal](10, 2) NULL,
	[Schedule] [nvarchar](1000) NULL,
	[ReportDeliveryTime] [nvarchar](1000) NULL,
	[SpecialNote] [nvarchar](1000) NULL,
	[Remarks] [nvarchar](1000) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedById] [bigint] NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[ModifiedById] [bigint] NULL,
	[PriceUnitId] [bigint] NULL,
	[TestCenterBranchId] [bigint] NULL,
 CONSTRAINT [PK_Configuration_DiagnosisCenterWiseTest] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Configuration_District]    Script Date: 10/14/2025 12:08:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configuration_District](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Code] [nchar](2) NOT NULL,
	[Name] [varchar](150) NOT NULL,
	[DivisionId] [int] NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedById] [bigint] NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[ModifiedById] [bigint] NULL,
 CONSTRAINT [PK_Configuration_District] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Configuration_Doctor]    Script Date: 10/14/2025 12:08:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configuration_Doctor](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Code] [nchar](10) NOT NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedById] [bigint] NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[ModifiedById] [bigint] NULL,
	[BMDCRegNo] [nvarchar](max) NULL,
	[ChamberIds] [nvarchar](max) NULL,
	[Comments] [nvarchar](max) NULL,
	[EducationDegreeIds] [nvarchar](200) NULL,
	[Experiences] [nvarchar](max) NULL,
	[FirstName] [nvarchar](200) NOT NULL,
	[LastName] [nvarchar](200) NOT NULL,
	[ProfessionalSummary] [nvarchar](max) NULL,
	[Rating] [decimal](18, 2) NULL,
	[SpecializedArea] [nvarchar](200) NULL,
	[YearOfExperiences] [int] NOT NULL,
	[ProfilePhotoName] [nvarchar](200) NULL,
	[ProfilePhotoPath] [nvarchar](2000) NULL,
 CONSTRAINT [PK_Configuration_Doctor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Configuration_DoctorChamber]    Script Date: 10/14/2025 12:08:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configuration_DoctorChamber](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[DoctorId] [bigint] NOT NULL,
	[HospitalId] [bigint] NOT NULL,
	[DepartmentSectionId] [bigint] NULL,
	[DepartmentId] [bigint] NOT NULL,
	[CityId] [bigint] NOT NULL,
	[DoctorDesignationInChamberId] [bigint] NULL,
	[VisitingHour] [nvarchar](10) NOT NULL,
	[Remarks] [nvarchar](500) NULL,
	[DoctorSpecialization] [nvarchar](500) NOT NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedById] [bigint] NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[ModifiedById] [bigint] NULL,
	[IsMainChamber] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[ChamberAddress] [nvarchar](1500) NOT NULL,
	[ChamberCityId] [bigint] NOT NULL,
	[ChamberClosedOnDay] [nvarchar](100) NULL,
	[ChamberDescription] [nvarchar](500) NOT NULL,
	[ChamberEmail] [nvarchar](200) NULL,
	[ChamberEndTime] [nvarchar](6) NULL,
	[ChamberGoogleAddress] [nvarchar](2000) NOT NULL,
	[ChamberGoogleLocationLink] [nvarchar](2000) NOT NULL,
	[ChamberGoogleRating] [nvarchar](5) NULL,
	[ChamberName] [nvarchar](500) NOT NULL,
	[ChamberOtherDoctorsId] [nvarchar](50) NULL,
	[ChamberOverseasCaller] [nvarchar](50) NULL,
	[ChamberPostalCode] [nvarchar](20) NOT NULL,
	[ChamberStartTime] [nvarchar](6) NULL,
	[ChamberType] [nvarchar](max) NOT NULL,
	[ChamberVisitingHours] [nvarchar](10) NULL,
	[ChamberWhatsAppNumber] [nvarchar](25) NULL,
	[DoctorBookingMobileNos] [nvarchar](200) NULL,
	[Helpline_CallCenter] [nvarchar](15) NULL,
	[DoctorVisitingDaysInChamber] [nvarchar](400) NOT NULL,
 CONSTRAINT [PK_Configuration_DoctorChamber] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Configuration_Education]    Script Date: 10/14/2025 12:08:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configuration_Education](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](5) NOT NULL,
	[DegreeName] [nvarchar](300) NOT NULL,
	[Description] [nvarchar](1500) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedById] [bigint] NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[ModifiedById] [bigint] NULL,
	[InstitutionName] [nvarchar](200) NULL,
 CONSTRAINT [PK_Configuration_Education] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Configuration_Hospital]    Script Date: 10/14/2025 12:08:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configuration_Hospital](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](5) NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[Address] [nvarchar](2000) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedById] [bigint] NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[ModifiedById] [bigint] NULL,
	[CityId] [bigint] NULL,
	[CloseDay] [nvarchar](20) NULL,
	[CloseTime] [nvarchar](20) NULL,
	[Description] [nvarchar](4000) NOT NULL,
	[Fax] [nvarchar](300) NULL,
	[GoogleLocation] [nvarchar](3000) NULL,
	[GoogleRating] [nvarchar](10) NULL,
	[Mobile] [nvarchar](300) NULL,
	[OpenDay] [nvarchar](20) NULL,
	[OpenTime] [nvarchar](20) NULL,
	[Phone] [nvarchar](300) NULL,
	[Weekend] [nvarchar](20) NULL,
	[IsActive] [bit] NOT NULL,
	[Remarks] [nvarchar](1000) NULL,
	[WebAddress] [nvarchar](1000) NULL,
	[YearEstablished] [nvarchar](50) NULL,
	[DiagnosticCenterIcon] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](200) NULL,
	[Location] [nvarchar](100) NULL,
	[Branch] [nvarchar](500) NOT NULL,
	[IsMainBranch] [bit] NULL,
 CONSTRAINT [PK_Configuration_Hospital] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Configuration_Investigation]    Script Date: 10/14/2025 12:08:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configuration_Investigation](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Code] [nchar](5) NOT NULL,
	[TestName] [nvarchar](1000) NOT NULL,
	[TestDescription] [nvarchar](4000) NULL,
	[TestFullName] [nvarchar](1000) NULL,
	[TestShortName] [nvarchar](200) NULL,
	[TestNameByDiagnosticCenter] [nvarchar](1000) NULL,
	[UnitPrice] [decimal](10, 2) NOT NULL,
	[PriceUnitId] [bigint] NULL,
	[NationalUnitPrice] [decimal](10, 2) NOT NULL,
	[NationalPriceUnitId] [bigint] NULL,
	[Speciality] [nvarchar](2000) NULL,
	[Comments] [nvarchar](2000) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedById] [bigint] NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[ModifiedById] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[Specimen] [nvarchar](500) NULL,
	[TestGenericName] [nvarchar](1000) NULL,
	[NationalPriceReference] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Configuration_Investigation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Configuration_InvestigationFAQ]    Script Date: 10/14/2025 12:08:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configuration_InvestigationFAQ](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[InvestigationId] [bigint] NOT NULL,
	[Question] [nvarchar](max) NOT NULL,
	[Answer] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedById] [bigint] NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[ModifiedById] [bigint] NULL,
 CONSTRAINT [PK_Configuration_InvestigationFAQ] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Configuration_Medicine]    Script Date: 10/14/2025 12:08:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configuration_Medicine](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[BrandId] [bigint] NOT NULL,
	[Type] [nvarchar](200) NOT NULL,
	[Slug] [nvarchar](400) NULL,
	[DosageFormId] [bigint] NOT NULL,
	[GenericId] [bigint] NOT NULL,
	[Strength] [nvarchar](500) NULL,
	[MeasurementUnitId] [bigint] NULL,
	[UnitPrice] [decimal](5, 2) NULL,
	[PriceInUnitId] [bigint] NULL,
	[PackageType] [nvarchar](300) NULL,
	[PackageSize] [nvarchar](100) NULL,
	[PackageQuantity] [nvarchar](100) NULL,
	[DAR] [nvarchar](300) NULL,
	[Indication] [nvarchar](300) NULL,
	[Pharmacology] [nvarchar](300) NULL,
	[DoseDescription] [nvarchar](500) NULL,
	[Administration] [nvarchar](300) NULL,
	[Contradiction] [nvarchar](300) NULL,
	[SideEffects] [nvarchar](300) NULL,
	[PrecautionsAndWarnings] [nvarchar](500) NULL,
	[PregnencyAndLactation] [nvarchar](500) NULL,
	[ModeOfAction] [nvarchar](1) NULL,
	[Interaction] [nvarchar](100) NULL,
	[OverdoseEffects] [nvarchar](200) NULL,
	[TherapeuticClass] [nvarchar](100) NULL,
	[StorageCondition] [nvarchar](300) NULL,
	[UserFor] [nvarchar](100) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedById] [bigint] NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[ModifiedById] [bigint] NULL,
	[Name] [nvarchar](500) NOT NULL,
	[CompanyDiscountPercentage] [decimal](5, 2) NULL,
 CONSTRAINT [PK_Configuration_Medicine] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Configuration_MedicineBrand]    Script Date: 10/14/2025 12:08:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configuration_MedicineBrand](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ManufacturerId] [bigint] NOT NULL,
	[BrandCode] [nvarchar](5) NOT NULL,
	[Name] [nvarchar](300) NOT NULL,
	[Description] [nvarchar](4000) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedById] [bigint] NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[ModifiedById] [bigint] NULL,
	[BrandPublicId] [bigint] NOT NULL,
 CONSTRAINT [PK_Configuration_MedicineBrand] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Configuration_MedicineDosageForm]    Script Date: 10/14/2025 12:08:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configuration_MedicineDosageForm](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](2000) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedById] [bigint] NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[ModifiedById] [bigint] NULL,
	[ShortForm] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_Configuration_MedicineDosageForm] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Configuration_MedicineFAQ]    Script Date: 10/14/2025 12:08:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configuration_MedicineFAQ](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedById] [bigint] NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[ModifiedById] [bigint] NULL,
	[Question] [nvarchar](max) NOT NULL,
	[Answer] [nvarchar](max) NOT NULL,
	[MedicineId] [bigint] NOT NULL,
 CONSTRAINT [PK_Configuration_MedicineFAQ] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Configuration_MedicineGeneric]    Script Date: 10/14/2025 12:08:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configuration_MedicineGeneric](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](300) NOT NULL,
	[Description] [nvarchar](4000) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedById] [bigint] NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[ModifiedById] [bigint] NULL,
 CONSTRAINT [PK_Configuration_MedicineGeneric] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Configuration_MedicineManufactureInfo]    Script Date: 10/14/2025 12:08:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configuration_MedicineManufactureInfo](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](1000) NOT NULL,
	[OriginRegion] [nvarchar](100) NULL,
	[Importer] [nvarchar](200) NULL,
	[EstablishedDate] [datetime2](7) NULL,
	[Products] [nvarchar](4000) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedById] [bigint] NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[ModifiedById] [bigint] NULL,
	[CompanyUrl] [nvarchar](200) NULL,
 CONSTRAINT [PK_Configuration_MedicineManufactureInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Configuration_PoliceStation]    Script Date: 10/14/2025 12:08:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configuration_PoliceStation](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Code] [nchar](10) NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[CityId] [bigint] NOT NULL,
	[DistrictId] [bigint] NOT NULL,
	[CountryId] [bigint] NOT NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedById] [bigint] NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[ModifiedById] [bigint] NULL,
 CONSTRAINT [PK_Configuration_PoliceStation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Configuration_PrescriptionSection]    Script Date: 10/14/2025 12:08:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configuration_PrescriptionSection](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](2) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[HeadlineText] [nvarchar](100) NOT NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedById] [bigint] NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[ModifiedById] [bigint] NULL,
 CONSTRAINT [PK_Configuration_PrescriptionSection] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Configuration_Reward]    Script Date: 10/14/2025 12:08:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configuration_Reward](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Heading] [nvarchar](150) NOT NULL,
	[Details] [nvarchar](500) NULL,
	[IsNegativePointAllowed] [bit] NOT NULL,
	[NonCashablePoints] [int] NOT NULL,
	[IsCashable] [bit] NOT NULL,
	[CashablePoints] [int] NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedById] [bigint] NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[ModifiedById] [bigint] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Configuration_Reward] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Configuration_RewardBadge]    Script Date: 10/14/2025 12:08:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configuration_RewardBadge](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedById] [bigint] NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[ModifiedById] [bigint] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Configuration_RewardBadge] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Configuration_SmartRxAcronym]    Script Date: 10/14/2025 12:08:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configuration_SmartRxAcronym](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Acronym] [nvarchar](100) NULL,
	[Abbreviation] [nvarchar](500) NULL,
	[Details] [nvarchar](2000) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedById] [bigint] NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[ModifiedById] [bigint] NULL,
	[Elaboration] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Configuration_SmartRxAcronym] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Configuration_Tags]    Script Date: 10/14/2025 12:08:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configuration_Tags](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TagShortName] [nvarchar](200) NOT NULL,
	[TagDescription] [nvarchar](1000) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedById] [bigint] NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[ModifiedById] [bigint] NULL,
	[TagPrescriptionSection] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Configuration_Tags] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Configuration_Unit]    Script Date: 10/14/2025 12:08:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configuration_Unit](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Code] [nchar](4) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[MeasurementUnit] [nvarchar](100) NOT NULL,
	[Details] [nvarchar](500) NULL,
	[Description] [nvarchar](1000) NULL,
	[Type] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedById] [bigint] NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[ModifiedById] [bigint] NULL,
 CONSTRAINT [PK_Configuration_Unit] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Configuration_Vital]    Script Date: 10/14/2025 12:08:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configuration_Vital](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Code] [nchar](2) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[ApplicableEntity] [nvarchar](200) NULL,
	[UnitId] [bigint] NOT NULL,
	[LowRange] [decimal](5, 2) NULL,
	[LowStatus] [nvarchar](15) NULL,
	[MidRange] [decimal](5, 2) NULL,
	[MidStatus] [nvarchar](15) NULL,
	[MidNextRange] [decimal](5, 2) NULL,
	[MidNextStatus] [nvarchar](15) NULL,
	[HighRange] [decimal](5, 2) NULL,
	[HighStatus] [nvarchar](15) NULL,
	[ExtremeRange] [decimal](5, 2) NULL,
	[ExtremeStatus] [nvarchar](15) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedById] [bigint] NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[ModifiedById] [bigint] NULL,
 CONSTRAINT [PK_Configuration_Vital] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Configuration_VitalFAQ]    Script Date: 10/14/2025 12:08:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configuration_VitalFAQ](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Question] [nvarchar](1000) NOT NULL,
	[Answer] [nvarchar](4000) NOT NULL,
	[TagSearchKeyword] [nvarchar](4000) NOT NULL,
	[IconFileName] [nvarchar](300) NULL,
	[IconFilePath] [nvarchar](1000) NULL,
	[IconFileExtension] [nvarchar](10) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedById] [bigint] NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[ModifiedById] [bigint] NULL,
	[VitalId] [bigint] NOT NULL,
 CONSTRAINT [PK_Configuration_VitalFAQ] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prescription_Upload]    Script Date: 10/14/2025 12:08:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prescription_Upload](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[PrescriptionCode] [nchar](20) NOT NULL,
	[PatientId] [bigint] NULL,
	[SmartRxId] [bigint] NULL,
	[IsExistingPatient] [bit] NULL,
	[HasExistingRelative] [bit] NULL,
	[RelativePatientIds] [nvarchar](max) NULL,
	[FileName] [nvarchar](300) NOT NULL,
	[FilePath] [nvarchar](1000) NOT NULL,
	[FileExtension] [nvarchar](10) NOT NULL,
	[NumberOfFilesStoredForThisPrescription] [int] NOT NULL,
	[UserId] [bigint] NOT NULL,
	[FolderId] [bigint] NOT NULL,
	[IsSmartRxRequested] [bit] NULL,
	[IsLocked] [bit] NULL,
	[LockedById] [bigint] NULL,
	[LockedDate] [datetime2](7) NULL,
	[IsReported] [bit] NULL,
	[ReportById] [bigint] NULL,
	[ReportDate] [datetime2](7) NULL,
	[ReportReason] [nvarchar](1000) NULL,
	[ReportDetails] [nvarchar](4000) NULL,
	[IsRecommended] [bit] NULL,
	[RecommendedById] [bigint] NULL,
	[RecommendedDate] [datetime2](7) NULL,
	[IsApproved] [bit] NULL,
	[ApprovedById] [bigint] NULL,
	[ApprovedDate] [datetime2](7) NULL,
	[IsCompleted] [bit] NULL,
	[CompletedById] [bigint] NULL,
	[CompletedDate] [datetime2](7) NULL,
	[Tag1] [nvarchar](50) NULL,
	[Tag2] [nvarchar](50) NULL,
	[Tag3] [nvarchar](50) NULL,
	[Tag4] [nvarchar](50) NULL,
	[Tag5] [nvarchar](50) NULL,
	[NextAppoinmentDate] [datetime2](7) NULL,
	[NextAppoinmentTime] [nvarchar](10) NULL,
	[DiscountPercentageOnMedicineByDoctor] [decimal](5, 2) NULL,
	[DiscountPercentageOnInvestigationByDoctor] [decimal](5, 2) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedById] [bigint] NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[ModifiedById] [bigint] NULL,
	[PrescriptionDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Prescription_Upload] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prescription_UserWiseFolder]    Script Date: 10/14/2025 12:08:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prescription_UserWiseFolder](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ParentFolderId] [bigint] NULL,
	[FolderHierarchy] [varchar](50) NOT NULL,
	[FolderName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[UserId] [bigint] NOT NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedById] [bigint] NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[ModifiedById] [bigint] NULL,
	[PatientId] [bigint] NULL,
 CONSTRAINT [PK_Prescription_UserWiseFolder] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Security_PMSRole]    Script Date: 10/14/2025 12:08:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Security_PMSRole](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[IsSelfService] [bit] NOT NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedById] [bigint] NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[ModifiedById] [bigint] NULL,
 CONSTRAINT [PK_Security_PMSRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Security_PMSUser]    Script Date: 10/14/2025 12:08:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Security_PMSUser](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserCode] [nvarchar](10) NOT NULL,
	[UserName] [nvarchar](300) NOT NULL,
	[Password] [nvarchar](300) NULL,
	[MobileNo] [nvarchar](50) NOT NULL,
	[GoogleId] [nvarchar](200) NULL,
	[FacebookId] [nvarchar](200) NULL,
	[TwitterId] [nvarchar](200) NULL,
	[Email] [nvarchar](200) NULL,
	[FirstName] [nvarchar](200) NOT NULL,
	[LastName] [nvarchar](200) NOT NULL,
	[AuthMethod] [int] NOT NULL,
	[EmployeeId] [int] NULL,
	[EmployeeCode] [nvarchar](10) NULL,
	[Gender] [int] NOT NULL,
	[DateOfBirth] [datetime2](7) NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[CreatedById] [bigint] NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[ModifiedById] [bigint] NULL,
	[SmartRxUserEntityId] [bigint] NULL,
 CONSTRAINT [PK_Security_PMSUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Security_PMSUserWiseRole]    Script Date: 10/14/2025 12:08:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Security_PMSUserWiseRole](
	[UserId] [bigint] NOT NULL,
	[RoleId] [bigint] NOT NULL,
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedById] [bigint] NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[ModifiedById] [bigint] NULL,
 CONSTRAINT [PK_Security_PMSUserWiseRole] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SmartRx_Master]    Script Date: 10/14/2025 12:08:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SmartRx_Master](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[PatientId] [bigint] NOT NULL,
	[ChiefComplaintIds] [nvarchar](max) NOT NULL,
	[NextAppoinmentDate] [datetime2](7) NULL,
	[NextAppoinmentTime] [varchar](10) NULL,
	[DiscountPercentageOnMedicineByDoctor] [decimal](5, 2) NULL,
	[DiscountPercentageOnInvestigationByDoctor] [decimal](18, 2) NULL,
	[Remarks] [nvarchar](max) NULL,
	[IsLocked] [bit] NULL,
	[LockedById] [bigint] NULL,
	[LockedDate] [datetime2](7) NULL,
	[IsReported] [bit] NULL,
	[ReportById] [bigint] NULL,
	[ReportDate] [datetime2](7) NULL,
	[ReportReason] [varchar](500) NULL,
	[ReportDetails] [varchar](4000) NULL,
	[IsRecommended] [bit] NULL,
	[RecommendedById] [bigint] NULL,
	[RecommendedDate] [datetime2](7) NULL,
	[IsApproved] [bit] NULL,
	[ApprovedById] [bigint] NULL,
	[ApprovedDate] [datetime2](7) NULL,
	[IsCompleted] [bit] NULL,
	[CompletedById] [bigint] NULL,
	[CompletedDate] [datetime2](7) NULL,
	[IsRejected] [bit] NULL,
	[RejectedById] [bigint] NULL,
	[RejectedDate] [datetime2](7) NULL,
	[RejectionRemarks] [nvarchar](max) NULL,
	[IsExistingPatient] [bit] NULL,
	[HasAnyRelative] [bit] NULL,
	[Tag1] [nvarchar](50) NULL,
	[Tag2] [nvarchar](50) NULL,
	[Tag3] [nvarchar](50) NULL,
	[Tag4] [nvarchar](50) NULL,
	[Tag5] [nvarchar](50) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedById] [bigint] NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[ModifiedById] [bigint] NULL,
	[HasInvestigationFavourite] [bit] NULL,
	[HasMedicineFavourite] [bit] NULL,
	[PrescriptionId] [bigint] NOT NULL,
	[PrescriptionDate] [datetime2](7) NULL,
 CONSTRAINT [PK_SmartRx_Master] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SmartRx_PatientAdvice]    Script Date: 10/14/2025 12:08:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SmartRx_PatientAdvice](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SmartRxMasterId] [bigint] NOT NULL,
	[PrescriptionId] [bigint] NOT NULL,
	[Advice] [nvarchar](max) NOT NULL,
	[AdviceKeywordToRecommend] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedById] [bigint] NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[ModifiedById] [bigint] NULL,
 CONSTRAINT [PK_SmartRx_PatientAdvice] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SmartRx_PatientChiefComplaint]    Script Date: 10/14/2025 12:08:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SmartRx_PatientChiefComplaint](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SmartRxMasterId] [bigint] NOT NULL,
	[UploadedPrescriptionId] [bigint] NOT NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedById] [bigint] NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[ModifiedById] [bigint] NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_SmartRx_PatientChiefComplaint] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SmartRx_PatientDoctor]    Script Date: 10/14/2025 12:08:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SmartRx_PatientDoctor](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SmartRxMasterId] [bigint] NOT NULL,
	[PrescriptionId] [bigint] NOT NULL,
	[DoctorId] [bigint] NOT NULL,
	[ChamberWaitTime] [nvarchar](10) NOT NULL,
	[ChamberFee] [decimal](18, 2) NULL,
	[DoctorRating] [decimal](5, 2) NULL,
	[Comments] [nvarchar](max) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedById] [bigint] NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[ModifiedById] [bigint] NULL,
	[ActiveChamberId] [bigint] NULL,
	[ChamberFeeMeasurementUnitId] [bigint] NULL,
	[ChamberWaitTimeHour] [nvarchar](50) NULL,
	[ChamberWaitTimeMinute] [int] NULL,
	[ConsultingDurationInMinutes] [int] NULL,
	[OtherExpense] [decimal](18, 2) NULL,
	[TransportExpense] [decimal](18, 2) NULL,
	[TravelTimeMinute] [decimal](18, 2) NULL,
 CONSTRAINT [PK_SmartRx_PatientDoctor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SmartRx_PatientHistory]    Script Date: 10/14/2025 12:08:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SmartRx_PatientHistory](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SmartRxMasterId] [bigint] NOT NULL,
	[PrescriptionId] [bigint] NOT NULL,
	[Details] [nvarchar](max) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedById] [bigint] NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[ModifiedById] [bigint] NULL,
	[Title] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_SmartRx_PatientHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SmartRx_PatientInvestigation]    Script Date: 10/14/2025 12:08:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SmartRx_PatientInvestigation](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SmartRxMasterId] [bigint] NOT NULL,
	[PrescriptionId] [bigint] NOT NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedById] [bigint] NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[ModifiedById] [bigint] NULL,
	[DiscountByAuthority] [decimal](10, 2) NOT NULL,
	[DiagnosticCenterWiseTestId] [bigint] NULL,
	[IsCompleted] [bit] NOT NULL,
	[Remarks] [nvarchar](1000) NULL,
	[Result] [nvarchar](1000) NULL,
	[TestDate] [datetime2](7) NOT NULL,
	[TestPrice] [decimal](10, 2) NULL,
	[TestId] [bigint] NULL,
	[UserSelectedTestCenterIds] [nvarchar](100) NULL,
	[PriceUnitId] [bigint] NULL,
	[Wishlist] [nvarchar](100) NULL,
	[DoctorRecommendedTestCenterIds] [nvarchar](max) NULL,
 CONSTRAINT [PK_SmartRx_PatientInvestigation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SmartRx_PatientMedicine]    Script Date: 10/14/2025 12:08:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SmartRx_PatientMedicine](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SmartRxMasterId] [bigint] NOT NULL,
	[PrescriptionId] [bigint] NOT NULL,
	[DurationOfContinuationCount] [int] NOT NULL,
	[Notes] [nvarchar](1000) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedById] [bigint] NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[ModifiedById] [bigint] NULL,
	[MedicineId] [bigint] NOT NULL,
	[DescriptionForMoreThanRegularDose] [nvarchar](1000) NULL,
	[Dose10InADay] [decimal](5, 2) NOT NULL,
	[Dose11InADay] [decimal](5, 2) NOT NULL,
	[Dose12InADay] [decimal](5, 2) NOT NULL,
	[Dose1InADay] [decimal](5, 2) NOT NULL,
	[Dose2InADay] [decimal](5, 2) NOT NULL,
	[Dose3InADay] [decimal](5, 2) NOT NULL,
	[Dose4InADay] [decimal](5, 2) NOT NULL,
	[Dose5InADay] [decimal](5, 2) NOT NULL,
	[Dose6InADay] [decimal](5, 2) NOT NULL,
	[Dose7InADay] [decimal](5, 2) NOT NULL,
	[Dose8InADay] [decimal](5, 2) NOT NULL,
	[Dose9InADay] [decimal](5, 2) NOT NULL,
	[DurationOfContinuation] [nvarchar](100) NOT NULL,
	[DurationOfContinuationEndDate] [datetime2](7) NOT NULL,
	[DurationOfContinuationStartDate] [datetime2](7) NOT NULL,
	[FrequencyInADay] [nvarchar](50) NULL,
	[IsBeforeMeal] [bit] NULL,
	[IsMoreThanRegularDose] [bit] NULL,
	[Restrictions] [nvarchar](1000) NULL,
	[Rules] [nvarchar](1000) NULL,
	[Wishlist] [nvarchar](100) NULL,
 CONSTRAINT [PK_SmartRx_PatientMedicine] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SmartRx_PatientOtherExpense]    Script Date: 10/14/2025 12:08:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SmartRx_PatientOtherExpense](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SmartRxMasterId] [bigint] NOT NULL,
	[PrescriptionId] [bigint] NOT NULL,
	[ExpenseName] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Amount] [decimal](10, 2) NOT NULL,
	[CurrencyUnitId] [bigint] NULL,
	[ExpenseDate] [datetime2](7) NOT NULL,
	[ExpenseNotes] [nvarchar](max) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedById] [bigint] NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[ModifiedById] [bigint] NULL,
 CONSTRAINT [PK_SmartRx_PatientOtherExpense] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SmartRx_PatientProfile]    Script Date: 10/14/2025 12:08:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SmartRx_PatientProfile](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[PatientCode] [nchar](10) NOT NULL,
	[FirstName] [nvarchar](300) NOT NULL,
	[LastName] [nvarchar](300) NOT NULL,
	[NickName] [nvarchar](200) NULL,
	[Age] [decimal](18, 2) NULL,
	[DateOfBirth] [datetime2](7) NOT NULL,
	[Gender] [int] NOT NULL,
	[BloodGroup] [int] NULL,
	[Height] [nvarchar](10) NOT NULL,
	[PhoneNumber] [nvarchar](40) NOT NULL,
	[Email] [nvarchar](200) NOT NULL,
	[ProfilePhotoName] [nvarchar](200) NULL,
	[ProfilePhotoPath] [nvarchar](2000) NULL,
	[Address] [nvarchar](2000) NULL,
	[PoliceStationId] [bigint] NULL,
	[CityId] [bigint] NULL,
	[ExistingPatientId] [bigint] NULL,
	[PostalCode] [nvarchar](20) NULL,
	[EmergencyContact] [nvarchar](max) NULL,
	[MaritalStatus] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedById] [bigint] NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[ModifiedById] [bigint] NULL,
	[IsExistingPatient] [bit] NOT NULL,
	[IsRelative] [bit] NOT NULL,
	[Profession] [nvarchar](max) NULL,
	[RelationToPatient] [nvarchar](max) NULL,
	[RelatedToPatientId] [bigint] NULL,
	[HeightFeet] [int] NULL,
	[HeightInches] [decimal](18, 2) NULL,
	[HeightMeasurementUnitId] [bigint] NULL,
	[Weight] [decimal](18, 2) NOT NULL,
	[WeightMeasurementUnitId] [bigint] NULL,
	[ProfileProgress] [int] NOT NULL,
	[AgeMonth] [int] NULL,
	[AgeYear] [int] NULL,
	[UserId] [bigint] NOT NULL,
 CONSTRAINT [PK_SmartRx_PatientProfile] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SmartRx_PatientRelatives]    Script Date: 10/14/2025 12:08:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SmartRx_PatientRelatives](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[PatientId] [bigint] NOT NULL,
	[PatientRelativeId] [bigint] NULL,
	[SmartRx_MasterId] [bigint] NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedById] [bigint] NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[ModifiedById] [bigint] NULL,
 CONSTRAINT [PK_SmartRx_PatientRelatives] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Smartrx_PatientReward]    Script Date: 10/14/2025 12:08:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Smartrx_PatientReward](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SmartRxMasterId] [bigint] NULL,
	[PrescriptionId] [bigint] NULL,
	[PatientId] [bigint] NOT NULL,
	[BadgeId] [bigint] NOT NULL,
	[EarnedNonCashablePoints] [decimal](18, 2) NOT NULL,
	[ConsumedNonCashablePoints] [decimal](18, 2) NOT NULL,
	[TotalNonCashablePoints] [decimal](18, 2) NOT NULL,
	[EarnedCashablePoints] [decimal](18, 2) NOT NULL,
	[ConsumedCashablePoints] [decimal](18, 2) NOT NULL,
	[TotalCashablePoints] [decimal](18, 2) NOT NULL,
	[EarnedMoney] [decimal](18, 2) NULL,
	[ConsumedMoney] [decimal](18, 2) NULL,
	[TotalMoney] [decimal](18, 2) NULL,
	[EncashMoney] [decimal](18, 2) NULL,
	[Remarks] [nvarchar](500) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedById] [bigint] NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[ModifiedById] [bigint] NULL,
 CONSTRAINT [PK_Smartrx_PatientReward] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SmartRx_PatientVitals]    Script Date: 10/14/2025 12:08:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SmartRx_PatientVitals](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SmartRxMasterId] [bigint] NOT NULL,
	[PrescriptionId] [bigint] NOT NULL,
	[VitalId] [bigint] NOT NULL,
	[VitalValue] [decimal](5, 2) NOT NULL,
	[VitalStatus] [nvarchar](50) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedById] [bigint] NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[ModifiedById] [bigint] NULL,
	[PatientId] [bigint] NOT NULL,
	[HeightFeet] [int] NULL,
	[HeightInches] [decimal](18, 2) NULL,
 CONSTRAINT [PK_SmartRx_PatientVitals] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SmartRx_PatientWishlist]    Script Date: 10/14/2025 12:08:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SmartRx_PatientWishlist](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SmartRxMasterId] [bigint] NOT NULL,
	[PrescriptionId] [bigint] NOT NULL,
	[WishListType] [nvarchar](50) NOT NULL,
	[PatientMedicineId] [bigint] NULL,
	[PatientTestId] [bigint] NULL,
	[PatientWishlistMedicineId] [bigint] NULL,
	[PatientRecommendedTestCenterId] [bigint] NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedById] [bigint] NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[ModifiedById] [bigint] NULL,
 CONSTRAINT [PK_SmartRx_PatientWishlist] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SmartRx_ReferredConsultant]    Script Date: 10/14/2025 12:08:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SmartRx_ReferredConsultant](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SmartRxMasterId] [bigint] NOT NULL,
	[ReferredConsultantId] [bigint] NULL,
	[ReferredBy] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedById] [bigint] NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[ModifiedById] [bigint] NULL,
 CONSTRAINT [PK_SmartRx_ReferredConsultant] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TableTest]    Script Date: 10/14/2025 12:08:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableTest](
	[Id] [bigint] NOT NULL,
	[Name] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Configuration_AdviceFAQ] ON 
GO
INSERT [dbo].[Configuration_AdviceFAQ] ([Id], [Question], [Answer], [TagSearchKeyword], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [IconFileExtension], [IconFileName], [IconFilePath]) VALUES (2, N'কেন আপনার দাঁত ব্রাশ করা গুরুত্বপূর্ণ?', N'দাঁত পরিষ্কার রাখা এবং গহ্বর প্রতিরোধ করা।', N'দাঁত, দাঁতপরিষ্কার, দাঁতব্রাশ, Teeth, TeethClean, ToothBrush', CAST(N'2025-06-30T15:30:43.1166667' AS DateTime2), 2, NULL, NULL, N'.svg', N'Advice_FAQ_ToothIcon.svg', N'photos\Advice_FAQ_ToothIcon.svg')
GO
INSERT [dbo].[Configuration_AdviceFAQ] ([Id], [Question], [Answer], [TagSearchKeyword], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [IconFileExtension], [IconFileName], [IconFilePath]) VALUES (3, N'কত ঘন ঘন আমার দাঁত ব্রাশ করা উচিত?', N'দিনে দুবার, সকাল ও রাতে।', N'দাঁত, দাঁতপরিষ্কার, দাঁতব্রাশ, দাঁতপরিষ্কারপুনরাবৃত্তিরহার, Teeth, TeethClean, ToothBrush, ToothCleaningFrequency', CAST(N'2025-06-30T15:30:43.1300000' AS DateTime2), 2, NULL, NULL, N'.svg', N'Advice_FAQ_ToothIcon.svg', N'photos\Advice_FAQ_ToothIcon.svg')
GO
INSERT [dbo].[Configuration_AdviceFAQ] ([Id], [Question], [Answer], [TagSearchKeyword], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [IconFileExtension], [IconFileName], [IconFilePath]) VALUES (4, N'কেন আমার ফ্লস করা দরকার?', N'ফ্লসিং দাঁতের মধ্যে আটকে থাকা খাবার দূর করে এবং মাড়ির সমস্যা প্রতিরোধ করে।', N'দাঁত, দাঁতপরিষ্কার, দাঁতফ্লস, ফ্লস, Teeth, TeethClean, TeethFloss, Floss, ToothFloss', CAST(N'2025-06-30T15:30:43.1366667' AS DateTime2), 2, NULL, NULL, N'.svg', N'Advice_FAQ_ToothIcon.svg', N'photos\Advice_FAQ_ToothIcon.svg')
GO
INSERT [dbo].[Configuration_AdviceFAQ] ([Id], [Question], [Answer], [TagSearchKeyword], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [IconFileExtension], [IconFileName], [IconFilePath]) VALUES (5, N'গহ্বরের কারণ কী?', N'মুখের ব্যাকটেরিয়া যা খাবার এবং পানীয় থেকে শর্করা খায়।', N'দাঁত, মুখেরব্যাকটেরিয়া, Teeth, MouthBacteria', CAST(N'2025-06-30T15:30:43.1466667' AS DateTime2), 2, NULL, NULL, N'.svg', N'Advice_FAQ_ToothIcon.svg', N'photos\Advice_FAQ_ToothIcon.svg')
GO
INSERT [dbo].[Configuration_AdviceFAQ] ([Id], [Question], [Answer], [TagSearchKeyword], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [IconFileExtension], [IconFileName], [IconFilePath]) VALUES (6, N'কত ঘন ঘন আমার ডেন্টিস্টের কাছে যাওয়া উচিত?', N'বছরে অন্তত একবার চেকআপ এবং পরিষ্কারের জন্য। এই প্রশ্নের উত্তর প্রতিটি রোগীর জন্য ভিন্ন। ভাল সামগ্রিক মৌখিক স্বাস্থ্য সহ একটি রোগীর জন্য, প্রতি চার থেকে ছয় মাস ভাল মৌখিক স্বাস্থ্যবিধি বজায় রাখার জন্য যথেষ্ট। যাইহোক, যে সমস্ত রোগীরা পিরিয়ডন্টাল রোগ এবং অন্যান্য মৌখিক স্বাস্থ্য সংক্রান্ত উদ্বেগে ভুগছেন তাদের মুখের স্বাস্থ্যের একটি মানসম্পন্ন অবস্থা অর্জন না হওয়া পর্যন্ত আরও নিয়মিত দাঁতের ডাক্তারের কাছে যেতে হবে। পরের বার চেকআপের জন্য আপনার ডেন্টিস্টের সাথে কথা বলতে ভুলবেন না।', N'দাঁত, ডেন্টিস্ট, মৌখিকস্বাস্থ্য, Teeth, DentalDisease, MouthHealth', CAST(N'2025-06-30T15:30:43.1600000' AS DateTime2), 2, NULL, NULL, N'.svg', N'Advice_FAQ_ToothIcon.svg', N'photos\Advice_FAQ_ToothIcon.svg')
GO
INSERT [dbo].[Configuration_AdviceFAQ] ([Id], [Question], [Answer], [TagSearchKeyword], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [IconFileExtension], [IconFileName], [IconFilePath]) VALUES (7, N'কিভাবে মাড়ি রোগ প্রতিরোধ করতে পারি?', N'মাড়ির রোগটি অবিশ্বাস্যভাবে উদ্বেগজনক হতে পারে, বিশেষ করে যদি এটি দীর্ঘস্থায়ী হয় এবং সময়মতো চিকিত্সা না করা হয়। পরবর্তীকালে, মাড়ির রোগের সাথে মোকাবিলা করার সর্বোত্তম উপায় হল এটিকে প্রথম স্থানে হওয়া থেকে প্রতিরোধ করা। মাড়ির রোগ প্রতিরোধ করার এবং দাঁতের ভাল স্বাস্থ্য বজায় রাখার সর্বোত্তম উপায় হল ভাল ওরাল হাইজিন অনুশীলন করা, যার মধ্যে রয়েছে দিনে কয়েকবার পুরো মুখ ব্রাশ করা, ফ্লস করা এবং প্রতিদিন মাউথওয়াশ ব্যবহার করা এবং নিয়মিত ডেন্টিস্টের কাছে যাওয়া।', N'দাঁত, মাড়িররোগ, মাড়িরোগ, Teeth, Gumdisease, TeethDiseases, ToothDiseases', CAST(N'2025-06-30T15:30:43.1733333' AS DateTime2), 2, NULL, NULL, N'.svg', N'Advice_FAQ_ToothIcon.svg', N'photos\Advice_FAQ_ToothIcon.svg')
GO
INSERT [dbo].[Configuration_AdviceFAQ] ([Id], [Question], [Answer], [TagSearchKeyword], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [IconFileExtension], [IconFileName], [IconFilePath]) VALUES (8, N'মুখের ক্যান্সারের লক্ষণ কি?', N'আমাদের বয়স বাড়ার সাথে সাথে মুখের ক্যান্সারের ঝুঁকি বাড়তে পারে, যে কারণে মুখের ক্যান্সারের লক্ষণগুলি বোঝা এবং মাঝে মাঝে তাদের পরীক্ষা করা গুরুত্বপূর্ণ। মুখের ক্যান্সারের সবচেয়ে উল্লেখযোগ্য লক্ষণগুলির মধ্যে রয়েছে ঘা, পিণ্ড বা বাম্প যা মুখের ভিতর বিকশিত হয়, আলগা দাঁত, মুখ বা কানে ব্যথা এবং মুখের ভিতরে বিবর্ণতা। মুখের ক্যান্সার আছে কিনা এমন উদ্বেগ থাকলে একজন ডেন্টিস্টের সাথে কথা বলতে ভুলবেন না।', N'দাঁত, দাঁতপরিষ্কার, মুখেরক্যান্সার, মুখেরক্যান্সারলক্ষণ, মুখেরক্যান্সারেরলক্ষণ, Teeth, TeethClean, ToothBrush, MouthCancer, MouthCancerSymptom', CAST(N'2025-06-30T15:30:43.1900000' AS DateTime2), 2, NULL, NULL, N'.svg', N'Advice_FAQ_ToothIcon.svg', N'photos\Advice_FAQ_ToothIcon.svg')
GO
INSERT [dbo].[Configuration_AdviceFAQ] ([Id], [Question], [Answer], [TagSearchKeyword], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [IconFileExtension], [IconFileName], [IconFilePath]) VALUES (9, N'পরিবেশগত এলার্জি কি?', N'পরিবেশগত অ্যালার্জি হল আপনার পরিবেশের এমন পদার্থ যা আপনার ইমিউন সিস্টেমকে অতিরিক্ত প্রতিক্রিয়া দেখায়। সাধারণত, এই পদার্থগুলি - যাকে অ্যালার্জেন বলা হয়।', N'এলার্জি, পরিবেশগতঅ্যালার্জি, অ্যালার্জেন, Allergy, EnvironmentalAllergy, Allergen', CAST(N'2025-06-30T15:39:47.4300000' AS DateTime2), 2, NULL, NULL, N'.svg', N'Advice_FAQ_ColdTherapy.svg', N'photos\Advice_FAQ_ColdTherapy.svg')
GO
INSERT [dbo].[Configuration_AdviceFAQ] ([Id], [Question], [Answer], [TagSearchKeyword], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [IconFileExtension], [IconFileName], [IconFilePath]) VALUES (10, N'পরিবেশগত এলার্জি কাদের প্রভাবিত করে?', N'পরিবেশগত অ্যালার্জি যে কাউকে প্রভাবিত করতে পারে।
আপনার জৈবিক পিতামাতার পরিবেশগত অ্যালার্জি থাকলে আপনার পরিবেশগত অ্যালার্জি হওয়ার বা বিকাশের সম্ভাবনা বেশি।', N'এলার্জি, পরিবেশগতঅ্যালার্জি, অ্যালার্জেন, Allergy, EnvironmentalAllergy, Allergen, AllergyImpact, AllergyAffected, AllergyEffect', CAST(N'2025-06-30T15:39:47.4433333' AS DateTime2), 2, NULL, NULL, N'.svg', N'Advice_FAQ_ColdTherapy.svg', N'photos\Advice_FAQ_ColdTherapy.svg')
GO
INSERT [dbo].[Configuration_AdviceFAQ] ([Id], [Question], [Answer], [TagSearchKeyword], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [IconFileExtension], [IconFileName], [IconFilePath]) VALUES (11, N'পরিবেশগত এলার্জি শরীরকে কিভাবে প্রভাবিত করে?', N'পরিবেশগত এলার্জি একটি এলার্জি প্রতিক্রিয়া সৃষ্টি করে। অ্যালার্জির প্রতিক্রিয়া হল অ্যালার্জেনের প্রতি আপনার শরীরের প্রতিক্রিয়া। আপনি এক বা একাধিক অ্যালার্জেনের প্রতি সংবেদনশীল হতে পারেন।', N'এলার্জি, পরিবেশগতঅ্যালার্জি, অ্যালার্জেন, এলার্জিপ্রতিক্রিয়া, Allergy, EnvironmentalAllergy, Allergen, AllergyImpact, AllergyAffected, AllergyEffect, AllergyReaction', CAST(N'2025-06-30T15:39:47.4500000' AS DateTime2), 2, NULL, NULL, N'.svg', N'Advice_FAQ_ColdTherapy.svg', N'photos\Advice_FAQ_ColdTherapy.svg')
GO
SET IDENTITY_INSERT [dbo].[Configuration_AdviceFAQ] OFF
GO
SET IDENTITY_INSERT [dbo].[Configuration_City] ON 
GO
INSERT [dbo].[Configuration_City] ([Id], [Name], [Code], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CountryId], [DistrictId]) VALUES (1, N'Dhaka', N'00001', CAST(N'2025-05-29T13:02:21.3800000' AS DateTime2), 2, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Configuration_City] ([Id], [Name], [Code], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CountryId], [DistrictId]) VALUES (2, N'Rajshahi', N'00002', CAST(N'2025-05-29T13:02:36.0600000' AS DateTime2), 2, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Configuration_City] ([Id], [Name], [Code], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CountryId], [DistrictId]) VALUES (3, N'Barishal', N'00003', CAST(N'2025-05-29T13:02:44.5800000' AS DateTime2), 2, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Configuration_City] ([Id], [Name], [Code], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CountryId], [DistrictId]) VALUES (4, N'Chattagram', N'00004', CAST(N'2025-05-29T13:03:02.6500000' AS DateTime2), 2, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Configuration_City] ([Id], [Name], [Code], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CountryId], [DistrictId]) VALUES (5, N'Khulna', N'00005', CAST(N'2025-05-29T13:03:11.6800000' AS DateTime2), 2, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Configuration_City] OFF
GO
SET IDENTITY_INSERT [dbo].[Configuration_Country] ON 
GO
INSERT [dbo].[Configuration_Country] ([Id], [Name], [Code], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (1, N'Bangladesh', N'001', CAST(N'2025-05-29T13:00:03.0900000' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_Country] ([Id], [Name], [Code], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (2, N'Chaina', N'002', CAST(N'2025-05-29T13:00:22.5233333' AS DateTime2), 2, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Configuration_Country] OFF
GO
SET IDENTITY_INSERT [dbo].[Configuration_Department] ON 
GO
INSERT [dbo].[Configuration_Department] ([Id], [Code], [Name], [SectionId], [HospitalId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (1, N'00001', N'Emergency Department (ED)', NULL, 11, CAST(N'2025-05-29T13:55:07.9933333' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_Department] ([Id], [Code], [Name], [SectionId], [HospitalId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (2, N'00002', N'Cardiology', NULL, 11, CAST(N'2025-05-29T13:55:08.0200000' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_Department] ([Id], [Code], [Name], [SectionId], [HospitalId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (3, N'00003', N'Neurology', NULL, 11, CAST(N'2025-05-29T13:55:08.0200000' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_Department] ([Id], [Code], [Name], [SectionId], [HospitalId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (4, N'00004', N'Pediatrics', NULL, 11, CAST(N'2025-05-29T13:55:08.0233333' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_Department] ([Id], [Code], [Name], [SectionId], [HospitalId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (5, N'00005', N'Obstetrics and Gynecology', NULL, 11, CAST(N'2025-05-29T13:55:08.0233333' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_Department] ([Id], [Code], [Name], [SectionId], [HospitalId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (6, N'00006', N'Oncology', NULL, 11, CAST(N'2025-05-29T13:55:08.0266667' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_Department] ([Id], [Code], [Name], [SectionId], [HospitalId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (7, N'00007', N'Orthopedics', NULL, 11, CAST(N'2025-05-29T13:55:08.0266667' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_Department] ([Id], [Code], [Name], [SectionId], [HospitalId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (8, N'00008', N'Radiology', NULL, 11, CAST(N'2025-05-29T13:55:08.0300000' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_Department] ([Id], [Code], [Name], [SectionId], [HospitalId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (9, N'00009', N'Pathology', NULL, 11, CAST(N'2025-05-29T13:55:08.0300000' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_Department] ([Id], [Code], [Name], [SectionId], [HospitalId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (10, N'00010', N'General Surgery', NULL, 11, CAST(N'2025-05-29T13:55:08.0333333' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_Department] ([Id], [Code], [Name], [SectionId], [HospitalId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (11, N'00011', N'Urology', NULL, 11, CAST(N'2025-05-29T13:55:08.0333333' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_Department] ([Id], [Code], [Name], [SectionId], [HospitalId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (12, N'00012', N'Dermatology', NULL, 11, CAST(N'2025-05-29T13:55:08.0366667' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_Department] ([Id], [Code], [Name], [SectionId], [HospitalId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (13, N'00013', N'Gastroenterology', NULL, 11, CAST(N'2025-05-29T13:55:08.0400000' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_Department] ([Id], [Code], [Name], [SectionId], [HospitalId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (14, N'00014', N'Nephrology', NULL, 11, CAST(N'2025-05-29T13:55:08.0400000' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_Department] ([Id], [Code], [Name], [SectionId], [HospitalId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (15, N'00015', N'Pulmonology', NULL, 11, CAST(N'2025-05-29T13:55:08.0433333' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_Department] ([Id], [Code], [Name], [SectionId], [HospitalId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (16, N'00016', N'Psychiatry', NULL, 11, CAST(N'2025-05-29T13:55:08.0433333' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_Department] ([Id], [Code], [Name], [SectionId], [HospitalId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (17, N'00017', N'Endocrinology', NULL, 11, CAST(N'2025-05-29T13:55:08.0433333' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_Department] ([Id], [Code], [Name], [SectionId], [HospitalId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (18, N'00018', N'Rheumatology', NULL, 11, CAST(N'2025-05-29T13:55:08.0466667' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_Department] ([Id], [Code], [Name], [SectionId], [HospitalId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (19, N'00019', N'Anesthesiology', NULL, 11, CAST(N'2025-05-29T13:55:08.0466667' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_Department] ([Id], [Code], [Name], [SectionId], [HospitalId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (20, N'00020', N'Intensive Care Unit (ICU)', NULL, 11, CAST(N'2025-05-29T13:55:08.0466667' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_Department] ([Id], [Code], [Name], [SectionId], [HospitalId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (21, N'00021', N'Infectious Diseases', NULL, 11, CAST(N'2025-05-29T13:55:08.0500000' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_Department] ([Id], [Code], [Name], [SectionId], [HospitalId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (22, N'00022', N'Ophthalmology', NULL, 11, CAST(N'2025-05-29T13:55:08.0500000' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_Department] ([Id], [Code], [Name], [SectionId], [HospitalId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (23, N'00023', N'ENT (Otorhinolaryngology)', NULL, 11, CAST(N'2025-05-29T13:55:08.0500000' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_Department] ([Id], [Code], [Name], [SectionId], [HospitalId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (24, N'00024', N'Hematology', NULL, 11, CAST(N'2025-05-29T13:55:08.0500000' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_Department] ([Id], [Code], [Name], [SectionId], [HospitalId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (25, N'00025', N'Physical Medicine and Rehab', NULL, 11, CAST(N'2025-05-29T13:55:08.0533333' AS DateTime2), 2, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Configuration_Department] OFF
GO
SET IDENTITY_INSERT [dbo].[Configuration_Designation] ON 
GO
INSERT [dbo].[Configuration_Designation] ([Id], [Code], [Name], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (1, N'00001', N'Associate Professor', CAST(N'2025-05-29T14:56:36.8300000' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_Designation] ([Id], [Code], [Name], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (2, N'00002', N'Medicine Specialist', CAST(N'2025-05-29T14:56:36.8366667' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_Designation] ([Id], [Code], [Name], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (3, N'00003', N'Consultant', CAST(N'2025-05-29T14:56:36.8433333' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_Designation] ([Id], [Code], [Name], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (4, N'00004', N'Assistant Professor', CAST(N'2025-05-29T14:56:36.8433333' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_Designation] ([Id], [Code], [Name], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (5, N'00005', N'Professor', CAST(N'2025-05-29T14:56:36.8466667' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_Designation] ([Id], [Code], [Name], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (6, N'00006', N'Head of the department', CAST(N'2025-05-29T14:56:36.8466667' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_Designation] ([Id], [Code], [Name], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (7, N'00007', N'Chief', CAST(N'2025-05-29T14:56:36.8466667' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_Designation] ([Id], [Code], [Name], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (8, N'00001', N'Medical Officer', CAST(N'2025-05-29T14:56:36.8500000' AS DateTime2), 2, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Configuration_Designation] OFF
GO
SET IDENTITY_INSERT [dbo].[Configuration_DiagnosisCenterWiseTest] ON 
GO
INSERT [dbo].[Configuration_DiagnosisCenterWiseTest] ([Id], [TestCenterId], [TestId], [DiagnosticCenterGivenTestName], [DiagnosticCenterGivenPrice], [DiscountByAuthority], [Schedule], [ReportDeliveryTime], [SpecialNote], [Remarks], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PriceUnitId], [TestCenterBranchId]) VALUES (3, 17, 1, N'Complete Blood Count', CAST(500.00 AS Decimal(10, 2)), CAST(5.00 AS Decimal(10, 2)), N'10AM', NULL, NULL, NULL, CAST(N'2025-06-03T00:00:00.0000000' AS DateTime2), 2, NULL, NULL, 17, 15)
GO
INSERT [dbo].[Configuration_DiagnosisCenterWiseTest] ([Id], [TestCenterId], [TestId], [DiagnosticCenterGivenTestName], [DiagnosticCenterGivenPrice], [DiscountByAuthority], [Schedule], [ReportDeliveryTime], [SpecialNote], [Remarks], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PriceUnitId], [TestCenterBranchId]) VALUES (4, 17, 10, N'TC, DC, Hb, ESR,Combined', CAST(1000.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), 2, NULL, NULL, 17, 15)
GO
INSERT [dbo].[Configuration_DiagnosisCenterWiseTest] ([Id], [TestCenterId], [TestId], [DiagnosticCenterGivenTestName], [DiagnosticCenterGivenPrice], [DiscountByAuthority], [Schedule], [ReportDeliveryTime], [SpecialNote], [Remarks], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PriceUnitId], [TestCenterBranchId]) VALUES (5, 17, 11, N'ESR', CAST(800.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), 2, NULL, NULL, 17, 15)
GO
INSERT [dbo].[Configuration_DiagnosisCenterWiseTest] ([Id], [TestCenterId], [TestId], [DiagnosticCenterGivenTestName], [DiagnosticCenterGivenPrice], [DiscountByAuthority], [Schedule], [ReportDeliveryTime], [SpecialNote], [Remarks], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PriceUnitId], [TestCenterBranchId]) VALUES (6, 17, 12, N'Haemoglobin', CAST(200.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), 2, NULL, NULL, 17, 15)
GO
INSERT [dbo].[Configuration_DiagnosisCenterWiseTest] ([Id], [TestCenterId], [TestId], [DiagnosticCenterGivenTestName], [DiagnosticCenterGivenPrice], [DiscountByAuthority], [Schedule], [ReportDeliveryTime], [SpecialNote], [Remarks], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PriceUnitId], [TestCenterBranchId]) VALUES (8, 11, 1, N'CBC', CAST(300.00 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), 2, NULL, NULL, 17, NULL)
GO
INSERT [dbo].[Configuration_DiagnosisCenterWiseTest] ([Id], [TestCenterId], [TestId], [DiagnosticCenterGivenTestName], [DiagnosticCenterGivenPrice], [DiscountByAuthority], [Schedule], [ReportDeliveryTime], [SpecialNote], [Remarks], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PriceUnitId], [TestCenterBranchId]) VALUES (10, 11, 10, N'TC, DC, Hb, ESR, Combined', CAST(600.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), 2, NULL, NULL, 17, NULL)
GO
INSERT [dbo].[Configuration_DiagnosisCenterWiseTest] ([Id], [TestCenterId], [TestId], [DiagnosticCenterGivenTestName], [DiagnosticCenterGivenPrice], [DiscountByAuthority], [Schedule], [ReportDeliveryTime], [SpecialNote], [Remarks], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PriceUnitId], [TestCenterBranchId]) VALUES (11, 11, 11, N'ESR', CAST(500.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), 2, NULL, NULL, 17, NULL)
GO
INSERT [dbo].[Configuration_DiagnosisCenterWiseTest] ([Id], [TestCenterId], [TestId], [DiagnosticCenterGivenTestName], [DiagnosticCenterGivenPrice], [DiscountByAuthority], [Schedule], [ReportDeliveryTime], [SpecialNote], [Remarks], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PriceUnitId], [TestCenterBranchId]) VALUES (12, 11, 12, N'Haemoglobin', CAST(200.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), 2, NULL, NULL, 17, NULL)
GO
INSERT [dbo].[Configuration_DiagnosisCenterWiseTest] ([Id], [TestCenterId], [TestId], [DiagnosticCenterGivenTestName], [DiagnosticCenterGivenPrice], [DiscountByAuthority], [Schedule], [ReportDeliveryTime], [SpecialNote], [Remarks], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PriceUnitId], [TestCenterBranchId]) VALUES (13, 46, 1, N'Complete Blood Count', CAST(800.00 AS Decimal(10, 2)), CAST(5.00 AS Decimal(10, 2)), N'10AM', NULL, NULL, NULL, CAST(N'2025-06-03T00:00:00.0000000' AS DateTime2), 2, NULL, NULL, 17, NULL)
GO
INSERT [dbo].[Configuration_DiagnosisCenterWiseTest] ([Id], [TestCenterId], [TestId], [DiagnosticCenterGivenTestName], [DiagnosticCenterGivenPrice], [DiscountByAuthority], [Schedule], [ReportDeliveryTime], [SpecialNote], [Remarks], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PriceUnitId], [TestCenterBranchId]) VALUES (14, 46, 10, N'TC, DC, Hb, ESR,Combined', CAST(1200.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), 2, NULL, NULL, 17, NULL)
GO
INSERT [dbo].[Configuration_DiagnosisCenterWiseTest] ([Id], [TestCenterId], [TestId], [DiagnosticCenterGivenTestName], [DiagnosticCenterGivenPrice], [DiscountByAuthority], [Schedule], [ReportDeliveryTime], [SpecialNote], [Remarks], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PriceUnitId], [TestCenterBranchId]) VALUES (15, 46, 11, N'ESR', CAST(700.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), 2, NULL, NULL, 17, NULL)
GO
INSERT [dbo].[Configuration_DiagnosisCenterWiseTest] ([Id], [TestCenterId], [TestId], [DiagnosticCenterGivenTestName], [DiagnosticCenterGivenPrice], [DiscountByAuthority], [Schedule], [ReportDeliveryTime], [SpecialNote], [Remarks], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PriceUnitId], [TestCenterBranchId]) VALUES (16, 46, 12, N'Haemoglobin', CAST(400.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), 2, NULL, NULL, 17, NULL)
GO
INSERT [dbo].[Configuration_DiagnosisCenterWiseTest] ([Id], [TestCenterId], [TestId], [DiagnosticCenterGivenTestName], [DiagnosticCenterGivenPrice], [DiscountByAuthority], [Schedule], [ReportDeliveryTime], [SpecialNote], [Remarks], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PriceUnitId], [TestCenterBranchId]) VALUES (17, 50, 1, N'Complete Blood Count', CAST(800.00 AS Decimal(10, 2)), CAST(5.00 AS Decimal(10, 2)), N'10AM', NULL, NULL, NULL, CAST(N'2025-06-03T00:00:00.0000000' AS DateTime2), 2, NULL, NULL, 17, 23)
GO
INSERT [dbo].[Configuration_DiagnosisCenterWiseTest] ([Id], [TestCenterId], [TestId], [DiagnosticCenterGivenTestName], [DiagnosticCenterGivenPrice], [DiscountByAuthority], [Schedule], [ReportDeliveryTime], [SpecialNote], [Remarks], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PriceUnitId], [TestCenterBranchId]) VALUES (18, 50, 10, N'TC, DC, Hb, ESR,Combined', CAST(1200.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), 2, NULL, NULL, 17, 23)
GO
INSERT [dbo].[Configuration_DiagnosisCenterWiseTest] ([Id], [TestCenterId], [TestId], [DiagnosticCenterGivenTestName], [DiagnosticCenterGivenPrice], [DiscountByAuthority], [Schedule], [ReportDeliveryTime], [SpecialNote], [Remarks], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PriceUnitId], [TestCenterBranchId]) VALUES (19, 50, 11, N'ESR', CAST(700.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), 2, NULL, NULL, 17, 23)
GO
INSERT [dbo].[Configuration_DiagnosisCenterWiseTest] ([Id], [TestCenterId], [TestId], [DiagnosticCenterGivenTestName], [DiagnosticCenterGivenPrice], [DiscountByAuthority], [Schedule], [ReportDeliveryTime], [SpecialNote], [Remarks], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PriceUnitId], [TestCenterBranchId]) VALUES (20, 50, 12, N'Haemoglobin', CAST(400.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), 2, NULL, NULL, 17, 23)
GO
INSERT [dbo].[Configuration_DiagnosisCenterWiseTest] ([Id], [TestCenterId], [TestId], [DiagnosticCenterGivenTestName], [DiagnosticCenterGivenPrice], [DiscountByAuthority], [Schedule], [ReportDeliveryTime], [SpecialNote], [Remarks], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PriceUnitId], [TestCenterBranchId]) VALUES (21, 50, 13, N'Urine Routine Examination', CAST(1100.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), 2, NULL, NULL, 17, NULL)
GO
INSERT [dbo].[Configuration_DiagnosisCenterWiseTest] ([Id], [TestCenterId], [TestId], [DiagnosticCenterGivenTestName], [DiagnosticCenterGivenPrice], [DiscountByAuthority], [Schedule], [ReportDeliveryTime], [SpecialNote], [Remarks], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PriceUnitId], [TestCenterBranchId]) VALUES (22, 50, 14, N'Urine Culture', CAST(460.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), 2, NULL, NULL, 17, NULL)
GO
SET IDENTITY_INSERT [dbo].[Configuration_DiagnosisCenterWiseTest] OFF
GO
SET IDENTITY_INSERT [dbo].[Configuration_District] ON 
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (1, N'43', N'Dinajpur', 1, CAST(N'2025-06-11T23:34:01.2934104' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (2, N'44', N'Gaibandha', 1, CAST(N'2025-06-11T23:34:01.2934184' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (3, N'45', N'Kurigram', 1, CAST(N'2025-06-11T23:34:01.2934187' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (4, N'46', N'Lalmonirhat', 1, CAST(N'2025-06-11T23:34:01.2934189' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (5, N'47', N'Nilphamari', 1, CAST(N'2025-06-11T23:34:01.2934190' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (6, N'48', N'Panchagarh', 1, CAST(N'2025-06-11T23:34:01.2934207' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (7, N'49', N'Rangpur', 1, CAST(N'2025-06-11T23:34:01.2934209' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (8, N'50', N'Thakurgaon', 1, CAST(N'2025-06-11T23:34:01.2934211' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (9, N'35', N'Bogra', 2, CAST(N'2025-06-11T23:34:01.2934213' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (10, N'36', N'Joypurhat', 2, CAST(N'2025-06-11T23:34:01.2934216' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (11, N'37', N'Naogaon', 2, CAST(N'2025-06-11T23:34:01.2934218' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (12, N'38', N'Natore', 2, CAST(N'2025-06-11T23:34:01.2934220' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (13, N'39', N'Chapainawabganj', 2, CAST(N'2025-06-11T23:34:01.2934222' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (14, N'40', N'Pabna', 2, CAST(N'2025-06-11T23:34:01.2934237' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (15, N'41', N'Rajshahi', 2, CAST(N'2025-06-11T23:34:01.2934238' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (16, N'42', N'Sirajganj', 2, CAST(N'2025-06-11T23:34:01.2934264' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (17, N'25', N'Bagerhat', 3, CAST(N'2025-06-11T23:34:01.2934266' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (18, N'26', N'Chuadanga', 3, CAST(N'2025-06-11T23:34:01.2934269' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (19, N'27', N'Jashore', 3, CAST(N'2025-06-11T23:34:01.2934271' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (20, N'28', N'Jhenaidah', 3, CAST(N'2025-06-11T23:34:01.2934273' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (21, N'29', N'Khulna', 3, CAST(N'2025-06-11T23:34:01.2934275' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (22, N'30', N'Kushtia', 3, CAST(N'2025-06-11T23:34:01.2934277' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (23, N'31', N'Magura', 3, CAST(N'2025-06-11T23:34:01.2934278' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (24, N'32', N'Meherpur', 3, CAST(N'2025-06-11T23:34:01.2934284' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (25, N'33', N'Narail', 3, CAST(N'2025-06-11T23:34:01.2934285' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (26, N'34', N'Satkhira', 3, CAST(N'2025-06-11T23:34:01.2934287' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (27, N'55', N'Barguna', 4, CAST(N'2025-06-11T23:34:01.2934302' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (28, N'56', N'Barishal', 4, CAST(N'2025-06-11T23:34:01.2934304' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (29, N'57', N'Bhola', 4, CAST(N'2025-06-11T23:34:01.2934306' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (30, N'58', N'Jhalokati', 4, CAST(N'2025-06-11T23:34:01.2934307' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (31, N'59', N'Patuakhali', 4, CAST(N'2025-06-11T23:34:01.2934309' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (32, N'60', N'Pirojpur', 4, CAST(N'2025-06-11T23:34:01.2934311' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (33, N'61', N'Jamalpur', 5, CAST(N'2025-06-11T23:34:01.2934313' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (34, N'62', N'Mymensingh', 5, CAST(N'2025-06-11T23:34:01.2934317' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (35, N'63', N'Netrokona', 5, CAST(N'2025-06-11T23:34:01.2934319' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (36, N'64', N'Sherpur', 5, CAST(N'2025-06-11T23:34:01.2934321' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (37, N'01', N'Dhaka', 6, CAST(N'2025-06-11T23:34:01.2934323' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (38, N'02', N'Faridpur', 6, CAST(N'2025-06-11T23:34:01.2934325' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (39, N'03', N'Gazipur', 6, CAST(N'2025-06-11T23:34:01.2934341' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (40, N'04', N'Gopalganj', 6, CAST(N'2025-06-11T23:34:01.2934343' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (41, N'05', N'Kishoreganj', 6, CAST(N'2025-06-11T23:34:01.2934345' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (42, N'06', N'Madaripur', 6, CAST(N'2025-06-11T23:34:01.2934347' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (43, N'07', N'Manikganj', 6, CAST(N'2025-06-11T23:34:01.2934349' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (44, N'08', N'Munshiganj', 6, CAST(N'2025-06-11T23:34:01.2934351' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (45, N'09', N'Narayanganj', 6, CAST(N'2025-06-11T23:34:01.2934353' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (46, N'10', N'Narsingdi', 6, CAST(N'2025-06-11T23:34:01.2934355' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (47, N'11', N'Rajbari', 6, CAST(N'2025-06-11T23:34:01.2934356' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (48, N'12', N'Shariatpur', 6, CAST(N'2025-06-11T23:34:01.2934358' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (49, N'13', N'Tangail', 6, CAST(N'2025-06-11T23:34:01.2934360' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (50, N'51', N'Habiganj', 7, CAST(N'2025-06-11T23:34:01.2934362' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (51, N'52', N'Moulvibazar', 7, CAST(N'2025-06-11T23:34:01.2934364' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (52, N'53', N'Sunamganj', 7, CAST(N'2025-06-11T23:34:01.2934379' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (53, N'54', N'Sylhet', 7, CAST(N'2025-06-11T23:34:01.2934381' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (54, N'14', N'Bandarban', 8, CAST(N'2025-06-11T23:34:01.2934383' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (55, N'15', N'Brahmanbaria', 8, CAST(N'2025-06-11T23:34:01.2934384' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (56, N'16', N'Chandpur', 8, CAST(N'2025-06-11T23:34:01.2934386' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (57, N'17', N'Chattogram', 8, CAST(N'2025-06-11T23:34:01.2934388' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (58, N'18', N'Cumilla', 8, CAST(N'2025-06-11T23:34:01.2934390' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (59, N'19', N'Cox''s Bazar', 8, CAST(N'2025-06-11T23:34:01.2934392' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (60, N'20', N'Feni', 8, CAST(N'2025-06-11T23:34:01.2934394' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (61, N'21', N'Khagrachhari', 8, CAST(N'2025-06-11T23:34:01.2934396' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (62, N'22', N'Lakshmipur', 8, CAST(N'2025-06-11T23:34:01.2934398' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (63, N'23', N'Noakhali', 8, CAST(N'2025-06-11T23:34:01.2934400' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_District] ([Id], [Code], [Name], [DivisionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (64, N'24', N'Rangamati', 8, CAST(N'2025-06-11T23:34:01.2934402' AS DateTime2), 2, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Configuration_District] OFF
GO
SET IDENTITY_INSERT [dbo].[Configuration_Doctor] ON 
GO
INSERT [dbo].[Configuration_Doctor] ([Id], [Title], [Code], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [BMDCRegNo], [ChamberIds], [Comments], [EducationDegreeIds], [Experiences], [FirstName], [LastName], [ProfessionalSummary], [Rating], [SpecializedArea], [YearOfExperiences], [ProfilePhotoName], [ProfilePhotoPath]) VALUES (1, N'Dr. Md. Samidur Rahman', N'0000000001', CAST(N'2025-05-29T15:57:04.1933333' AS DateTime2), 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', NULL, NULL, NULL, 0, NULL, NULL)
GO
INSERT [dbo].[Configuration_Doctor] ([Id], [Title], [Code], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [BMDCRegNo], [ChamberIds], [Comments], [EducationDegreeIds], [Experiences], [FirstName], [LastName], [ProfessionalSummary], [Rating], [SpecializedArea], [YearOfExperiences], [ProfilePhotoName], [ProfilePhotoPath]) VALUES (2, N'Dr. Zannatul Ferdous Peu', N'0000000002', CAST(N'2025-05-29T15:57:04.2000000' AS DateTime2), 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', NULL, NULL, NULL, 0, NULL, NULL)
GO
INSERT [dbo].[Configuration_Doctor] ([Id], [Title], [Code], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [BMDCRegNo], [ChamberIds], [Comments], [EducationDegreeIds], [Experiences], [FirstName], [LastName], [ProfessionalSummary], [Rating], [SpecializedArea], [YearOfExperiences], [ProfilePhotoName], [ProfilePhotoPath]) VALUES (3, N'Professor Dr.', N'0000000003', CAST(N'2025-05-29T15:57:04.2033333' AS DateTime2), 2, NULL, NULL, N'A12345', N'5,3', N'Test data', N'1,2,3,4', NULL, N'A H M', N'Abdul Hai', N'Dr. A. M. Shafique is a Cardiologist in Dhaka. His MD 
(Cardiology). He is employed with United cardiologist
specialist. He treats his patients at Un regular basis. For 
appointments or additional us at: 09611530530.', CAST(3.90 AS Decimal(18, 2)), N'Neuromedicine', 20, N'DT_0000000003.svg', N'photos\DT_0000000003.svg')
GO
INSERT [dbo].[Configuration_Doctor] ([Id], [Title], [Code], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [BMDCRegNo], [ChamberIds], [Comments], [EducationDegreeIds], [Experiences], [FirstName], [LastName], [ProfessionalSummary], [Rating], [SpecializedArea], [YearOfExperiences], [ProfilePhotoName], [ProfilePhotoPath]) VALUES (4, N'Lt. Col. Dr. Md. Abdullah Al Mamun', N'0000000004', CAST(N'2025-05-29T15:57:04.2033333' AS DateTime2), 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', NULL, NULL, NULL, 0, NULL, NULL)
GO
INSERT [dbo].[Configuration_Doctor] ([Id], [Title], [Code], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [BMDCRegNo], [ChamberIds], [Comments], [EducationDegreeIds], [Experiences], [FirstName], [LastName], [ProfessionalSummary], [Rating], [SpecializedArea], [YearOfExperiences], [ProfilePhotoName], [ProfilePhotoPath]) VALUES (5, N'Dr. Mohammed Astefchar Hussain', N'0000000005', CAST(N'2025-05-29T15:57:04.2066667' AS DateTime2), 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', NULL, NULL, NULL, 0, NULL, NULL)
GO
INSERT [dbo].[Configuration_Doctor] ([Id], [Title], [Code], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [BMDCRegNo], [ChamberIds], [Comments], [EducationDegreeIds], [Experiences], [FirstName], [LastName], [ProfessionalSummary], [Rating], [SpecializedArea], [YearOfExperiences], [ProfilePhotoName], [ProfilePhotoPath]) VALUES (6, N'Dr. Ahmad Abdullah Jami', N'0000000006', CAST(N'2025-05-29T15:57:04.2100000' AS DateTime2), 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', NULL, NULL, NULL, 0, NULL, NULL)
GO
INSERT [dbo].[Configuration_Doctor] ([Id], [Title], [Code], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [BMDCRegNo], [ChamberIds], [Comments], [EducationDegreeIds], [Experiences], [FirstName], [LastName], [ProfessionalSummary], [Rating], [SpecializedArea], [YearOfExperiences], [ProfilePhotoName], [ProfilePhotoPath]) VALUES (7, N'Dr. Md. Tangil Ahmed', N'0000000007', CAST(N'2025-05-29T15:57:04.2133333' AS DateTime2), 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', NULL, NULL, NULL, 0, NULL, NULL)
GO
INSERT [dbo].[Configuration_Doctor] ([Id], [Title], [Code], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [BMDCRegNo], [ChamberIds], [Comments], [EducationDegreeIds], [Experiences], [FirstName], [LastName], [ProfessionalSummary], [Rating], [SpecializedArea], [YearOfExperiences], [ProfilePhotoName], [ProfilePhotoPath]) VALUES (8, N'Prof. Dr. Col. Mohammad Abdul Quader', N'0000000008', CAST(N'2025-05-29T15:57:04.2133333' AS DateTime2), 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', NULL, NULL, NULL, 0, NULL, NULL)
GO
INSERT [dbo].[Configuration_Doctor] ([Id], [Title], [Code], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [BMDCRegNo], [ChamberIds], [Comments], [EducationDegreeIds], [Experiences], [FirstName], [LastName], [ProfessionalSummary], [Rating], [SpecializedArea], [YearOfExperiences], [ProfilePhotoName], [ProfilePhotoPath]) VALUES (9, N'Dr. Tanzila Halim', N'0000000009', CAST(N'2025-05-29T15:57:04.2166667' AS DateTime2), 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', NULL, NULL, NULL, 0, NULL, NULL)
GO
INSERT [dbo].[Configuration_Doctor] ([Id], [Title], [Code], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [BMDCRegNo], [ChamberIds], [Comments], [EducationDegreeIds], [Experiences], [FirstName], [LastName], [ProfessionalSummary], [Rating], [SpecializedArea], [YearOfExperiences], [ProfilePhotoName], [ProfilePhotoPath]) VALUES (10, N'Dr. S.M. Zakir Khaled', N'0000000010', CAST(N'2025-05-29T15:57:04.2166667' AS DateTime2), 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', NULL, NULL, NULL, 0, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Configuration_Doctor] OFF
GO
SET IDENTITY_INSERT [dbo].[Configuration_DoctorChamber] ON 
GO
INSERT [dbo].[Configuration_DoctorChamber] ([Id], [DoctorId], [HospitalId], [DepartmentSectionId], [DepartmentId], [CityId], [DoctorDesignationInChamberId], [VisitingHour], [Remarks], [DoctorSpecialization], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [IsMainChamber], [IsActive], [ChamberAddress], [ChamberCityId], [ChamberClosedOnDay], [ChamberDescription], [ChamberEmail], [ChamberEndTime], [ChamberGoogleAddress], [ChamberGoogleLocationLink], [ChamberGoogleRating], [ChamberName], [ChamberOtherDoctorsId], [ChamberOverseasCaller], [ChamberPostalCode], [ChamberStartTime], [ChamberType], [ChamberVisitingHours], [ChamberWhatsAppNumber], [DoctorBookingMobileNos], [Helpline_CallCenter], [DoctorVisitingDaysInChamber]) VALUES (1, 1, 2, NULL, 2, 2, 3, N'10AM-4PM', N'Dhaka', N'Cardiothoracic Surgeon(Heart Bypass, Valve Replacement, Ventricular Septal Defect, Varicose Vein)', CAST(N'2025-05-29T16:43:47.2400000' AS DateTime2), 2, NULL, NULL, 0, 0, N'House 48 Rd No 9A, Dhaka 1209', 0, NULL, N'', NULL, NULL, N'', N'', NULL, N'', NULL, NULL, N'', NULL, N'', NULL, NULL, N'+8801765439876', NULL, N'Saturday,Sunday,Monday,Tuesday,Wednesday,Thursday')
GO
INSERT [dbo].[Configuration_DoctorChamber] ([Id], [DoctorId], [HospitalId], [DepartmentSectionId], [DepartmentId], [CityId], [DoctorDesignationInChamberId], [VisitingHour], [Remarks], [DoctorSpecialization], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [IsMainChamber], [IsActive], [ChamberAddress], [ChamberCityId], [ChamberClosedOnDay], [ChamberDescription], [ChamberEmail], [ChamberEndTime], [ChamberGoogleAddress], [ChamberGoogleLocationLink], [ChamberGoogleRating], [ChamberName], [ChamberOtherDoctorsId], [ChamberOverseasCaller], [ChamberPostalCode], [ChamberStartTime], [ChamberType], [ChamberVisitingHours], [ChamberWhatsAppNumber], [DoctorBookingMobileNos], [Helpline_CallCenter], [DoctorVisitingDaysInChamber]) VALUES (2, 2, 3, NULL, 3, 4, 3, N'10AM-4PM', N'Dhaka', N'Cardiothoracic Surgeon(Heart Bypass, Valve Replacement, Ventricular Septal Defect, Varicose Vein)', CAST(N'2025-05-29T16:43:47.2533333' AS DateTime2), 2, NULL, NULL, 0, 1, N'House 48 Rd No 9A, Dhaka 1209', 0, NULL, N'', NULL, NULL, N'', N'', NULL, N'', NULL, NULL, N'', NULL, N'', NULL, NULL, N'+8801765439876', NULL, N'Saturday,Sunday,Monday,Tuesday,Wednesday,Thursday')
GO
INSERT [dbo].[Configuration_DoctorChamber] ([Id], [DoctorId], [HospitalId], [DepartmentSectionId], [DepartmentId], [CityId], [DoctorDesignationInChamberId], [VisitingHour], [Remarks], [DoctorSpecialization], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [IsMainChamber], [IsActive], [ChamberAddress], [ChamberCityId], [ChamberClosedOnDay], [ChamberDescription], [ChamberEmail], [ChamberEndTime], [ChamberGoogleAddress], [ChamberGoogleLocationLink], [ChamberGoogleRating], [ChamberName], [ChamberOtherDoctorsId], [ChamberOverseasCaller], [ChamberPostalCode], [ChamberStartTime], [ChamberType], [ChamberVisitingHours], [ChamberWhatsAppNumber], [DoctorBookingMobileNos], [Helpline_CallCenter], [DoctorVisitingDaysInChamber]) VALUES (3, 3, 11, NULL, 3, 4, 3, N'10AM-4PM', N'Dhaka', N'Cardiologist, Cardiac Surgeon', CAST(N'2025-05-29T16:43:47.2533333' AS DateTime2), 2, NULL, NULL, 1, 1, N'House 48 Rd No 9A, Dhaka 1209', 0, NULL, N'', NULL, NULL, N'', N'', NULL, N'', NULL, NULL, N'', NULL, N'', NULL, NULL, N'+8801765439876', NULL, N'Saturday,Sunday,Monday,Tuesday,Wednesday,Thursday')
GO
INSERT [dbo].[Configuration_DoctorChamber] ([Id], [DoctorId], [HospitalId], [DepartmentSectionId], [DepartmentId], [CityId], [DoctorDesignationInChamberId], [VisitingHour], [Remarks], [DoctorSpecialization], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [IsMainChamber], [IsActive], [ChamberAddress], [ChamberCityId], [ChamberClosedOnDay], [ChamberDescription], [ChamberEmail], [ChamberEndTime], [ChamberGoogleAddress], [ChamberGoogleLocationLink], [ChamberGoogleRating], [ChamberName], [ChamberOtherDoctorsId], [ChamberOverseasCaller], [ChamberPostalCode], [ChamberStartTime], [ChamberType], [ChamberVisitingHours], [ChamberWhatsAppNumber], [DoctorBookingMobileNos], [Helpline_CallCenter], [DoctorVisitingDaysInChamber]) VALUES (4, 1, 2, NULL, 2, 5, 3, N'10AM-4PM', N'Dhaka', N'Cardiothoracic Surgeon(Heart Bypass, Valve Replacement, Ventricular Septal Defect, Varicose Vein)', CAST(N'2025-05-29T16:43:47.2400000' AS DateTime2), 2, NULL, NULL, 0, 1, N'House 48 Rd No 9A, Dhaka 1209', 0, NULL, N'', NULL, NULL, N'', N'', NULL, N'', NULL, NULL, N'', NULL, N'', NULL, NULL, N'+8801765439876', NULL, N'Saturday,Sunday,Monday,Tuesday,Wednesday,Thursday')
GO
INSERT [dbo].[Configuration_DoctorChamber] ([Id], [DoctorId], [HospitalId], [DepartmentSectionId], [DepartmentId], [CityId], [DoctorDesignationInChamberId], [VisitingHour], [Remarks], [DoctorSpecialization], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [IsMainChamber], [IsActive], [ChamberAddress], [ChamberCityId], [ChamberClosedOnDay], [ChamberDescription], [ChamberEmail], [ChamberEndTime], [ChamberGoogleAddress], [ChamberGoogleLocationLink], [ChamberGoogleRating], [ChamberName], [ChamberOtherDoctorsId], [ChamberOverseasCaller], [ChamberPostalCode], [ChamberStartTime], [ChamberType], [ChamberVisitingHours], [ChamberWhatsAppNumber], [DoctorBookingMobileNos], [Helpline_CallCenter], [DoctorVisitingDaysInChamber]) VALUES (5, 2, 3, NULL, 3, 4, 3, N'10AM-4PM', N'Dhaka', N'Cardiothoracic Surgeon(Heart Bypass, Valve Replacement, Ventricular Septal Defect, Varicose Vein)', CAST(N'2025-05-29T16:43:47.2533333' AS DateTime2), 2, NULL, NULL, 0, 1, N'House 48 Rd No 9A, Dhaka 1209', 0, NULL, N'', NULL, NULL, N'', N'', NULL, N'', NULL, NULL, N'', NULL, N'', NULL, NULL, N'+8801765439876', NULL, N'Saturday,Sunday,Monday,Tuesday,Wednesday,Thursday')
GO
INSERT [dbo].[Configuration_DoctorChamber] ([Id], [DoctorId], [HospitalId], [DepartmentSectionId], [DepartmentId], [CityId], [DoctorDesignationInChamberId], [VisitingHour], [Remarks], [DoctorSpecialization], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [IsMainChamber], [IsActive], [ChamberAddress], [ChamberCityId], [ChamberClosedOnDay], [ChamberDescription], [ChamberEmail], [ChamberEndTime], [ChamberGoogleAddress], [ChamberGoogleLocationLink], [ChamberGoogleRating], [ChamberName], [ChamberOtherDoctorsId], [ChamberOverseasCaller], [ChamberPostalCode], [ChamberStartTime], [ChamberType], [ChamberVisitingHours], [ChamberWhatsAppNumber], [DoctorBookingMobileNos], [Helpline_CallCenter], [DoctorVisitingDaysInChamber]) VALUES (6, 3, 48, NULL, 3, 4, 3, N'10AM-4PM', N'Dhaka', N'Cardiothoracic Surgeon(Heart Bypass, Valve Replacement, Ventricular Septal Defect, Varicose Vein)', CAST(N'2025-05-29T16:43:47.2533333' AS DateTime2), 2, NULL, NULL, 0, 1, N'House 48 Rd No 9A, Dhaka 1209', 0, NULL, N'', NULL, NULL, N'', N'', NULL, N'', NULL, NULL, N'', NULL, N'', NULL, NULL, N'+8801765439876', NULL, N'Saturday,Sunday,Monday,Tuesday,Wednesday,Thursday')
GO
SET IDENTITY_INSERT [dbo].[Configuration_DoctorChamber] OFF
GO
SET IDENTITY_INSERT [dbo].[Configuration_Education] ON 
GO
INSERT [dbo].[Configuration_Education] ([Id], [Code], [DegreeName], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [InstitutionName]) VALUES (1, N'00001', N'MBBS', N'Bachelor of Medicine and Bachelor of Surgery (MBBS)', CAST(N'2025-08-03T00:00:00.0000000' AS DateTime2), 2, NULL, NULL, N'Dhaka Medical College')
GO
INSERT [dbo].[Configuration_Education] ([Id], [Code], [DegreeName], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [InstitutionName]) VALUES (2, N'00002', N'MD', N'Doctor of Medicine', CAST(N'2025-08-03T00:00:00.0000000' AS DateTime2), 2, NULL, NULL, N'Dhaka Medical College')
GO
INSERT [dbo].[Configuration_Education] ([Id], [Code], [DegreeName], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [InstitutionName]) VALUES (3, N'00003', N'MS', N'Master of Surgery', CAST(N'2025-08-03T00:00:00.0000000' AS DateTime2), 2, NULL, NULL, N'University of Cambridge')
GO
INSERT [dbo].[Configuration_Education] ([Id], [Code], [DegreeName], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [InstitutionName]) VALUES (4, N'00004', N'PhD', N'Doctor of Philosophy', CAST(N'2025-08-03T00:00:00.0000000' AS DateTime2), 2, NULL, NULL, N'University of Oxford')
GO
SET IDENTITY_INSERT [dbo].[Configuration_Education] OFF
GO
SET IDENTITY_INSERT [dbo].[Configuration_Hospital] ON 
GO
INSERT [dbo].[Configuration_Hospital] ([Id], [Code], [Name], [Address], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CityId], [CloseDay], [CloseTime], [Description], [Fax], [GoogleLocation], [GoogleRating], [Mobile], [OpenDay], [OpenTime], [Phone], [Weekend], [IsActive], [Remarks], [WebAddress], [YearEstablished], [DiagnosticCenterIcon], [Email], [Location], [Branch], [IsMainBranch]) VALUES (1, N'00001', N'Shahid Suhrawardy Hospital', N'Ser-e-Banglanagar, Collegegate', CAST(N'2025-05-29T13:31:35.2800000' AS DateTime2), 2, NULL, NULL, NULL, NULL, NULL, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, N'', NULL, NULL, N'', 1)
GO
INSERT [dbo].[Configuration_Hospital] ([Id], [Code], [Name], [Address], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CityId], [CloseDay], [CloseTime], [Description], [Fax], [GoogleLocation], [GoogleRating], [Mobile], [OpenDay], [OpenTime], [Phone], [Weekend], [IsActive], [Remarks], [WebAddress], [YearEstablished], [DiagnosticCenterIcon], [Email], [Location], [Branch], [IsMainBranch]) VALUES (2, N'00002', N'Ad-Din Hospital', N'Moghbazar, Dhaka', CAST(N'2025-05-29T13:31:35.2900000' AS DateTime2), 2, NULL, NULL, NULL, NULL, NULL, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, N'', NULL, NULL, N'', 0)
GO
INSERT [dbo].[Configuration_Hospital] ([Id], [Code], [Name], [Address], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CityId], [CloseDay], [CloseTime], [Description], [Fax], [GoogleLocation], [GoogleRating], [Mobile], [OpenDay], [OpenTime], [Phone], [Weekend], [IsActive], [Remarks], [WebAddress], [YearEstablished], [DiagnosticCenterIcon], [Email], [Location], [Branch], [IsMainBranch]) VALUES (3, N'00003', N'Ahmed Medical Centre Ltd', N'House # 71, Road # 15-A, (New), Dhanmondi C/A', CAST(N'2025-05-29T13:31:35.2900000' AS DateTime2), 2, NULL, NULL, NULL, NULL, NULL, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, N'', NULL, NULL, N'', 0)
GO
INSERT [dbo].[Configuration_Hospital] ([Id], [Code], [Name], [Address], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CityId], [CloseDay], [CloseTime], [Description], [Fax], [GoogleLocation], [GoogleRating], [Mobile], [OpenDay], [OpenTime], [Phone], [Weekend], [IsActive], [Remarks], [WebAddress], [YearEstablished], [DiagnosticCenterIcon], [Email], [Location], [Branch], [IsMainBranch]) VALUES (4, N'00004', N'Aichi Hospital', N'House # 13, Eshakha Avenue Sector # 6, utttara Dhaka', CAST(N'2025-05-29T13:31:35.2933333' AS DateTime2), 2, NULL, NULL, NULL, NULL, NULL, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, N'', NULL, NULL, N'', 0)
GO
INSERT [dbo].[Configuration_Hospital] ([Id], [Code], [Name], [Address], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CityId], [CloseDay], [CloseTime], [Description], [Fax], [GoogleLocation], [GoogleRating], [Mobile], [OpenDay], [OpenTime], [Phone], [Weekend], [IsActive], [Remarks], [WebAddress], [YearEstablished], [DiagnosticCenterIcon], [Email], [Location], [Branch], [IsMainBranch]) VALUES (5, N'00005', N'Al Anaiet Adhunik Hospital', N'House # 36, Road # 3, Dhanmondi', CAST(N'2025-05-29T13:31:35.2933333' AS DateTime2), 2, NULL, NULL, NULL, NULL, NULL, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, N'', NULL, NULL, N'', 0)
GO
INSERT [dbo].[Configuration_Hospital] ([Id], [Code], [Name], [Address], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CityId], [CloseDay], [CloseTime], [Description], [Fax], [GoogleLocation], [GoogleRating], [Mobile], [OpenDay], [OpenTime], [Phone], [Weekend], [IsActive], [Remarks], [WebAddress], [YearEstablished], [DiagnosticCenterIcon], [Email], [Location], [Branch], [IsMainBranch]) VALUES (6, N'00006', N'Al- Helal Speacialist Hospital', N'150,Rokeya Sarani Senpara ParbataMirpur-10, Dhaka', CAST(N'2025-05-29T13:31:35.2933333' AS DateTime2), 2, NULL, NULL, NULL, NULL, NULL, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, N'', NULL, NULL, N'', 0)
GO
INSERT [dbo].[Configuration_Hospital] ([Id], [Code], [Name], [Address], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CityId], [CloseDay], [CloseTime], [Description], [Fax], [GoogleLocation], [GoogleRating], [Mobile], [OpenDay], [OpenTime], [Phone], [Weekend], [IsActive], [Remarks], [WebAddress], [YearEstablished], [DiagnosticCenterIcon], [Email], [Location], [Branch], [IsMainBranch]) VALUES (7, N'00007', N'Al Jebel-E-Nur Heart Ltd', N'House # 21, Road # 9/A (New),Dhanmondi', CAST(N'2025-05-29T13:31:35.2966667' AS DateTime2), 2, NULL, NULL, NULL, NULL, NULL, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, N'', NULL, NULL, N'', 0)
GO
INSERT [dbo].[Configuration_Hospital] ([Id], [Code], [Name], [Address], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CityId], [CloseDay], [CloseTime], [Description], [Fax], [GoogleLocation], [GoogleRating], [Mobile], [OpenDay], [OpenTime], [Phone], [Weekend], [IsActive], [Remarks], [WebAddress], [YearEstablished], [DiagnosticCenterIcon], [Email], [Location], [Branch], [IsMainBranch]) VALUES (8, N'00008', N'Al- Rajhi Hospital', N'12, Farmgate-1215, Dhaka', CAST(N'2025-05-29T13:31:35.2966667' AS DateTime2), 2, NULL, NULL, NULL, NULL, NULL, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, N'', NULL, NULL, N'', 0)
GO
INSERT [dbo].[Configuration_Hospital] ([Id], [Code], [Name], [Address], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CityId], [CloseDay], [CloseTime], [Description], [Fax], [GoogleLocation], [GoogleRating], [Mobile], [OpenDay], [OpenTime], [Phone], [Weekend], [IsActive], [Remarks], [WebAddress], [YearEstablished], [DiagnosticCenterIcon], [Email], [Location], [Branch], [IsMainBranch]) VALUES (9, N'00009', N'Al-Ahsraf General Hospital', N'House # 12 Road # 21,Sector # 4,Uttara Dhaka', CAST(N'2025-05-29T13:31:35.3000000' AS DateTime2), 2, NULL, NULL, NULL, NULL, NULL, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, N'', NULL, NULL, N'', 0)
GO
INSERT [dbo].[Configuration_Hospital] ([Id], [Code], [Name], [Address], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CityId], [CloseDay], [CloseTime], [Description], [Fax], [GoogleLocation], [GoogleRating], [Mobile], [OpenDay], [OpenTime], [Phone], [Weekend], [IsActive], [Remarks], [WebAddress], [YearEstablished], [DiagnosticCenterIcon], [Email], [Location], [Branch], [IsMainBranch]) VALUES (10, N'00010', N'Al-Biruni Hospital', N'23/1, Khilzee Road, Shyamoli', CAST(N'2025-05-29T13:31:35.3000000' AS DateTime2), 2, NULL, NULL, NULL, NULL, NULL, N'POPULAR DIAGNOSTIC CENTRE LTD | DHANMONDI is an advanced Centre for diagnostic and medical services. It is one of the prestigious diagnostic complexes of Bangladesh which started its activities in 1983. Popular Diagnostic Centre Ltd. is the largest diagnostic services provider organization in the private sector of the country. It is been a pioneer in introducing the world’s latest medical equipment and advanced technology to provide round-the-clock medical investigations and consultancy services.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, N'', NULL, NULL, N'', 0)
GO
INSERT [dbo].[Configuration_Hospital] ([Id], [Code], [Name], [Address], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CityId], [CloseDay], [CloseTime], [Description], [Fax], [GoogleLocation], [GoogleRating], [Mobile], [OpenDay], [OpenTime], [Phone], [Weekend], [IsActive], [Remarks], [WebAddress], [YearEstablished], [DiagnosticCenterIcon], [Email], [Location], [Branch], [IsMainBranch]) VALUES (11, N'00011', N'Dhaka Medical College & Hospital', N'সচিবালয় রোড, ঢাকা 1000', CAST(N'2025-05-29T13:31:35.3000000' AS DateTime2), 2, NULL, NULL, 1, N'N/A', NULL, N'POPULAR DIAGNOSTIC CENTRE LTD | DHANMONDI is an advanced Centre for diagnostic and medical services. It is one of the prestigious diagnostic complexes of Bangladesh which started its activities in 1983. Popular Diagnostic Centre Ltd. is the largest diagnostic services provider organization in the private sector of the country. It is been a pioneer in introducing the world’s latest medical equipment and advanced technology to provide round-the-clock medical investigations and consultancy services.', NULL, N'https://www.google.com/maps/dir//%E0%A6%A2%E0%A6%BE%E0%A6%95%E0%A6%BE+%E0%A6%AE%E0%A7%87%E0%A6%A1%E0%A6%BF%E0%A6%95%E0%A7%87%E0%A6%B2+%E0%A6%95%E0%A6%B2%E0%A7%87%E0%A6%9C+%E0%A6%B9%E0%A6%BE%E0%A6%B8%E0%A6%AA%E0%A6%BE%E0%A6%A4%E0%A6%BE%E0%A6%B2,+%E0%A6%B8%E0%A6%9A%E0%A6%BF%E0%A6%AC%E0%A6%BE%E0%A6%B2%E0%A7%9F+%E0%A6%B0%E0%A7%8B%E0%A6%A1,+%E0%A6%A2%E0%A6%BE%E0%A6%95%E0%A6%BE+1000/data=!4m6!4m5!1m1!4e2!1m2!1m1!1s0x3755b8e6474187cf:0xb3d3783755659522?sa=X&ved=1t:57443&ictx=111', N'4.3', N'0255165001', N'Everyday', N'Always', N'0255165001', NULL, 0, NULL, NULL, NULL, N'photos\DhakaMedicalLogo.svg', NULL, N'সচিবালয় রোড', N'', 1)
GO
INSERT [dbo].[Configuration_Hospital] ([Id], [Code], [Name], [Address], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CityId], [CloseDay], [CloseTime], [Description], [Fax], [GoogleLocation], [GoogleRating], [Mobile], [OpenDay], [OpenTime], [Phone], [Weekend], [IsActive], [Remarks], [WebAddress], [YearEstablished], [DiagnosticCenterIcon], [Email], [Location], [Branch], [IsMainBranch]) VALUES (12, N'00012', N'Delta Medical Centre Ltd', N'House # 20, Raod # 4, Dhanmondi R/A', CAST(N'2025-05-29T13:31:35.3033333' AS DateTime2), 2, NULL, NULL, NULL, NULL, NULL, N'POPULAR DIAGNOSTIC CENTRE LTD | DHANMONDI is an advanced Centre for diagnostic and medical services. It is one of the prestigious diagnostic complexes of Bangladesh which started its activities in 1983. Popular Diagnostic Centre Ltd. is the largest diagnostic services provider organization in the private sector of the country. It is been a pioneer in introducing the world’s latest medical equipment and advanced technology to provide round-the-clock medical investigations and consultancy services.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, N'', NULL, NULL, N'', 0)
GO
INSERT [dbo].[Configuration_Hospital] ([Id], [Code], [Name], [Address], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CityId], [CloseDay], [CloseTime], [Description], [Fax], [GoogleLocation], [GoogleRating], [Mobile], [OpenDay], [OpenTime], [Phone], [Weekend], [IsActive], [Remarks], [WebAddress], [YearEstablished], [DiagnosticCenterIcon], [Email], [Location], [Branch], [IsMainBranch]) VALUES (13, N'00013', N'Bangladesh Medical College', N'House # 35, Road # 14/A, Dhanmondi', CAST(N'2025-05-29T13:31:35.3033333' AS DateTime2), 2, NULL, NULL, NULL, NULL, NULL, N'POPULAR DIAGNOSTIC CENTRE LTD | DHANMONDI is an advanced Centre for diagnostic and medical services. It is one of the prestigious diagnostic complexes of Bangladesh which started its activities in 1983. Popular Diagnostic Centre Ltd. is the largest diagnostic services provider organization in the private sector of the country. It is been a pioneer in introducing the world’s latest medical equipment and advanced technology to provide round-the-clock medical investigations and consultancy services.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, N'', NULL, NULL, N'', 0)
GO
INSERT [dbo].[Configuration_Hospital] ([Id], [Code], [Name], [Address], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CityId], [CloseDay], [CloseTime], [Description], [Fax], [GoogleLocation], [GoogleRating], [Mobile], [OpenDay], [OpenTime], [Phone], [Weekend], [IsActive], [Remarks], [WebAddress], [YearEstablished], [DiagnosticCenterIcon], [Email], [Location], [Branch], [IsMainBranch]) VALUES (14, N'00014', N'Central Hospital Ltd', N'House # 2, Road # 5, Green Road, Dhanmondi', CAST(N'2025-05-29T13:31:35.3066667' AS DateTime2), 2, NULL, NULL, NULL, NULL, NULL, N'POPULAR DIAGNOSTIC CENTRE LTD | DHANMONDI is an advanced Centre for diagnostic and medical services. It is one of the prestigious diagnostic complexes of Bangladesh which started its activities in 1983. Popular Diagnostic Centre Ltd. is the largest diagnostic services provider organization in the private sector of the country. It is been a pioneer in introducing the world’s latest medical equipment and advanced technology to provide round-the-clock medical investigations and consultancy services.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, N'', NULL, NULL, N'', 0)
GO
INSERT [dbo].[Configuration_Hospital] ([Id], [Code], [Name], [Address], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CityId], [CloseDay], [CloseTime], [Description], [Fax], [GoogleLocation], [GoogleRating], [Mobile], [OpenDay], [OpenTime], [Phone], [Weekend], [IsActive], [Remarks], [WebAddress], [YearEstablished], [DiagnosticCenterIcon], [Email], [Location], [Branch], [IsMainBranch]) VALUES (15, N'00015', N'China-Bangla Hospital (Jv) Ltd', N'Plot # 1, Road # 7, Sector # 1, Uttara', CAST(N'2025-05-29T13:31:35.3100000' AS DateTime2), 2, NULL, NULL, NULL, NULL, NULL, N'POPULAR DIAGNOSTIC CENTRE LTD | DHANMONDI is an advanced Centre for diagnostic and medical services. It is one of the prestigious diagnostic complexes of Bangladesh which started its activities in 1983. Popular Diagnostic Centre Ltd. is the largest diagnostic services provider organization in the private sector of the country. It is been a pioneer in introducing the world’s latest medical equipment and advanced technology to provide round-the-clock medical investigations and consultancy services.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, N'', NULL, NULL, N'', 0)
GO
INSERT [dbo].[Configuration_Hospital] ([Id], [Code], [Name], [Address], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CityId], [CloseDay], [CloseTime], [Description], [Fax], [GoogleLocation], [GoogleRating], [Mobile], [OpenDay], [OpenTime], [Phone], [Weekend], [IsActive], [Remarks], [WebAddress], [YearEstablished], [DiagnosticCenterIcon], [Email], [Location], [Branch], [IsMainBranch]) VALUES (16, N'00016', N'CMH (Dhaka Cantonment)', N'Dhaka Cantonment, Dhaka', CAST(N'2025-05-29T13:31:35.3100000' AS DateTime2), 2, NULL, NULL, NULL, NULL, NULL, N'POPULAR DIAGNOSTIC CENTRE LTD | DHANMONDI is an advanced Centre for diagnostic and medical services. It is one of the prestigious diagnostic complexes of Bangladesh which started its activities in 1983. Popular Diagnostic Centre Ltd. is the largest diagnostic services provider organization in the private sector of the country. It is been a pioneer in introducing the world’s latest medical equipment and advanced technology to provide round-the-clock medical investigations and consultancy services.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, N'', NULL, NULL, N'', 1)
GO
INSERT [dbo].[Configuration_Hospital] ([Id], [Code], [Name], [Address], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CityId], [CloseDay], [CloseTime], [Description], [Fax], [GoogleLocation], [GoogleRating], [Mobile], [OpenDay], [OpenTime], [Phone], [Weekend], [IsActive], [Remarks], [WebAddress], [YearEstablished], [DiagnosticCenterIcon], [Email], [Location], [Branch], [IsMainBranch]) VALUES (17, N'00017', N'Ibn Sina Hospital', N'House#68, Road#15/A, Dhanmondi, Dhaka-1209
', CAST(N'2025-05-29T13:31:35.3100000' AS DateTime2), 2, NULL, NULL, 1, N'N/A', NULL, N'POPULAR DIAGNOSTIC CENTRE LTD | DHANMONDI is an advanced Centre for diagnostic and medical services. It is one of the prestigious diagnostic complexes of Bangladesh which started its activities in 1983. ', NULL, N'https://www.google.com/maps/dir//%E0%A6%87%E0%A6%AC%E0%A6%A8%E0%A7%87+%E0%A6%B8%E0%A6%BF%E0%A6%A8%E0%A6%BE+%E0%A6%A1%E0%A6%BE%E0%A6%AF%E0%A6%BC%E0%A6%BE%E0%A6%97%E0%A6%A8%E0%A6%B8%E0%A7%8D%E0%A6%9F%E0%A6%BF%E0%A6%95+%E0%A6%93+%E0%A6%AA%E0%A6%B0%E0%A6%BE%E0%A6%AE%E0%A6%B0%E0%A7%8D%E0%A6%B6+%E0%A6%95%E0%A7%87%E0%A6%A8%E0%A7%8D%E0%A6%A6%E0%A7%8D%E0%A6%B0,+%E0%A6%AE%E0%A6%BE%E0%A6%B2%E0%A6%BF%E0%A6%AC%E0%A6%BE%E0%A6%97,+House+%23+479,+DIT+Road,+(Near+Malibagh+Rail+Gate,+W+Malibagh,+%E0%A6%A2%E0%A6%BE%E0%A6%95%E0%A6%BE+1217/data=!4m6!4m5!1m1!4e2!1m2!1m1!1s0x3755b8629fe03d83:0x831553a3f462e777?sa=X&ved=1t:57443&ictx=111', N'4.3', N'09610-009616', N'Everyday', N'Always', N'09610-009616', N'N/A', 0, NULL, NULL, NULL, N'photos\IbnSinaLogo.svg', NULL, N'Dhanmondi', N'Ibn Sina Specialized Hospital
', 0)
GO
INSERT [dbo].[Configuration_Hospital] ([Id], [Code], [Name], [Address], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CityId], [CloseDay], [CloseTime], [Description], [Fax], [GoogleLocation], [GoogleRating], [Mobile], [OpenDay], [OpenTime], [Phone], [Weekend], [IsActive], [Remarks], [WebAddress], [YearEstablished], [DiagnosticCenterIcon], [Email], [Location], [Branch], [IsMainBranch]) VALUES (19, N'00018', N'Ibn Sina Hospital', N'1/1, Mirpur Road, Kallyanpur, Dhaka-1216
', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), 2, NULL, NULL, 1, N'N/A', NULL, N'POPULAR DIAGNOSTIC CENTRE LTD | DHANMONDI is an advanced Centre for diagnostic and medical services. It is one of the prestigious diagnostic complexes of Bangladesh which started its activities in 1983. Popular Diagnostic Centre Ltd. is the largest diagnostic services provider organization in the private sector of the country. It is been a pioneer in introducing the world’s latest medical equipment and advanced technology to provide round-the-clock medical investigations and consultancy services.', NULL, N'https://g.co/kgs/BChrK9A', N'3.7', N'09666-710606', N'Everyday', N'Always', N'09666-710606', N'N/A', 0, NULL, NULL, NULL, N'photos\LabAidLogo.svg', NULL, N'Dhanmondi', N'Ibn Sina Medical College Hospital', 0)
GO
INSERT [dbo].[Configuration_Hospital] ([Id], [Code], [Name], [Address], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CityId], [CloseDay], [CloseTime], [Description], [Fax], [GoogleLocation], [GoogleRating], [Mobile], [OpenDay], [OpenTime], [Phone], [Weekend], [IsActive], [Remarks], [WebAddress], [YearEstablished], [DiagnosticCenterIcon], [Email], [Location], [Branch], [IsMainBranch]) VALUES (20, N'00019', N'Ibn Sina Hospital', N'House#58, Road#2/A, Dhaka-1209
', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), 2, NULL, NULL, 1, N'N/A', N'11:00PM', N'POPULAR DIAGNOSTIC CENTRE LTD | DHANMONDI is an advanced Centre for diagnostic and medical services. It is one of the prestigious diagnostic complexes of Bangladesh which started its activities in 1983. Popular Diagnostic Centre Ltd. is the largest diagnostic services provider organization in the private sector of the country. It is been a pioneer in introducing the world’s latest medical equipment and advanced technology to provide round-the-clock medical investigations and consultancy services.', NULL, N'https://g.co/kgs/CJ9vCMX', N'3.6', N' 09666-787801', N'Everyday', N'07:00AM', N' 09666-787801', N'N/A', 0, NULL, NULL, NULL, N'photos\PopularDiagnosticLogo.svg', NULL, N'N/A', N'Ibn Sina Medical Imaging Center
', 0)
GO
INSERT [dbo].[Configuration_Hospital] ([Id], [Code], [Name], [Address], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CityId], [CloseDay], [CloseTime], [Description], [Fax], [GoogleLocation], [GoogleRating], [Mobile], [OpenDay], [OpenTime], [Phone], [Weekend], [IsActive], [Remarks], [WebAddress], [YearEstablished], [DiagnosticCenterIcon], [Email], [Location], [Branch], [IsMainBranch]) VALUES (43, N'00020', N'Ibn Sina Hospital', N'28, Doyagonj (Hut lane), Gandaria, Dhaka-1204
', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), 3, NULL, NULL, 2, N'N/A', NULL, N'POPULAR DIAGNOSTIC CENTRE LTD | DHANMONDI is an advanced Centre for diagnostic and medical services. It is one of the prestigious diagnostic complexes of Bangladesh which started its activities in 1983. ', NULL, N'https://www.google.com/maps/dir//%E0%A6%87%E0%A6%AC%E0%A6%A8%E0%A7%87+%E0%A6%B8%E0%A6%BF%E0%A6%A8%E0%A6%BE+%E0%A6%A1%E0%A6%BE%E0%A6%AF%E0%A6%BC%E0%A6%BE%E0%A6%97%E0%A6%A8%E0%A6%B8%E0%A7%8D%E0%A6%9F%E0%A6%BF%E0%A6%95+%E0%A6%93+%E0%A6%AA%E0%A6%B0%E0%A6%BE%E0%A6%AE%E0%A6%B0%E0%A7%8D%E0%A6%B6+%E0%A6%95%E0%A7%87%E0%A6%A8%E0%A7%8D%E0%A6%A6%E0%A7%8D%E0%A6%B0,+%E0%A6%AE%E0%A6%BE%E0%A6%B2%E0%A6%BF%E0%A6%AC%E0%A6%BE%E0%A6%97,+House+%23+479,+DIT+Road,+(Near+Malibagh+Rail+Gate,+W+Malibagh,+%E0%A6%A2%E0%A6%BE%E0%A6%95%E0%A6%BE+1217/data=!4m6!4m5!1m1!4e2!1m2!1m1!1s0x3755b8629fe03d83:0x831553a3f462e777?sa=X&ved=1t:57443&ictx=111', N'5.3', N'09610-009617', N'Everyday', N'Always', N'09610-009617', N'N/A', 0, NULL, NULL, NULL, N'photos\IbnSinaLogo.svg', NULL, N'N/A', N'Ibn Sina D.Lab & Consultation Center, Doyagonj
', 0)
GO
INSERT [dbo].[Configuration_Hospital] ([Id], [Code], [Name], [Address], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CityId], [CloseDay], [CloseTime], [Description], [Fax], [GoogleLocation], [GoogleRating], [Mobile], [OpenDay], [OpenTime], [Phone], [Weekend], [IsActive], [Remarks], [WebAddress], [YearEstablished], [DiagnosticCenterIcon], [Email], [Location], [Branch], [IsMainBranch]) VALUES (44, N'00021', N'LABAID', N'House # 01 & 03, Road-04, Dhanmondi, Dhaka-1205 ', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), 6, NULL, NULL, 5, N'N/A', NULL, N'POPULAR DIAGNOSTIC CENTRE LTD | DHANMONDI is an advanced Centre for diagnostic and medical services. It is one of the prestigious diagnostic complexes of Bangladesh which started its activities in 1983. ', NULL, N'https://www.google.com/maps/dir//%E0%A6%87%E0%A6%AC%E0%A6%A8%E0%A7%87+%E0%A6%B8%E0%A6%BF%E0%A6%A8%E0%A6%BE+%E0%A6%A1%E0%A6%BE%E0%A6%AF%E0%A6%BC%E0%A6%BE%E0%A6%97%E0%A6%A8%E0%A6%B8%E0%A7%8D%E0%A6%9F%E0%A6%BF%E0%A6%95+%E0%A6%93+%E0%A6%AA%E0%A6%B0%E0%A6%BE%E0%A6%AE%E0%A6%B0%E0%A7%8D%E0%A6%B6+%E0%A6%95%E0%A7%87%E0%A6%A8%E0%A7%8D%E0%A6%A6%E0%A7%8D%E0%A6%B0,+%E0%A6%AE%E0%A6%BE%E0%A6%B2%E0%A6%BF%E0%A6%AC%E0%A6%BE%E0%A6%97,+House+%23+479,+DIT+Road,+(Near+Malibagh+Rail+Gate,+W+Malibagh,+%E0%A6%A2%E0%A6%BE%E0%A6%95%E0%A6%BE+1217/data=!4m6!4m5!1m1!4e2!1m2!1m1!1s0x3755b8629fe03d83:0x831553a3f462e777?sa=X&ved=1t:57443&ictx=111', N'8.3', N'09610-009620', N'Everyday', N'Always', N'09610-009620', N'N/A', 0, NULL, NULL, NULL, N'photos\IbnSinaLogo.svg', NULL, N'Dhanmondi', N'LABAID Cardiac Hospital', 0)
GO
INSERT [dbo].[Configuration_Hospital] ([Id], [Code], [Name], [Address], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CityId], [CloseDay], [CloseTime], [Description], [Fax], [GoogleLocation], [GoogleRating], [Mobile], [OpenDay], [OpenTime], [Phone], [Weekend], [IsActive], [Remarks], [WebAddress], [YearEstablished], [DiagnosticCenterIcon], [Email], [Location], [Branch], [IsMainBranch]) VALUES (46, N'00023', N'LABAID', N'26 গ্রীন রোড, ঢাকা 1205', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), 2, NULL, NULL, 1, N'N/A', NULL, N'POPULAR DIAGNOSTIC CENTRE LTD | DHANMONDI is an advanced Centre for diagnostic and medical services. It is one of the prestigious diagnostic complexes of Bangladesh which started its activities in 1983. ', NULL, N'https://g.co/kgs/BChrK9A', N'3.7', N'09666-710606', N'Everyday', N'Always', N'09666-710606', N'N/A', 0, NULL, NULL, NULL, N'photos\LabAidLogo.svg', NULL, N'Green Road', N'LABAID Specialized Hospital', 0)
GO
INSERT [dbo].[Configuration_Hospital] ([Id], [Code], [Name], [Address], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CityId], [CloseDay], [CloseTime], [Description], [Fax], [GoogleLocation], [GoogleRating], [Mobile], [OpenDay], [OpenTime], [Phone], [Weekend], [IsActive], [Remarks], [WebAddress], [YearEstablished], [DiagnosticCenterIcon], [Email], [Location], [Branch], [IsMainBranch]) VALUES (47, N'00024', N'LABAID', N'House-01 & 03, রোড-০৪, ঢাকা 1205', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), 2, NULL, NULL, 1, N'N/A', NULL, N'POPULAR DIAGNOSTIC CENTRE LTD | DHANMONDI is an advanced Centre for diagnostic and medical services. It is one of the prestigious diagnostic complexes of Bangladesh which started its activities in 1983. ', NULL, N'https://g.co/kgs/BChrK9A', N'3.8', N'09666-710606', N'Everyday', N'Always', N'09666-710606', N'N/A', 0, NULL, NULL, NULL, N'photos\LabAidLogo.svg', NULL, N'Dhanmondi', N'LABAID Cardiac Hospital', 0)
GO
INSERT [dbo].[Configuration_Hospital] ([Id], [Code], [Name], [Address], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CityId], [CloseDay], [CloseTime], [Description], [Fax], [GoogleLocation], [GoogleRating], [Mobile], [OpenDay], [OpenTime], [Phone], [Weekend], [IsActive], [Remarks], [WebAddress], [YearEstablished], [DiagnosticCenterIcon], [Email], [Location], [Branch], [IsMainBranch]) VALUES (48, N'00025', N'Popular Diagnostic Centre Ltd.', N'House # 16, Road # 2, Dhanmondi, Dhaka-1205', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), 2, NULL, NULL, 1, N'N/A', N'11:00PM', N'POPULAR DIAGNOSTIC CENTRE LTD | DHANMONDI is an advanced Centre for diagnostic and medical services. It is one of the prestigious diagnostic complexes of Bangladesh which started its activities in 1983. ', NULL, N'https://g.co/kgs/CJ9vCMX', N'3.6', N'09666 787801', N'Everyday', N'07:00AM', N'09666-787801', N'N/A', 0, NULL, NULL, NULL, N'photos\PopularDiagnosticLogo.svg', NULL, N'Dhanmondi', N'DHANMONDI Branch', 0)
GO
INSERT [dbo].[Configuration_Hospital] ([Id], [Code], [Name], [Address], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CityId], [CloseDay], [CloseTime], [Description], [Fax], [GoogleLocation], [GoogleRating], [Mobile], [OpenDay], [OpenTime], [Phone], [Weekend], [IsActive], [Remarks], [WebAddress], [YearEstablished], [DiagnosticCenterIcon], [Email], [Location], [Branch], [IsMainBranch]) VALUES (49, N'00026', N'Popular Diagnostic Centre Ltd.', N'House # 2, English Road, Dhaka', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), 2, NULL, NULL, 1, N'N/A', N'11:00PM', N'POPULAR DIAGNOSTIC CENTRE LTD | DHANMONDI is an advanced Centre for diagnostic and medical services. It is one of the prestigious diagnostic complexes of Bangladesh which started its activities in 1983. ', NULL, N'https://g.co/kgs/CJ9vCMX', N'3.6', N'09666 787801', N'Everyday', N'07:00AM', N'09666-787801', N'N/A', 0, NULL, NULL, NULL, N'photos\PopularDiagnosticLogo.svg', NULL, N'English Road', N'ENGLISH ROAD Branch', 0)
GO
INSERT [dbo].[Configuration_Hospital] ([Id], [Code], [Name], [Address], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CityId], [CloseDay], [CloseTime], [Description], [Fax], [GoogleLocation], [GoogleRating], [Mobile], [OpenDay], [OpenTime], [Phone], [Weekend], [IsActive], [Remarks], [WebAddress], [YearEstablished], [DiagnosticCenterIcon], [Email], [Location], [Branch], [IsMainBranch]) VALUES (50, N'00027', N'Popular Diagnostic Centre Ltd.', N'11, Shantinagar, Motijheel, Dhaka', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), 2, NULL, NULL, 1, N'N/A', N'11:00PM', N'POPULAR DIAGNOSTIC CENTRE LTD | DHANMONDI is an advanced Centre for diagnostic and medical services. It is one of the prestigious diagnostic complexes of Bangladesh which started its activities in 1983. ', NULL, N'https://g.co/kgs/CJ9vCMX', N'3.6', N'09666 787801', N'Everyday', N'07:00AM', N'09666-787801', N'N/A', 0, NULL, NULL, NULL, N'photos\PopularDiagnosticLogo.svg', NULL, N'Shantinagar 1', N'SHANTINAGAR, Unit-1 Branch', 0)
GO
INSERT [dbo].[Configuration_Hospital] ([Id], [Code], [Name], [Address], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CityId], [CloseDay], [CloseTime], [Description], [Fax], [GoogleLocation], [GoogleRating], [Mobile], [OpenDay], [OpenTime], [Phone], [Weekend], [IsActive], [Remarks], [WebAddress], [YearEstablished], [DiagnosticCenterIcon], [Email], [Location], [Branch], [IsMainBranch]) VALUES (51, N'00028', N'Popular Diagnostic Centre Ltd.', N'Level – 4, Building # 15, Shantinagar, Motijheel, Dhaka', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), 2, NULL, NULL, 1, N'N/A', N'11:00PM', N'POPULAR DIAGNOSTIC CENTRE LTD | DHANMONDI is an advanced Centre for diagnostic and medical services. It is one of the prestigious diagnostic complexes of Bangladesh which started its activities in 1983. ', NULL, N'https://g.co/kgs/CJ9vCMX', N'3.6', N'09666 787802, 09613 787802', N'Everyday', N'07:00AM', N'09666-787801', N'N/A', 0, NULL, NULL, NULL, N'photos\PopularDiagnosticLogo.svg', NULL, N'Shantinagar 2', N'SHANTINAGAR, Unit-2 Branch', 0)
GO
INSERT [dbo].[Configuration_Hospital] ([Id], [Code], [Name], [Address], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CityId], [CloseDay], [CloseTime], [Description], [Fax], [GoogleLocation], [GoogleRating], [Mobile], [OpenDay], [OpenTime], [Phone], [Weekend], [IsActive], [Remarks], [WebAddress], [YearEstablished], [DiagnosticCenterIcon], [Email], [Location], [Branch], [IsMainBranch]) VALUES (52, N'00029', N'Popular Diagnostic Centre Ltd.', N'231/4, Bangabandhu Road, Balur Math, Chashara, Narayangonj', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), 2, NULL, NULL, 1, N'N/A', N'11:00PM', N'POPULAR DIAGNOSTIC CENTRE LTD | DHANMONDI is an advanced Centre for diagnostic and medical services. It is one of the prestigious diagnostic complexes of Bangladesh which started its activities in 1983. ', NULL, N'https://g.co/kgs/CJ9vCMX', N'3.6', N'09666 787801', N'Everyday', N'07:00AM', N'09666-787801', N'N/A', 0, NULL, NULL, NULL, N'photos\PopularDiagnosticLogo.svg', NULL, N'Narayanganj', N'NARAYANGONJ Branch', 0)
GO
INSERT [dbo].[Configuration_Hospital] ([Id], [Code], [Name], [Address], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CityId], [CloseDay], [CloseTime], [Description], [Fax], [GoogleLocation], [GoogleRating], [Mobile], [OpenDay], [OpenTime], [Phone], [Weekend], [IsActive], [Remarks], [WebAddress], [YearEstablished], [DiagnosticCenterIcon], [Email], [Location], [Branch], [IsMainBranch]) VALUES (53, N'00030', N'Popular Diagnostic Centre Ltd.', N'E/22, Talbagh, Anandapur, Savar, Dhaka', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), 2, NULL, NULL, 1, N'N/A', N'11:00PM', N'POPULAR DIAGNOSTIC CENTRE LTD | DHANMONDI is an advanced Centre for diagnostic and medical services. It is one of the prestigious diagnostic complexes of Bangladesh which started its activities in 1983. ', NULL, N'https://g.co/kgs/CJ9vCMX', N'3.6', N'09666 787801', N'Everyday', N'07:00AM', N'09666-787801', N'N/A', 0, NULL, NULL, NULL, N'photos\PopularDiagnosticLogo.svg', NULL, N'Savar', N'SAVAR Branch', 0)
GO
INSERT [dbo].[Configuration_Hospital] ([Id], [Code], [Name], [Address], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CityId], [CloseDay], [CloseTime], [Description], [Fax], [GoogleLocation], [GoogleRating], [Mobile], [OpenDay], [OpenTime], [Phone], [Weekend], [IsActive], [Remarks], [WebAddress], [YearEstablished], [DiagnosticCenterIcon], [Email], [Location], [Branch], [IsMainBranch]) VALUES (54, N'00031', N'Popular Diagnostic Centre Ltd.', N'House # 21, Road # 7, Sector # 4, Jashim Uddin More, Uttara, Dhaka-1230', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), 2, NULL, NULL, 1, N'N/A', N'11:00PM', N'POPULAR DIAGNOSTIC CENTRE LTD | DHANMONDI is an advanced Centre for diagnostic and medical services. It is one of the prestigious diagnostic complexes of Bangladesh which started its activities in 1983. ', NULL, N'https://g.co/kgs/CJ9vCMX', N'3.6', N'09666 787801', N'Everyday', N'07:00AM', N'09666-787801', N'N/A', 0, NULL, NULL, NULL, N'photos\PopularDiagnosticLogo.svg', NULL, N'Uttara 1', N'UTTARA Unit-1 Branch', 0)
GO
INSERT [dbo].[Configuration_Hospital] ([Id], [Code], [Name], [Address], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CityId], [CloseDay], [CloseTime], [Description], [Fax], [GoogleLocation], [GoogleRating], [Mobile], [OpenDay], [OpenTime], [Phone], [Weekend], [IsActive], [Remarks], [WebAddress], [YearEstablished], [DiagnosticCenterIcon], [Email], [Location], [Branch], [IsMainBranch]) VALUES (55, N'00032', N'Popular Diagnostic Centre Ltd.', N'House # 25, Road # 7, Sector # 4, Jashim Uddin Moar, Uttara, Dhaka', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), 2, NULL, NULL, 1, N'N/A', N'11:00PM', N'POPULAR DIAGNOSTIC CENTRE LTD | DHANMONDI is an advanced Centre for diagnostic and medical services. It is one of the prestigious diagnostic complexes of Bangladesh which started its activities in 1983. ', NULL, N'https://g.co/kgs/CJ9vCMX', N'3.6', N'09666 787801', N'Everyday', N'07:00AM', N'09666-787801', N'N/A', 0, NULL, NULL, NULL, N'photos\PopularDiagnosticLogo.svg', NULL, N'Uttara 2', N'UTTARA Unit-2 Branch', 0)
GO
INSERT [dbo].[Configuration_Hospital] ([Id], [Code], [Name], [Address], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CityId], [CloseDay], [CloseTime], [Description], [Fax], [GoogleLocation], [GoogleRating], [Mobile], [OpenDay], [OpenTime], [Phone], [Weekend], [IsActive], [Remarks], [WebAddress], [YearEstablished], [DiagnosticCenterIcon], [Email], [Location], [Branch], [IsMainBranch]) VALUES (56, N'00033', N'Popular Diagnostic Centre Ltd.', N'22/7 A S M Nuruzzaman Road, Block-B, Babor Road, Mohammadpur, Dhaka-1207', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), 2, NULL, NULL, 1, N'N/A', N'11:00PM', N'POPULAR DIAGNOSTIC CENTRE LTD | DHANMONDI is an advanced Centre for diagnostic and medical services. It is one of the prestigious diagnostic complexes of Bangladesh which started its activities in 1983. ', NULL, N'https://g.co/kgs/CJ9vCMX', N'3.6', N'09666 787801', N'Everyday', N'07:00AM', N'09666-787801', N'N/A', 0, NULL, NULL, NULL, N'photos\PopularDiagnosticLogo.svg', NULL, N'Shaymoli', N'SHYAMOLI Branch', 0)
GO
INSERT [dbo].[Configuration_Hospital] ([Id], [Code], [Name], [Address], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CityId], [CloseDay], [CloseTime], [Description], [Fax], [GoogleLocation], [GoogleRating], [Mobile], [OpenDay], [OpenTime], [Phone], [Weekend], [IsActive], [Remarks], [WebAddress], [YearEstablished], [DiagnosticCenterIcon], [Email], [Location], [Branch], [IsMainBranch]) VALUES (57, N'00034', N'Popular Diagnostic Centre Ltd.', N'House # 67, Avenue # 5, Block # C, Section-6 Mirpur, (Original-10), Pallabi, Dhaka', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), 2, NULL, NULL, 1, N'N/A', N'11:00PM', N'POPULAR DIAGNOSTIC CENTRE LTD | DHANMONDI is an advanced Centre for diagnostic and medical services. It is one of the prestigious diagnostic complexes of Bangladesh which started its activities in 1983. ', NULL, N'https://g.co/kgs/CJ9vCMX', N'3.6', N'09666 787801', N'Everyday', N'07:00AM', N'09666-787801', N'N/A', 0, NULL, NULL, NULL, N'photos\PopularDiagnosticLogo.svg', NULL, N'Mirpur Unit 1', N'MIRPUR Unit-1 Branch', 0)
GO
INSERT [dbo].[Configuration_Hospital] ([Id], [Code], [Name], [Address], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CityId], [CloseDay], [CloseTime], [Description], [Fax], [GoogleLocation], [GoogleRating], [Mobile], [OpenDay], [OpenTime], [Phone], [Weekend], [IsActive], [Remarks], [WebAddress], [YearEstablished], [DiagnosticCenterIcon], [Email], [Location], [Branch], [IsMainBranch]) VALUES (58, N'00035', N'Popular Diagnostic Centre Ltd.', N'House # 02, Avenue # 01, Block # A, Section-10 (Bnaroshi Polli Gate-01), Pallabi, Mirpur, Dhaka', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), 2, NULL, NULL, 1, N'N/A', N'11:00PM', N'POPULAR DIAGNOSTIC CENTRE LTD | DHANMONDI is an advanced Centre for diagnostic and medical services. It is one of the prestigious diagnostic complexes of Bangladesh which started its activities in 1983. ', NULL, N'https://g.co/kgs/CJ9vCMX', N'3.6', N'09666 787801', N'Everyday', N'07:00AM', N'09666-787801', N'N/A', 0, NULL, NULL, NULL, N'photos\PopularDiagnosticLogo.svg', NULL, N'Mirpur Unit 2', N'MIRPUR Unit-2 Branch', 0)
GO
INSERT [dbo].[Configuration_Hospital] ([Id], [Code], [Name], [Address], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CityId], [CloseDay], [CloseTime], [Description], [Fax], [GoogleLocation], [GoogleRating], [Mobile], [OpenDay], [OpenTime], [Phone], [Weekend], [IsActive], [Remarks], [WebAddress], [YearEstablished], [DiagnosticCenterIcon], [Email], [Location], [Branch], [IsMainBranch]) VALUES (59, N'00036', N'Popular Diagnostic Centre Ltd.', N'Cha-90/2, North Badda (Pragoti Sharoni), Dhaka-1212', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), 2, NULL, NULL, 1, N'N/A', N'11:00PM', N'POPULAR DIAGNOSTIC CENTRE LTD | DHANMONDI is an advanced Centre for diagnostic and medical services. It is one of the prestigious diagnostic complexes of Bangladesh which started its activities in 1983. ', NULL, N'https://g.co/kgs/CJ9vCMX', N'3.6', N'09666 787801', N'Everyday', N'07:00AM', N'09666-787801', N'N/A', 0, NULL, NULL, NULL, N'photos\PopularDiagnosticLogo.svg', NULL, N'Badda', N'BADDA Branch', 0)
GO
INSERT [dbo].[Configuration_Hospital] ([Id], [Code], [Name], [Address], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CityId], [CloseDay], [CloseTime], [Description], [Fax], [GoogleLocation], [GoogleRating], [Mobile], [OpenDay], [OpenTime], [Phone], [Weekend], [IsActive], [Remarks], [WebAddress], [YearEstablished], [DiagnosticCenterIcon], [Email], [Location], [Branch], [IsMainBranch]) VALUES (60, N'00037', N'Popular Diagnostic Centre Ltd.', N'Gazipur Shibbari More (Near VIP Bus Terminal and Walton Show Room)', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), 2, NULL, NULL, 1, N'N/A', N'11:00PM', N'POPULAR DIAGNOSTIC CENTRE LTD | DHANMONDI is an advanced Centre for diagnostic and medical services. It is one of the prestigious diagnostic complexes of Bangladesh which started its activities in 1983. ', NULL, N'https://g.co/kgs/CJ9vCMX', N'3.6', N'09666 787801', N'Everyday', N'07:00AM', N'09666-787801', N'N/A', 0, NULL, NULL, NULL, N'photos\PopularDiagnosticLogo.svg', NULL, N'Gazipur', N'GAZIPUR Branch', 0)
GO
INSERT [dbo].[Configuration_Hospital] ([Id], [Code], [Name], [Address], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CityId], [CloseDay], [CloseTime], [Description], [Fax], [GoogleLocation], [GoogleRating], [Mobile], [OpenDay], [OpenTime], [Phone], [Weekend], [IsActive], [Remarks], [WebAddress], [YearEstablished], [DiagnosticCenterIcon], [Email], [Location], [Branch], [IsMainBranch]) VALUES (61, N'00038', N'Popular Diagnostic Centre Ltd.', N'House #1222, New Bus stand (Near Shaheed Bhulu Stadium) Maijdee Court, Noakhali', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), 2, NULL, NULL, 1, N'N/A', N'11:00PM', N'POPULAR DIAGNOSTIC CENTRE LTD | DHANMONDI is an advanced Centre for diagnostic and medical services. It is one of the prestigious diagnostic complexes of Bangladesh which started its activities in 1983. ', NULL, N'https://g.co/kgs/CJ9vCMX', N'3.6', N'09666 787801', N'Everyday', N'07:00AM', N'09666-787801', N'N/A', 0, NULL, NULL, NULL, N'photos\PopularDiagnosticLogo.svg', NULL, N'Noakhali', N'NOAKHALI Branch', 0)
GO
INSERT [dbo].[Configuration_Hospital] ([Id], [Code], [Name], [Address], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CityId], [CloseDay], [CloseTime], [Description], [Fax], [GoogleLocation], [GoogleRating], [Mobile], [OpenDay], [OpenTime], [Phone], [Weekend], [IsActive], [Remarks], [WebAddress], [YearEstablished], [DiagnosticCenterIcon], [Email], [Location], [Branch], [IsMainBranch]) VALUES (62, N'00039', N'Popular Diagnostic Centre Ltd.', N'20/B. K. B. Fazlul Kader Road, Panchlaish, Chattogram', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), 2, NULL, NULL, 1, N'N/A', N'11:00PM', N'POPULAR DIAGNOSTIC CENTRE LTD | DHANMONDI is an advanced Centre for diagnostic and medical services. It is one of the prestigious diagnostic complexes of Bangladesh which started its activities in 1983. ', NULL, N'https://g.co/kgs/CJ9vCMX', N'3.6', N'09666 787801', N'Everyday', N'07:00AM', N'09666-787801', N'N/A', 0, NULL, NULL, NULL, N'photos\PopularDiagnosticLogo.svg', NULL, N'Chattogram', N'CHATTOGRAM Branch', 0)
GO
INSERT [dbo].[Configuration_Hospital] ([Id], [Code], [Name], [Address], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CityId], [CloseDay], [CloseTime], [Description], [Fax], [GoogleLocation], [GoogleRating], [Mobile], [OpenDay], [OpenTime], [Phone], [Weekend], [IsActive], [Remarks], [WebAddress], [YearEstablished], [DiagnosticCenterIcon], [Email], [Location], [Branch], [IsMainBranch]) VALUES (63, N'00040', N'Popular Diagnostic Centre Ltd.', N'House # 474, Chowdhury Tower, Laxmipur, Rajshahi', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), 2, NULL, NULL, 1, N'N/A', N'11:00PM', N'POPULAR DIAGNOSTIC CENTRE LTD | DHANMONDI is an advanced Centre for diagnostic and medical services. It is one of the prestigious diagnostic complexes of Bangladesh which started its activities in 1983. ', NULL, N'https://g.co/kgs/CJ9vCMX', N'3.6', N'09666 787801', N'Everyday', N'07:00AM', N'09666-787801', N'N/A', 0, NULL, NULL, NULL, N'photos\PopularDiagnosticLogo.svg', NULL, N'Rajshahi', N'RAJSHAHI Branch', 0)
GO
INSERT [dbo].[Configuration_Hospital] ([Id], [Code], [Name], [Address], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CityId], [CloseDay], [CloseTime], [Description], [Fax], [GoogleLocation], [GoogleRating], [Mobile], [OpenDay], [OpenTime], [Phone], [Weekend], [IsActive], [Remarks], [WebAddress], [YearEstablished], [DiagnosticCenterIcon], [Email], [Location], [Branch], [IsMainBranch]) VALUES (64, N'00041', N'Popular Diagnostic Centre Ltd.', N'77/1, Road No-1, Dhap, Jail Road, Rangpur', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), 2, NULL, NULL, 1, N'N/A', N'11:00PM', N'POPULAR DIAGNOSTIC CENTRE LTD | DHANMONDI is an advanced Centre for diagnostic and medical services. It is one of the prestigious diagnostic complexes of Bangladesh which started its activities in 1983. ', NULL, N'https://g.co/kgs/CJ9vCMX', N'3.6', N'09666 787801', N'Everyday', N'07:00AM', N'09666-787801', N'N/A', 0, NULL, NULL, NULL, N'photos\PopularDiagnosticLogo.svg', NULL, N'Rangpur Unit 1', N'RANGPUR Unit-1 Branch', 0)
GO
INSERT [dbo].[Configuration_Hospital] ([Id], [Code], [Name], [Address], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CityId], [CloseDay], [CloseTime], [Description], [Fax], [GoogleLocation], [GoogleRating], [Mobile], [OpenDay], [OpenTime], [Phone], [Weekend], [IsActive], [Remarks], [WebAddress], [YearEstablished], [DiagnosticCenterIcon], [Email], [Location], [Branch], [IsMainBranch]) VALUES (65, N'00042', N'Popular Diagnostic Centre Ltd.', N'77/1, Road No-1, Dhap, Jail Road, Rangpur', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), 2, NULL, NULL, 1, N'N/A', N'11:00PM', N'POPULAR DIAGNOSTIC CENTRE LTD | DHANMONDI is an advanced Centre for diagnostic and medical services. It is one of the prestigious diagnostic complexes of Bangladesh which started its activities in 1983. ', NULL, N'https://g.co/kgs/CJ9vCMX', N'3.6', N'09666 787801', N'Everyday', N'07:00AM', N'09666-787801', N'N/A', 0, NULL, NULL, NULL, N'photos\PopularDiagnosticLogo.svg', NULL, N'Rangpur Unit 2', N'RANGPUR Unit-2 Branch', 0)
GO
INSERT [dbo].[Configuration_Hospital] ([Id], [Code], [Name], [Address], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CityId], [CloseDay], [CloseTime], [Description], [Fax], [GoogleLocation], [GoogleRating], [Mobile], [OpenDay], [OpenTime], [Phone], [Weekend], [IsActive], [Remarks], [WebAddress], [YearEstablished], [DiagnosticCenterIcon], [Email], [Location], [Branch], [IsMainBranch]) VALUES (66, N'00043', N'Popular Diagnostic Centre Ltd.', N'House #44, 1 No. Upashahar, Fulbari Bus stand, Dinajpur', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), 2, NULL, NULL, 1, N'N/A', N'11:00PM', N'POPULAR DIAGNOSTIC CENTRE LTD | DHANMONDI is an advanced Centre for diagnostic and medical services. It is one of the prestigious diagnostic complexes of Bangladesh which started its activities in 1983. ', NULL, N'https://g.co/kgs/CJ9vCMX', N'3.6', N'09666 787801', N'Everyday', N'07:00AM', N'09666-787801', N'N/A', 0, NULL, NULL, NULL, N'photos\PopularDiagnosticLogo.svg', NULL, N'Dinajpur', N'DINAJPUR Branch', 0)
GO
SET IDENTITY_INSERT [dbo].[Configuration_Hospital] OFF
GO
SET IDENTITY_INSERT [dbo].[Configuration_Investigation] ON 
GO
INSERT [dbo].[Configuration_Investigation] ([Id], [Code], [TestName], [TestDescription], [TestFullName], [TestShortName], [TestNameByDiagnosticCenter], [UnitPrice], [PriceUnitId], [NationalUnitPrice], [NationalPriceUnitId], [Speciality], [Comments], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [IsActive], [Specimen], [TestGenericName], [NationalPriceReference]) VALUES (1, N'00001', N'Complete Blood Count', N'A Complete Blood Count (CBC) is a common blood test that provides information about the different types of cells in your blood.', N'Complete Blood Count,  Hemogram Test', N'CBC', N'Complete Blood Count', CAST(500.00 AS Decimal(10, 2)), 17, CAST(300.00 AS Decimal(10, 2)), 17, NULL, NULL, CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), 2, NULL, NULL, 0, NULL, NULL, N'https://www.dgdagov.info/index.php/registered-products/allopathic')
GO
INSERT [dbo].[Configuration_Investigation] ([Id], [Code], [TestName], [TestDescription], [TestFullName], [TestShortName], [TestNameByDiagnosticCenter], [UnitPrice], [PriceUnitId], [NationalUnitPrice], [NationalPriceUnitId], [Speciality], [Comments], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [IsActive], [Specimen], [TestGenericName], [NationalPriceReference]) VALUES (10, N'00002', N'TC, DC, Hb, ESR,Combined', N'The combined tests TC, DC, Hb, and ESR are all part of a standard blood test called a complete blood count (CBC) with differential and ESR. These tests provide valuable information about different aspects of your blood and overall health. ', N'TC, DC, Hb, ESR,Combined', N'N/A', N'TC, DC, Hb, ESR,Combined', CAST(1000.00 AS Decimal(10, 2)), 17, CAST(900.00 AS Decimal(10, 2)), 17, NULL, NULL, CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), 2, NULL, NULL, 0, NULL, NULL, N'https://www.dgdagov.info/index.php/registered-products/allopathic')
GO
INSERT [dbo].[Configuration_Investigation] ([Id], [Code], [TestName], [TestDescription], [TestFullName], [TestShortName], [TestNameByDiagnosticCenter], [UnitPrice], [PriceUnitId], [NationalUnitPrice], [NationalPriceUnitId], [Speciality], [Comments], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [IsActive], [Specimen], [TestGenericName], [NationalPriceReference]) VALUES (11, N'00003', N'ESR', N'ESR stands for erythrocyte sedimentation rate, also known as a sed rate. It''s a blood test that indirectly measures inflammation in the body.', N'Erythrocyte Sedimentation Rate', N'ESR', N'ESR', CAST(800.00 AS Decimal(10, 2)), 17, CAST(800.00 AS Decimal(10, 2)), 17, NULL, NULL, CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), 2, NULL, NULL, 0, NULL, NULL, N'https://www.dgdagov.info/index.php/registered-products/allopathic')
GO
INSERT [dbo].[Configuration_Investigation] ([Id], [Code], [TestName], [TestDescription], [TestFullName], [TestShortName], [TestNameByDiagnosticCenter], [UnitPrice], [PriceUnitId], [NationalUnitPrice], [NationalPriceUnitId], [Speciality], [Comments], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [IsActive], [Specimen], [TestGenericName], [NationalPriceReference]) VALUES (12, N'00004', N'Haemoglobin', N'Haemoglobin (also spelled hemoglobin) is a protein in red blood cells that carries oxygen from the lungs to the rest of the body.', N'Haemoglobin', N'ESR', N'Haemoglobin', CAST(200.00 AS Decimal(10, 2)), 17, CAST(200.00 AS Decimal(10, 2)), 17, NULL, NULL, CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), 2, NULL, NULL, 0, NULL, NULL, N'https://www.dgdagov.info/index.php/registered-products/allopathic')
GO
INSERT [dbo].[Configuration_Investigation] ([Id], [Code], [TestName], [TestDescription], [TestFullName], [TestShortName], [TestNameByDiagnosticCenter], [UnitPrice], [PriceUnitId], [NationalUnitPrice], [NationalPriceUnitId], [Speciality], [Comments], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [IsActive], [Specimen], [TestGenericName], [NationalPriceReference]) VALUES (13, N'00005', N'Urine Routine Examination', N'A urine routine examination, also known as urinalysis or urine R/E, is a common test that analyzes the physical, chemical, and microscopic characteristics of urine to assess overall health and detect various conditions.', N'Urine Routine Examination', N'Urine RE', N'Urine Routine Examination', CAST(1200.00 AS Decimal(10, 2)), 17, CAST(1100.00 AS Decimal(10, 2)), 17, NULL, NULL, CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), 2, NULL, NULL, 0, NULL, NULL, N'https://www.dgdagov.info/index.php/registered-products/allopathic')
GO
INSERT [dbo].[Configuration_Investigation] ([Id], [Code], [TestName], [TestDescription], [TestFullName], [TestShortName], [TestNameByDiagnosticCenter], [UnitPrice], [PriceUnitId], [NationalUnitPrice], [NationalPriceUnitId], [Speciality], [Comments], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [IsActive], [Specimen], [TestGenericName], [NationalPriceReference]) VALUES (14, N'00006', N'Urine Culture', N'A urine culture is a laboratory test used to detect and identify bacteria or other microorganisms in a urine sample, typically to diagnose a urinary tract infection (UTI).', N'Urine Culture Sensitivity Test', N'Urine CS', N'Urine Culture', CAST(1200.00 AS Decimal(10, 2)), 17, CAST(1100.00 AS Decimal(10, 2)), 17, NULL, NULL, CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), 2, NULL, NULL, 0, NULL, NULL, N'https://www.dgdagov.info/index.php/registered-products/allopathic')
GO
INSERT [dbo].[Configuration_Investigation] ([Id], [Code], [TestName], [TestDescription], [TestFullName], [TestShortName], [TestNameByDiagnosticCenter], [UnitPrice], [PriceUnitId], [NationalUnitPrice], [NationalPriceUnitId], [Speciality], [Comments], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [IsActive], [Specimen], [TestGenericName], [NationalPriceReference]) VALUES (15, N'00007', N'Stool Routine Examination', N'A stool routine examination, also known as a stool R/E or stool analysis, is a diagnostic test that analyzes a stool sample to identify potential gastrointestinal issues. ', N'Stool Routine Examination', N'Stool RE', N'Stool Routine Examination', CAST(1200.00 AS Decimal(10, 2)), 17, CAST(1100.00 AS Decimal(10, 2)), 17, NULL, NULL, CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), 2, NULL, NULL, 0, NULL, NULL, N'https://www.dgdagov.info/index.php/registered-products/allopathic')
GO
SET IDENTITY_INSERT [dbo].[Configuration_Investigation] OFF
GO
SET IDENTITY_INSERT [dbo].[Configuration_InvestigationFAQ] ON 
GO
INSERT [dbo].[Configuration_InvestigationFAQ] ([Id], [InvestigationId], [Question], [Answer], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (1, 1, N'পরীক্ষাটি কি?', N'ইউরিন কালচার সেনসিটিভিটি টেস্ট প্রস্রাবের নমুনায় ব্যাকটেরিয়ার উপস্থিতি পরীক্ষা করে এবং কোন অ্যান্টিবায়োটিক সংক্রমণের চিকিৎসা করতে পারে তা নির্ধারণ করে।', CAST(N'2025-07-23T18:36:08.8400000' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_InvestigationFAQ] ([Id], [InvestigationId], [Question], [Answer], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (2, 1, N'পরীক্ষা কেন করা হয়?', N'এটি মূত্রনালীর সংক্রমণ (ইউটিআই) নির্ণয় করতে এবং উপযুক্ত অ্যান্টিবায়োটিক চিকিত্সার নির্দেশনা দেওয়ার জন্য করা হয়।', CAST(N'2025-07-23T18:36:08.8566667' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_InvestigationFAQ] ([Id], [InvestigationId], [Question], [Answer], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (3, 1, N'পরীক্ষার জন্য কেমন প্রস্তুতি লাগে?', N'সাধারণত, এই পরীক্ষার জন্য কোন বিশেষ প্রস্তুতির প্রয়োজন হয় না।', CAST(N'2025-07-23T18:36:08.8633333' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_InvestigationFAQ] ([Id], [InvestigationId], [Question], [Answer], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (4, 1, N'পরীক্ষা কেমন হয়?', N'আপনি ল্যাব দ্বারা প্রদত্ত একটি পাত্রে একটি প্রস্রাবের নমুনা প্রদান করেন।', CAST(N'2025-07-23T18:36:08.8700000' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_InvestigationFAQ] ([Id], [InvestigationId], [Question], [Answer], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (5, 1, N'পরীক্ষার ফলাফল থেকে কি বোঝা যায়?', N'ফলাফলটি সনাক্ত করে যে ব্যাকটেরিয়া সংক্রমণের কারণ এবং কোন অ্যান্টিবায়োটিকগুলি এর বিরুদ্ধে কার্যকর।', CAST(N'2025-07-23T18:36:08.8766667' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_InvestigationFAQ] ([Id], [InvestigationId], [Question], [Answer], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (6, 1, N'পরীক্ষার ফলাফল পেতে সাধারণত কেমন সময় লাগতে পারে?', N'পরীক্ষার ফলাফল পেতে কয়েকদিন সময় লাগতে পারে।', CAST(N'2025-07-23T18:36:08.8833333' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_InvestigationFAQ] ([Id], [InvestigationId], [Question], [Answer], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (7, 1, N'পরীক্ষায় কোন ঝুঁকি আছে কি?', N'সাধারণত একটি প্রস্রাব সংস্কৃতি সংবেদনশীলতা পরীক্ষার সাথে সম্পর্কিত কোন ঝুঁকি নেই।', CAST(N'2025-07-23T18:36:08.8900000' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_InvestigationFAQ] ([Id], [InvestigationId], [Question], [Answer], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (8, 1, N'এই পরীক্ষার সাথে আরো কি কি পরীক্ষা করতে হতে পারে?', N'ক্লিনিকাল পরিস্থিতির উপর ভিত্তি করে কিডনির কার্যকারিতা বা মূত্রাশয়ের ব্যাধিগুলির মতো অন্যান্য অবস্থার জন্য সম্পর্কিত তদন্তগুলি প্রস্রাব পরীক্ষা অন্তর্ভুক্ত করতে পারে।', CAST(N'2025-07-23T18:36:08.8966667' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_InvestigationFAQ] ([Id], [InvestigationId], [Question], [Answer], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (9, 10, N'পরীক্ষাটি কি?', N'ইউরিন কালচার সেনসিটিভিটি টেস্ট প্রস্রাবের নমুনায় ব্যাকটেরিয়ার উপস্থিতি পরীক্ষা করে এবং কোন অ্যান্টিবায়োটিক সংক্রমণের চিকিৎসা করতে পারে তা নির্ধারণ করে।', CAST(N'2025-07-23T18:36:31.3400000' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_InvestigationFAQ] ([Id], [InvestigationId], [Question], [Answer], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (10, 10, N'পরীক্ষা কেন করা হয়?', N'এটি মূত্রনালীর সংক্রমণ (ইউটিআই) নির্ণয় করতে এবং উপযুক্ত অ্যান্টিবায়োটিক চিকিত্সার নির্দেশনা দেওয়ার জন্য করা হয়।', CAST(N'2025-07-23T18:36:31.3533333' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_InvestigationFAQ] ([Id], [InvestigationId], [Question], [Answer], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (11, 10, N'পরীক্ষার জন্য কেমন প্রস্তুতি লাগে?', N'সাধারণত, এই পরীক্ষার জন্য কোন বিশেষ প্রস্তুতির প্রয়োজন হয় না।', CAST(N'2025-07-23T18:36:31.3600000' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_InvestigationFAQ] ([Id], [InvestigationId], [Question], [Answer], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (12, 10, N'পরীক্ষা কেমন হয়?', N'আপনি ল্যাব দ্বারা প্রদত্ত একটি পাত্রে একটি প্রস্রাবের নমুনা প্রদান করেন।', CAST(N'2025-07-23T18:36:31.3700000' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_InvestigationFAQ] ([Id], [InvestigationId], [Question], [Answer], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (13, 10, N'পরীক্ষার ফলাফল থেকে কি বোঝা যায়?', N'ফলাফলটি সনাক্ত করে যে ব্যাকটেরিয়া সংক্রমণের কারণ এবং কোন অ্যান্টিবায়োটিকগুলি এর বিরুদ্ধে কার্যকর।', CAST(N'2025-07-23T18:36:31.3766667' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_InvestigationFAQ] ([Id], [InvestigationId], [Question], [Answer], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (14, 10, N'পরীক্ষার ফলাফল পেতে সাধারণত কেমন সময় লাগতে পারে?', N'পরীক্ষার ফলাফল পেতে কয়েকদিন সময় লাগতে পারে।', CAST(N'2025-07-23T18:36:31.3833333' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_InvestigationFAQ] ([Id], [InvestigationId], [Question], [Answer], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (15, 10, N'পরীক্ষায় কোন ঝুঁকি আছে কি?', N'সাধারণত একটি প্রস্রাব সংস্কৃতি সংবেদনশীলতা পরীক্ষার সাথে সম্পর্কিত কোন ঝুঁকি নেই।', CAST(N'2025-07-23T18:36:31.3933333' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_InvestigationFAQ] ([Id], [InvestigationId], [Question], [Answer], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (16, 10, N'এই পরীক্ষার সাথে আরো কি কি পরীক্ষা করতে হতে পারে?', N'ক্লিনিকাল পরিস্থিতির উপর ভিত্তি করে কিডনির কার্যকারিতা বা মূত্রাশয়ের ব্যাধিগুলির মতো অন্যান্য অবস্থার জন্য সম্পর্কিত তদন্তগুলি প্রস্রাব পরীক্ষা অন্তর্ভুক্ত করতে পারে।', CAST(N'2025-07-23T18:36:31.4000000' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_InvestigationFAQ] ([Id], [InvestigationId], [Question], [Answer], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (17, 11, N'পরীক্ষাটি কি?', N'ইউরিন কালচার সেনসিটিভিটি টেস্ট প্রস্রাবের নমুনায় ব্যাকটেরিয়ার উপস্থিতি পরীক্ষা করে এবং কোন অ্যান্টিবায়োটিক সংক্রমণের চিকিৎসা করতে পারে তা নির্ধারণ করে।', CAST(N'2025-07-23T18:36:57.0633333' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_InvestigationFAQ] ([Id], [InvestigationId], [Question], [Answer], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (18, 11, N'পরীক্ষা কেন করা হয়?', N'এটি মূত্রনালীর সংক্রমণ (ইউটিআই) নির্ণয় করতে এবং উপযুক্ত অ্যান্টিবায়োটিক চিকিত্সার নির্দেশনা দেওয়ার জন্য করা হয়।', CAST(N'2025-07-23T18:36:57.0700000' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_InvestigationFAQ] ([Id], [InvestigationId], [Question], [Answer], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (19, 11, N'পরীক্ষার জন্য কেমন প্রস্তুতি লাগে?', N'সাধারণত, এই পরীক্ষার জন্য কোন বিশেষ প্রস্তুতির প্রয়োজন হয় না।', CAST(N'2025-07-23T18:36:57.0800000' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_InvestigationFAQ] ([Id], [InvestigationId], [Question], [Answer], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (20, 11, N'পরীক্ষা কেমন হয়?', N'আপনি ল্যাব দ্বারা প্রদত্ত একটি পাত্রে একটি প্রস্রাবের নমুনা প্রদান করেন।', CAST(N'2025-07-23T18:36:57.0866667' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_InvestigationFAQ] ([Id], [InvestigationId], [Question], [Answer], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (21, 11, N'পরীক্ষার ফলাফল থেকে কি বোঝা যায়?', N'ফলাফলটি সনাক্ত করে যে ব্যাকটেরিয়া সংক্রমণের কারণ এবং কোন অ্যান্টিবায়োটিকগুলি এর বিরুদ্ধে কার্যকর।', CAST(N'2025-07-23T18:36:57.0966667' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_InvestigationFAQ] ([Id], [InvestigationId], [Question], [Answer], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (22, 11, N'পরীক্ষার ফলাফল পেতে সাধারণত কেমন সময় লাগতে পারে?', N'পরীক্ষার ফলাফল পেতে কয়েকদিন সময় লাগতে পারে।', CAST(N'2025-07-23T18:36:57.1066667' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_InvestigationFAQ] ([Id], [InvestigationId], [Question], [Answer], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (23, 11, N'পরীক্ষায় কোন ঝুঁকি আছে কি?', N'সাধারণত একটি প্রস্রাব সংস্কৃতি সংবেদনশীলতা পরীক্ষার সাথে সম্পর্কিত কোন ঝুঁকি নেই।', CAST(N'2025-07-23T18:36:57.1166667' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_InvestigationFAQ] ([Id], [InvestigationId], [Question], [Answer], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (24, 11, N'এই পরীক্ষার সাথে আরো কি কি পরীক্ষা করতে হতে পারে?', N'ক্লিনিকাল পরিস্থিতির উপর ভিত্তি করে কিডনির কার্যকারিতা বা মূত্রাশয়ের ব্যাধিগুলির মতো অন্যান্য অবস্থার জন্য সম্পর্কিত তদন্তগুলি প্রস্রাব পরীক্ষা অন্তর্ভুক্ত করতে পারে।', CAST(N'2025-07-23T18:36:57.1233333' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_InvestigationFAQ] ([Id], [InvestigationId], [Question], [Answer], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (25, 12, N'পরীক্ষাটি কি?', N'ইউরিন কালচার সেনসিটিভিটি টেস্ট প্রস্রাবের নমুনায় ব্যাকটেরিয়ার উপস্থিতি পরীক্ষা করে এবং কোন অ্যান্টিবায়োটিক সংক্রমণের চিকিৎসা করতে পারে তা নির্ধারণ করে।', CAST(N'2025-07-23T18:37:20.4800000' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_InvestigationFAQ] ([Id], [InvestigationId], [Question], [Answer], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (26, 12, N'পরীক্ষা কেন করা হয়?', N'এটি মূত্রনালীর সংক্রমণ (ইউটিআই) নির্ণয় করতে এবং উপযুক্ত অ্যান্টিবায়োটিক চিকিত্সার নির্দেশনা দেওয়ার জন্য করা হয়।', CAST(N'2025-07-23T18:37:20.4900000' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_InvestigationFAQ] ([Id], [InvestigationId], [Question], [Answer], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (27, 12, N'পরীক্ষার জন্য কেমন প্রস্তুতি লাগে?', N'সাধারণত, এই পরীক্ষার জন্য কোন বিশেষ প্রস্তুতির প্রয়োজন হয় না।', CAST(N'2025-07-23T18:37:20.4966667' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_InvestigationFAQ] ([Id], [InvestigationId], [Question], [Answer], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (28, 12, N'পরীক্ষা কেমন হয়?', N'আপনি ল্যাব দ্বারা প্রদত্ত একটি পাত্রে একটি প্রস্রাবের নমুনা প্রদান করেন।', CAST(N'2025-07-23T18:37:20.5033333' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_InvestigationFAQ] ([Id], [InvestigationId], [Question], [Answer], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (29, 12, N'পরীক্ষার ফলাফল থেকে কি বোঝা যায়?', N'ফলাফলটি সনাক্ত করে যে ব্যাকটেরিয়া সংক্রমণের কারণ এবং কোন অ্যান্টিবায়োটিকগুলি এর বিরুদ্ধে কার্যকর।', CAST(N'2025-07-23T18:37:20.5066667' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_InvestigationFAQ] ([Id], [InvestigationId], [Question], [Answer], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (30, 12, N'পরীক্ষার ফলাফল পেতে সাধারণত কেমন সময় লাগতে পারে?', N'পরীক্ষার ফলাফল পেতে কয়েকদিন সময় লাগতে পারে।', CAST(N'2025-07-23T18:37:20.5100000' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_InvestigationFAQ] ([Id], [InvestigationId], [Question], [Answer], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (31, 12, N'পরীক্ষায় কোন ঝুঁকি আছে কি?', N'সাধারণত একটি প্রস্রাব সংস্কৃতি সংবেদনশীলতা পরীক্ষার সাথে সম্পর্কিত কোন ঝুঁকি নেই।', CAST(N'2025-07-23T18:37:20.5200000' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_InvestigationFAQ] ([Id], [InvestigationId], [Question], [Answer], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (32, 12, N'এই পরীক্ষার সাথে আরো কি কি পরীক্ষা করতে হতে পারে?', N'ক্লিনিকাল পরিস্থিতির উপর ভিত্তি করে কিডনির কার্যকারিতা বা মূত্রাশয়ের ব্যাধিগুলির মতো অন্যান্য অবস্থার জন্য সম্পর্কিত তদন্তগুলি প্রস্রাব পরীক্ষা অন্তর্ভুক্ত করতে পারে।', CAST(N'2025-07-23T18:37:20.5233333' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_InvestigationFAQ] ([Id], [InvestigationId], [Question], [Answer], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (33, 13, N'পরীক্ষাটি কি?', N'ইউরিন কালচার সেনসিটিভিটি টেস্ট প্রস্রাবের নমুনায় ব্যাকটেরিয়ার উপস্থিতি পরীক্ষা করে এবং কোন অ্যান্টিবায়োটিক সংক্রমণের চিকিৎসা করতে পারে তা নির্ধারণ করে।', CAST(N'2025-07-23T18:37:44.2933333' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_InvestigationFAQ] ([Id], [InvestigationId], [Question], [Answer], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (34, 13, N'পরীক্ষা কেন করা হয়?', N'এটি মূত্রনালীর সংক্রমণ (ইউটিআই) নির্ণয় করতে এবং উপযুক্ত অ্যান্টিবায়োটিক চিকিত্সার নির্দেশনা দেওয়ার জন্য করা হয়।', CAST(N'2025-07-23T18:37:44.3033333' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_InvestigationFAQ] ([Id], [InvestigationId], [Question], [Answer], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (35, 13, N'পরীক্ষার জন্য কেমন প্রস্তুতি লাগে?', N'সাধারণত, এই পরীক্ষার জন্য কোন বিশেষ প্রস্তুতির প্রয়োজন হয় না।', CAST(N'2025-07-23T18:37:44.3100000' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_InvestigationFAQ] ([Id], [InvestigationId], [Question], [Answer], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (36, 13, N'পরীক্ষা কেমন হয়?', N'আপনি ল্যাব দ্বারা প্রদত্ত একটি পাত্রে একটি প্রস্রাবের নমুনা প্রদান করেন।', CAST(N'2025-07-23T18:37:44.3133333' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_InvestigationFAQ] ([Id], [InvestigationId], [Question], [Answer], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (37, 13, N'পরীক্ষার ফলাফল থেকে কি বোঝা যায়?', N'ফলাফলটি সনাক্ত করে যে ব্যাকটেরিয়া সংক্রমণের কারণ এবং কোন অ্যান্টিবায়োটিকগুলি এর বিরুদ্ধে কার্যকর।', CAST(N'2025-07-23T18:37:44.3166667' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_InvestigationFAQ] ([Id], [InvestigationId], [Question], [Answer], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (38, 13, N'পরীক্ষার ফলাফল পেতে সাধারণত কেমন সময় লাগতে পারে?', N'পরীক্ষার ফলাফল পেতে কয়েকদিন সময় লাগতে পারে।', CAST(N'2025-07-23T18:37:44.3233333' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_InvestigationFAQ] ([Id], [InvestigationId], [Question], [Answer], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (39, 13, N'পরীক্ষায় কোন ঝুঁকি আছে কি?', N'সাধারণত একটি প্রস্রাব সংস্কৃতি সংবেদনশীলতা পরীক্ষার সাথে সম্পর্কিত কোন ঝুঁকি নেই।', CAST(N'2025-07-23T18:37:44.3266667' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_InvestigationFAQ] ([Id], [InvestigationId], [Question], [Answer], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (40, 13, N'এই পরীক্ষার সাথে আরো কি কি পরীক্ষা করতে হতে পারে?', N'ক্লিনিকাল পরিস্থিতির উপর ভিত্তি করে কিডনির কার্যকারিতা বা মূত্রাশয়ের ব্যাধিগুলির মতো অন্যান্য অবস্থার জন্য সম্পর্কিত তদন্তগুলি প্রস্রাব পরীক্ষা অন্তর্ভুক্ত করতে পারে।', CAST(N'2025-07-23T18:37:44.3300000' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_InvestigationFAQ] ([Id], [InvestigationId], [Question], [Answer], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (41, 14, N'পরীক্ষাটি কি?', N'ইউরিন কালচার সেনসিটিভিটি টেস্ট প্রস্রাবের নমুনায় ব্যাকটেরিয়ার উপস্থিতি পরীক্ষা করে এবং কোন অ্যান্টিবায়োটিক সংক্রমণের চিকিৎসা করতে পারে তা নির্ধারণ করে।', CAST(N'2025-07-23T18:38:07.6066667' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_InvestigationFAQ] ([Id], [InvestigationId], [Question], [Answer], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (42, 14, N'পরীক্ষা কেন করা হয়?', N'এটি মূত্রনালীর সংক্রমণ (ইউটিআই) নির্ণয় করতে এবং উপযুক্ত অ্যান্টিবায়োটিক চিকিত্সার নির্দেশনা দেওয়ার জন্য করা হয়।', CAST(N'2025-07-23T18:38:07.6166667' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_InvestigationFAQ] ([Id], [InvestigationId], [Question], [Answer], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (43, 14, N'পরীক্ষার জন্য কেমন প্রস্তুতি লাগে?', N'সাধারণত, এই পরীক্ষার জন্য কোন বিশেষ প্রস্তুতির প্রয়োজন হয় না।', CAST(N'2025-07-23T18:38:07.6233333' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_InvestigationFAQ] ([Id], [InvestigationId], [Question], [Answer], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (44, 14, N'পরীক্ষা কেমন হয়?', N'আপনি ল্যাব দ্বারা প্রদত্ত একটি পাত্রে একটি প্রস্রাবের নমুনা প্রদান করেন।', CAST(N'2025-07-23T18:38:07.6300000' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_InvestigationFAQ] ([Id], [InvestigationId], [Question], [Answer], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (45, 14, N'পরীক্ষার ফলাফল থেকে কি বোঝা যায়?', N'ফলাফলটি সনাক্ত করে যে ব্যাকটেরিয়া সংক্রমণের কারণ এবং কোন অ্যান্টিবায়োটিকগুলি এর বিরুদ্ধে কার্যকর।', CAST(N'2025-07-23T18:38:07.6333333' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_InvestigationFAQ] ([Id], [InvestigationId], [Question], [Answer], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (46, 14, N'পরীক্ষার ফলাফল পেতে সাধারণত কেমন সময় লাগতে পারে?', N'পরীক্ষার ফলাফল পেতে কয়েকদিন সময় লাগতে পারে।', CAST(N'2025-07-23T18:38:07.6400000' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_InvestigationFAQ] ([Id], [InvestigationId], [Question], [Answer], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (47, 14, N'পরীক্ষায় কোন ঝুঁকি আছে কি?', N'সাধারণত একটি প্রস্রাব সংস্কৃতি সংবেদনশীলতা পরীক্ষার সাথে সম্পর্কিত কোন ঝুঁকি নেই।', CAST(N'2025-07-23T18:38:07.6433333' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_InvestigationFAQ] ([Id], [InvestigationId], [Question], [Answer], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (48, 14, N'এই পরীক্ষার সাথে আরো কি কি পরীক্ষা করতে হতে পারে?', N'ক্লিনিকাল পরিস্থিতির উপর ভিত্তি করে কিডনির কার্যকারিতা বা মূত্রাশয়ের ব্যাধিগুলির মতো অন্যান্য অবস্থার জন্য সম্পর্কিত তদন্তগুলি প্রস্রাব পরীক্ষা অন্তর্ভুক্ত করতে পারে।', CAST(N'2025-07-23T18:38:07.6500000' AS DateTime2), 2, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Configuration_InvestigationFAQ] OFF
GO
SET IDENTITY_INSERT [dbo].[Configuration_Medicine] ON 
GO
INSERT [dbo].[Configuration_Medicine] ([Id], [BrandId], [Type], [Slug], [DosageFormId], [GenericId], [Strength], [MeasurementUnitId], [UnitPrice], [PriceInUnitId], [PackageType], [PackageSize], [PackageQuantity], [DAR], [Indication], [Pharmacology], [DoseDescription], [Administration], [Contradiction], [SideEffects], [PrecautionsAndWarnings], [PregnencyAndLactation], [ModeOfAction], [Interaction], [OverdoseEffects], [TherapeuticClass], [StorageCondition], [UserFor], [IsActive], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Name], [CompanyDiscountPercentage]) VALUES (9, 2, N'Allopathic', N'tivizidtablet300-mg150-mg300-mg', 3, 5, N'300 mg', 19, CAST(140.53 AS Decimal(5, 2)), 17, N'PackAGE', N'10', N'10', N'334-0009-064', NULL, NULL, NULL, NULL, NULL, NULL, N'Keep in cold places', NULL, NULL, NULL, NULL, NULL, N'In cold place', N'Human', 1, CAST(N'2025-06-15T02:04:14.6033333' AS DateTime2), 2, NULL, NULL, N'Technofen', NULL)
GO
INSERT [dbo].[Configuration_Medicine] ([Id], [BrandId], [Type], [Slug], [DosageFormId], [GenericId], [Strength], [MeasurementUnitId], [UnitPrice], [PriceInUnitId], [PackageType], [PackageSize], [PackageQuantity], [DAR], [Indication], [Pharmacology], [DoseDescription], [Administration], [Contradiction], [SideEffects], [PrecautionsAndWarnings], [PregnencyAndLactation], [ModeOfAction], [Interaction], [OverdoseEffects], [TherapeuticClass], [StorageCondition], [UserFor], [IsActive], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Name], [CompanyDiscountPercentage]) VALUES (10, 3, N'Allopathic', N'tivizidtablet300-mg150-mg300-mg', 2, 5, N'200 mg', 19, CAST(140.53 AS Decimal(5, 2)), 17, N'PackAGE', N'10', N'10', N'143-0415-007', NULL, NULL, N'Suspension', NULL, NULL, NULL, N'Take with warm water', NULL, NULL, NULL, NULL, NULL, N'In cold place', N'Human', 1, CAST(N'2025-06-15T02:08:56.9266667' AS DateTime2), 2, NULL, NULL, N'Viscotin 200', NULL)
GO
INSERT [dbo].[Configuration_Medicine] ([Id], [BrandId], [Type], [Slug], [DosageFormId], [GenericId], [Strength], [MeasurementUnitId], [UnitPrice], [PriceInUnitId], [PackageType], [PackageSize], [PackageQuantity], [DAR], [Indication], [Pharmacology], [DoseDescription], [Administration], [Contradiction], [SideEffects], [PrecautionsAndWarnings], [PregnencyAndLactation], [ModeOfAction], [Interaction], [OverdoseEffects], [TherapeuticClass], [StorageCondition], [UserFor], [IsActive], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Name], [CompanyDiscountPercentage]) VALUES (16, 10, N'Allopathic', NULL, 2, 2, N'150 mg', 19, CAST(5.00 AS Decimal(5, 2)), 17, N'Package', N'5', N'50', N'341-0560-010', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Human', 1, CAST(N'2025-06-23T00:00:00.0000000' AS DateTime2), 2, NULL, NULL, N'Abenix 150', NULL)
GO
INSERT [dbo].[Configuration_Medicine] ([Id], [BrandId], [Type], [Slug], [DosageFormId], [GenericId], [Strength], [MeasurementUnitId], [UnitPrice], [PriceInUnitId], [PackageType], [PackageSize], [PackageQuantity], [DAR], [Indication], [Pharmacology], [DoseDescription], [Administration], [Contradiction], [SideEffects], [PrecautionsAndWarnings], [PregnencyAndLactation], [ModeOfAction], [Interaction], [OverdoseEffects], [TherapeuticClass], [StorageCondition], [UserFor], [IsActive], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Name], [CompanyDiscountPercentage]) VALUES (18, 11, N'Allopathic', NULL, 2, 2, N'200mg', 19, CAST(7.00 AS Decimal(5, 2)), 17, N'Package', N'10', N'100', N'341-0561-010', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Human', 1, CAST(N'2025-06-23T00:00:00.0000000' AS DateTime2), 2, NULL, NULL, N'Abenix 200', NULL)
GO
INSERT [dbo].[Configuration_Medicine] ([Id], [BrandId], [Type], [Slug], [DosageFormId], [GenericId], [Strength], [MeasurementUnitId], [UnitPrice], [PriceInUnitId], [PackageType], [PackageSize], [PackageQuantity], [DAR], [Indication], [Pharmacology], [DoseDescription], [Administration], [Contradiction], [SideEffects], [PrecautionsAndWarnings], [PregnencyAndLactation], [ModeOfAction], [Interaction], [OverdoseEffects], [TherapeuticClass], [StorageCondition], [UserFor], [IsActive], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Name], [CompanyDiscountPercentage]) VALUES (20, 12, N'Allopathic', NULL, 2, 2, N'200 mg', 19, CAST(6.00 AS Decimal(5, 2)), 17, N'Package', N'10', N'100', N'387-0118-010', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Human', 1, CAST(N'2025-06-23T00:00:00.0000000' AS DateTime2), 2, NULL, NULL, N'Abeclib 200', NULL)
GO
INSERT [dbo].[Configuration_Medicine] ([Id], [BrandId], [Type], [Slug], [DosageFormId], [GenericId], [Strength], [MeasurementUnitId], [UnitPrice], [PriceInUnitId], [PackageType], [PackageSize], [PackageQuantity], [DAR], [Indication], [Pharmacology], [DoseDescription], [Administration], [Contradiction], [SideEffects], [PrecautionsAndWarnings], [PregnencyAndLactation], [ModeOfAction], [Interaction], [OverdoseEffects], [TherapeuticClass], [StorageCondition], [UserFor], [IsActive], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Name], [CompanyDiscountPercentage]) VALUES (21, 13, N'Allopathic', NULL, 2, 2, N'150mg', 19, CAST(4.00 AS Decimal(5, 2)), 17, N'Package', N'10', N'100', N'387-0118-010', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Human', 1, CAST(N'2025-06-23T00:00:00.0000000' AS DateTime2), 2, NULL, NULL, N'Abeclib 150', NULL)
GO
SET IDENTITY_INSERT [dbo].[Configuration_Medicine] OFF
GO
SET IDENTITY_INSERT [dbo].[Configuration_MedicineBrand] ON 
GO
INSERT [dbo].[Configuration_MedicineBrand] ([Id], [ManufacturerId], [BrandCode], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [BrandPublicId]) VALUES (1, 1, N'00001', N'Acedol', N'', CAST(N'2025-06-15T01:21:17.5100000' AS DateTime2), 2, NULL, NULL, 15)
GO
INSERT [dbo].[Configuration_MedicineBrand] ([Id], [ManufacturerId], [BrandCode], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [BrandPublicId]) VALUES (2, 2, N'00002', N'Technofen', N'', CAST(N'2025-06-15T01:21:17.5333333' AS DateTime2), 2, NULL, NULL, 17398)
GO
INSERT [dbo].[Configuration_MedicineBrand] ([Id], [ManufacturerId], [BrandCode], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [BrandPublicId]) VALUES (3, 3, N'00003', N'Viscotin 200', N'', CAST(N'2025-06-15T01:21:17.5333333' AS DateTime2), 2, NULL, NULL, 15)
GO
INSERT [dbo].[Configuration_MedicineBrand] ([Id], [ManufacturerId], [BrandCode], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [BrandPublicId]) VALUES (4, 1, N'00004', N'Novirax-400', N'', CAST(N'2025-06-15T01:21:17.5366667' AS DateTime2), 2, NULL, NULL, 15)
GO
INSERT [dbo].[Configuration_MedicineBrand] ([Id], [ManufacturerId], [BrandCode], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [BrandPublicId]) VALUES (5, 2, N'00005', N'Virux', N'', CAST(N'2025-06-15T01:21:17.5366667' AS DateTime2), 2, NULL, NULL, 15)
GO
INSERT [dbo].[Configuration_MedicineBrand] ([Id], [ManufacturerId], [BrandCode], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [BrandPublicId]) VALUES (6, 2, N'00006', N'Napa EXTRA', N'', CAST(N'2025-06-15T02:11:06.0966667' AS DateTime2), 2, NULL, NULL, 15)
GO
INSERT [dbo].[Configuration_MedicineBrand] ([Id], [ManufacturerId], [BrandCode], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [BrandPublicId]) VALUES (7, 2, N'00007', N'Antacyd', N'', CAST(N'2025-06-15T02:11:26.5966667' AS DateTime2), 2, NULL, NULL, 15)
GO
INSERT [dbo].[Configuration_MedicineBrand] ([Id], [ManufacturerId], [BrandCode], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [BrandPublicId]) VALUES (10, 14, N'00008', N'Abenix 150', NULL, CAST(N'2025-06-15T02:11:26.5966667' AS DateTime2), NULL, NULL, NULL, 5022)
GO
INSERT [dbo].[Configuration_MedicineBrand] ([Id], [ManufacturerId], [BrandCode], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [BrandPublicId]) VALUES (11, 14, N'00009', N'Abenix 200', NULL, CAST(N'2025-06-15T02:11:26.5966667' AS DateTime2), NULL, NULL, NULL, 5023)
GO
INSERT [dbo].[Configuration_MedicineBrand] ([Id], [ManufacturerId], [BrandCode], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [BrandPublicId]) VALUES (12, 6, N'00010', N'Abeclib 200', NULL, CAST(N'2025-06-15T02:11:26.5966667' AS DateTime2), NULL, NULL, NULL, 10978)
GO
INSERT [dbo].[Configuration_MedicineBrand] ([Id], [ManufacturerId], [BrandCode], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [BrandPublicId]) VALUES (13, 6, N'00011', N'Abeclib 150', NULL, CAST(N'2025-06-15T02:11:26.5966667' AS DateTime2), NULL, NULL, NULL, 10987)
GO
INSERT [dbo].[Configuration_MedicineBrand] ([Id], [ManufacturerId], [BrandCode], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [BrandPublicId]) VALUES (14, 6, N'00012', N'Abezino 150', NULL, CAST(N'2025-06-15T02:11:26.5966667' AS DateTime2), NULL, NULL, NULL, 15315)
GO
INSERT [dbo].[Configuration_MedicineBrand] ([Id], [ManufacturerId], [BrandCode], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [BrandPublicId]) VALUES (15, 6, N'00013', N'Abezino 200', NULL, CAST(N'2025-06-15T02:11:26.5966667' AS DateTime2), NULL, NULL, NULL, 15316)
GO
SET IDENTITY_INSERT [dbo].[Configuration_MedicineBrand] OFF
GO
SET IDENTITY_INSERT [dbo].[Configuration_MedicineDosageForm] ON 
GO
INSERT [dbo].[Configuration_MedicineDosageForm] ([Id], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [ShortForm]) VALUES (2, N'Tablet', NULL, CAST(N'2025-06-15T00:34:16.2600000' AS DateTime2), 2, NULL, NULL, N'Tab')
GO
INSERT [dbo].[Configuration_MedicineDosageForm] ([Id], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [ShortForm]) VALUES (3, N'Syrup', NULL, CAST(N'2025-06-15T00:34:16.2800000' AS DateTime2), 2, NULL, NULL, N'Syr')
GO
INSERT [dbo].[Configuration_MedicineDosageForm] ([Id], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [ShortForm]) VALUES (4, N'Injection', NULL, CAST(N'2025-06-15T00:34:16.2800000' AS DateTime2), 2, NULL, NULL, N'Inj')
GO
INSERT [dbo].[Configuration_MedicineDosageForm] ([Id], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [ShortForm]) VALUES (5, N'Capsule', NULL, CAST(N'2025-06-15T00:34:16.2800000' AS DateTime2), 2, NULL, NULL, N'Cap')
GO
INSERT [dbo].[Configuration_MedicineDosageForm] ([Id], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [ShortForm]) VALUES (6, N'Tablet (Sustained Release)', NULL, CAST(N'2025-06-15T00:34:16.2800000' AS DateTime2), 2, NULL, NULL, N'Tab SR
')
GO
INSERT [dbo].[Configuration_MedicineDosageForm] ([Id], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [ShortForm]) VALUES (7, N'Scalp Solution', NULL, CAST(N'2025-06-15T00:34:16.2800000' AS DateTime2), 2, NULL, NULL, N'Sc Sol
')
GO
INSERT [dbo].[Configuration_MedicineDosageForm] ([Id], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [ShortForm]) VALUES (8, N'Chewable Tablet', NULL, CAST(N'2025-06-15T00:34:16.2800000' AS DateTime2), 2, NULL, NULL, N'Tab Chew
')
GO
INSERT [dbo].[Configuration_MedicineDosageForm] ([Id], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [ShortForm]) VALUES (9, N'Oral Powder', NULL, CAST(N'2025-06-15T00:34:16.2800000' AS DateTime2), 2, NULL, NULL, N'Oral Pow
')
GO
INSERT [dbo].[Configuration_MedicineDosageForm] ([Id], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [ShortForm]) VALUES (10, N'Oral Suspension', NULL, CAST(N'2025-06-15T00:34:16.2800000' AS DateTime2), 2, NULL, NULL, N'Oral Susp
')
GO
INSERT [dbo].[Configuration_MedicineDosageForm] ([Id], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [ShortForm]) VALUES (11, N'Ointment', NULL, CAST(N'2025-06-15T00:34:16.2800000' AS DateTime2), 2, NULL, NULL, N'Oint
')
GO
INSERT [dbo].[Configuration_MedicineDosageForm] ([Id], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [ShortForm]) VALUES (12, N'Effervescent Powder', NULL, CAST(N'2025-06-15T00:34:16.2800000' AS DateTime2), 2, NULL, NULL, N'Eff Pow
')
GO
INSERT [dbo].[Configuration_MedicineDosageForm] ([Id], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [ShortForm]) VALUES (13, N'Powder for Suspension', NULL, CAST(N'2025-06-15T00:34:16.2800000' AS DateTime2), 2, NULL, NULL, N'Pow Susp
')
GO
INSERT [dbo].[Configuration_MedicineDosageForm] ([Id], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [ShortForm]) VALUES (14, N'Effervescent Granules', NULL, CAST(N'2025-06-15T00:34:16.2800000' AS DateTime2), 2, NULL, NULL, N'Eff Gran
')
GO
INSERT [dbo].[Configuration_MedicineDosageForm] ([Id], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [ShortForm]) VALUES (15, N'Liquid', NULL, CAST(N'2025-06-15T00:34:16.2800000' AS DateTime2), 2, NULL, NULL, N'Liq
')
GO
INSERT [dbo].[Configuration_MedicineDosageForm] ([Id], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [ShortForm]) VALUES (16, N'Muscle Rub', NULL, CAST(N'2025-06-15T00:34:16.2800000' AS DateTime2), 2, NULL, NULL, N'Mus Rub
')
GO
INSERT [dbo].[Configuration_MedicineDosageForm] ([Id], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [ShortForm]) VALUES (17, N'Cream', NULL, CAST(N'2025-06-15T00:34:16.2800000' AS DateTime2), 2, NULL, NULL, N'Crm
')
GO
INSERT [dbo].[Configuration_MedicineDosageForm] ([Id], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [ShortForm]) VALUES (18, N'Dialysis Solution', NULL, CAST(N'2025-06-15T00:34:16.2800000' AS DateTime2), 2, NULL, NULL, N'Dial Sol
')
GO
INSERT [dbo].[Configuration_MedicineDosageForm] ([Id], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [ShortForm]) VALUES (19, N'Dispersible Tablet', NULL, CAST(N'2025-06-15T00:34:16.2800000' AS DateTime2), 2, NULL, NULL, N'Tab Disp
')
GO
INSERT [dbo].[Configuration_MedicineDosageForm] ([Id], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [ShortForm]) VALUES (20, N'Effervescent Tablet', NULL, CAST(N'2025-06-15T00:34:16.2800000' AS DateTime2), 2, NULL, NULL, N'Tab Eff
')
GO
INSERT [dbo].[Configuration_MedicineDosageForm] ([Id], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [ShortForm]) VALUES (21, N'IV Infusion', NULL, CAST(N'2025-06-15T00:34:16.2800000' AS DateTime2), 2, NULL, NULL, N'IV Inf
')
GO
INSERT [dbo].[Configuration_MedicineDosageForm] ([Id], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [ShortForm]) VALUES (22, N'Ophthalmic Ointment', NULL, CAST(N'2025-06-15T00:34:16.2800000' AS DateTime2), 2, NULL, NULL, N'Oph Oint
')
GO
INSERT [dbo].[Configuration_MedicineDosageForm] ([Id], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [ShortForm]) VALUES (23, N'SC Injection', NULL, CAST(N'2025-06-15T00:34:16.2800000' AS DateTime2), 2, NULL, NULL, N'SC Inj
')
GO
INSERT [dbo].[Configuration_MedicineDosageForm] ([Id], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [ShortForm]) VALUES (24, N'Gel', NULL, CAST(N'2025-06-15T00:34:16.2800000' AS DateTime2), 2, NULL, NULL, N'Gel')
GO
INSERT [dbo].[Configuration_MedicineDosageForm] ([Id], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [ShortForm]) VALUES (25, N'Topical Gel', NULL, CAST(N'2025-06-15T00:34:16.2800000' AS DateTime2), 2, NULL, NULL, N'Top Gel
')
GO
INSERT [dbo].[Configuration_MedicineDosageForm] ([Id], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [ShortForm]) VALUES (26, N'Retard Tablet', NULL, CAST(N'2025-06-15T00:34:16.2800000' AS DateTime2), 2, NULL, NULL, N'Tab Ret
')
GO
INSERT [dbo].[Configuration_MedicineDosageForm] ([Id], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [ShortForm]) VALUES (27, N'Tablet (Extended Release)', NULL, CAST(N'2025-06-15T00:34:16.2800000' AS DateTime2), 2, NULL, NULL, N'Tab ER
')
GO
INSERT [dbo].[Configuration_MedicineDosageForm] ([Id], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [ShortForm]) VALUES (28, N'Topical Solution', NULL, CAST(N'2025-06-15T00:34:16.2800000' AS DateTime2), 2, NULL, NULL, N'Top Sol
')
GO
INSERT [dbo].[Configuration_MedicineDosageForm] ([Id], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [ShortForm]) VALUES (29, N'Topical Spray', NULL, CAST(N'2025-06-15T00:34:16.2800000' AS DateTime2), 2, NULL, NULL, N'Top Spray
')
GO
INSERT [dbo].[Configuration_MedicineDosageForm] ([Id], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [ShortForm]) VALUES (30, N'Pediatric Drops', NULL, CAST(N'2025-06-15T00:34:16.2800000' AS DateTime2), 2, NULL, NULL, N'Ped Drops
')
GO
INSERT [dbo].[Configuration_MedicineDosageForm] ([Id], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [ShortForm]) VALUES (31, N'IM/IV Injection', NULL, CAST(N'2025-06-15T00:34:16.2800000' AS DateTime2), 2, NULL, NULL, N'IM/IV Inj
')
GO
INSERT [dbo].[Configuration_MedicineDosageForm] ([Id], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [ShortForm]) VALUES (32, N'Oral Paste', NULL, CAST(N'2025-06-15T00:34:16.2800000' AS DateTime2), 2, NULL, NULL, N'Oral Paste
')
GO
INSERT [dbo].[Configuration_MedicineDosageForm] ([Id], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [ShortForm]) VALUES (33, N'Nail Lacquer', NULL, CAST(N'2025-06-15T00:34:16.2800000' AS DateTime2), 2, NULL, NULL, N'Nail Lacq
')
GO
INSERT [dbo].[Configuration_MedicineDosageForm] ([Id], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [ShortForm]) VALUES (34, N'IV Injection', NULL, CAST(N'2025-06-15T00:34:16.2800000' AS DateTime2), 2, NULL, NULL, N'IV Inj
')
GO
INSERT [dbo].[Configuration_MedicineDosageForm] ([Id], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [ShortForm]) VALUES (35, N'Ophthalmic Solution', NULL, CAST(N'2025-06-15T00:34:16.2800000' AS DateTime2), 2, NULL, NULL, N'Oph Sol
')
GO
INSERT [dbo].[Configuration_MedicineDosageForm] ([Id], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [ShortForm]) VALUES (36, N'Nebuliser Solution', NULL, CAST(N'2025-06-15T00:34:16.2800000' AS DateTime2), 2, NULL, NULL, N'Neb Sol
')
GO
INSERT [dbo].[Configuration_MedicineDosageForm] ([Id], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [ShortForm]) VALUES (37, N'Tablet (Enteric Coated)', NULL, CAST(N'2025-06-15T00:34:16.2800000' AS DateTime2), 2, NULL, NULL, N'Tab EC
')
GO
INSERT [dbo].[Configuration_MedicineDosageForm] ([Id], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [ShortForm]) VALUES (38, N'Capsule (Extended Release)', NULL, CAST(N'2025-06-15T00:34:16.2800000' AS DateTime2), 2, NULL, NULL, N'Cap ER
')
GO
INSERT [dbo].[Configuration_MedicineDosageForm] ([Id], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [ShortForm]) VALUES (39, N'Nasal Spray', NULL, CAST(N'2025-06-15T00:34:16.2800000' AS DateTime2), 2, NULL, NULL, N'Nas Spray
')
GO
SET IDENTITY_INSERT [dbo].[Configuration_MedicineDosageForm] OFF
GO
SET IDENTITY_INSERT [dbo].[Configuration_MedicineFAQ] ON 
GO
INSERT [dbo].[Configuration_MedicineFAQ] ([Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Question], [Answer], [MedicineId]) VALUES (1, CAST(N'2025-06-24T15:59:59.1600000' AS DateTime2), 2, NULL, NULL, N'ওষুধটির কি কি পাশ্ব প্রতিক্রিয়া আছে?', N'উদরাময়, বদহজম অথবা চামড়ায় ফুসকুড়ি হতে পারে।', 9)
GO
INSERT [dbo].[Configuration_MedicineFAQ] ([Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Question], [Answer], [MedicineId]) VALUES (2, CAST(N'2025-06-24T15:59:59.1700000' AS DateTime2), 2, NULL, NULL, N'ওষুধটি ব্যবহারে বিশেষ যে সতর্কতা অবলম্বন করতে হবে?', N' বৃক্কের অকার্যকারিতার ক্ষেত্রে শরীর থেকে এন্টিবায়োটিক নির্গমণ বিলম্বিত হয় বলে ঔষধটির দৈনিক মাত্রা কমানোর প্রয়োজন হতে পারে।', 9)
GO
INSERT [dbo].[Configuration_MedicineFAQ] ([Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Question], [Answer], [MedicineId]) VALUES (3, CAST(N'2025-06-24T15:59:59.1766667' AS DateTime2), 2, NULL, NULL, N'ওষুধটির সাথে অন্য ওষুধের কি পাশ্ব প্রতিক্রিয়া আছে?', N'প্রাবেনিসিড। 
', 9)
GO
INSERT [dbo].[Configuration_MedicineFAQ] ([Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Question], [Answer], [MedicineId]) VALUES (4, CAST(N'2025-06-24T15:59:59.1800000' AS DateTime2), 2, NULL, NULL, N'ওষুধটির একটি ডোজ বাদ গেলে কি করবেন?', N'ওষুধটি নির্ধারিত সময়ে নিতে ভুলে গেলে মনে পড়ার সাথে সাথে গ্রহণ করতে হবে।  তবে পরবর্তী নির্ধারিত ডোজ গ্রহণের সময় হয়ে গেলে ভুলে যাওয়া ডোজ গ্রহণ করা যাবে না। ওষুধটি ডাবল ডোজ নেয়া যাবে না।
', 9)
GO
INSERT [dbo].[Configuration_MedicineFAQ] ([Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Question], [Answer], [MedicineId]) VALUES (5, CAST(N'2025-06-24T15:59:59.1866667' AS DateTime2), 2, NULL, NULL, N'ওষুধটি সংক্ষণের উপায়', N'হালকা থেকে সুরক্ষিত একটি শীতল ও শুকনো জায়গায় সঞ্চয় করুন। অ্যামোক্সিসিলিন সাসপেনশন এবং ড্রপগুলি তাজা প্রস্তুত করা উচিত, একটি শীতল শুকনো স্থানে একটি ফ্রিজে সংরক্ষণ করা উচিত। পুনর্গঠিত স্থগিতাদেশ এবং ড্রপগুলি ঘরের তাপমাত্রায় রাখলে 5 দিনের মধ্যে বা ফ্রিজে রাখলে 7 দিনের মধ্যে ব্যবহার করতে হবে।', 9)
GO
INSERT [dbo].[Configuration_MedicineFAQ] ([Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Question], [Answer], [MedicineId]) VALUES (6, CAST(N'2025-06-24T15:59:59.1900000' AS DateTime2), 2, NULL, NULL, N'ওষুধটির সক্রিয় উপাদানগুলি কি?', N'এটি একটি অ্যামিনো-পেনিসিলিন, অ্যান্টিমাইক্রোবিয়াল প্রতিরোধের জন্য পেনিসিলিনের সাথে একটি অতিরিক্ত অ্যামিনো গ্রুপ যোগ করে তৈরি করা হয়।', 9)
GO
INSERT [dbo].[Configuration_MedicineFAQ] ([Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Question], [Answer], [MedicineId]) VALUES (7, CAST(N'2025-06-24T15:59:59.1933333' AS DateTime2), 2, NULL, NULL, N'ওষুধটি অন্য কি নামে পরিচিত?
', N'দয়া করে বিকল্প তালিকা চেক করুন - লিঙ্কে ক্লিক করুন
', 9)
GO
INSERT [dbo].[Configuration_MedicineFAQ] ([Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Question], [Answer], [MedicineId]) VALUES (8, CAST(N'2025-06-24T15:59:59.2000000' AS DateTime2), 2, NULL, NULL, N'ওষুধটি কোন উদ্দেশ্যে ব্যবহার করা হয়?', N'নাক-কান-গলা এর সংক্রমণ, যৌন ও মূত্রনালীর সংক্রমণ, ত্বক ও ত্বকের কাঠামাের সংক্রমণ, নিম্ন শ্বাসনালীর সংক্রমণ, গনােরিয়া এবং দাঁতের অস্ত্রোপচার এর পরবর্তীতে এন্ডােকার্ডিয়ামের প্রদাহের প্রতিরােধে ব্যবহার করা হয়। *** চিকিৎসকের পরামর্শ ছাড়া ওষুধ সেবন করলে দীর্ঘমেয়াদি সমস্যা দেখা দিতে পারে।', 9)
GO
INSERT [dbo].[Configuration_MedicineFAQ] ([Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Question], [Answer], [MedicineId]) VALUES (9, CAST(N'2025-06-24T15:59:59.2066667' AS DateTime2), 2, NULL, NULL, N'ওষুধটি ব্যবহারের নিয়ম?', N'অ্যামোক্সিল খাওয়ার নিয়ম / ব্যবহারের নিয়ম
o   মৃদু ও মাঝারি ধরণের সংক্রমণের ক্ষেত্রে প্রাপ্ত বয়স্ক : ৫০০ মি.গ্রা. প্রতি ১২ ঘন্টা অন্তর অথবা ২৫০ মি.গ্রা. প্রতি ৮ ঘন্টা অন্তর । 
o   শিশু : ২৫ মি.গ্রা./কেজি দৈহিক ওজন/দিন প্রতি ১২ ঘন্টা অন্তর অথবা ২০ মি.গ্রা./কেজি দৈহিক ওজন/দিন প্রতি ৮ ঘন্টা অন্তর। 
o   তীব্র সংক্রমণের ক্ষেত্রে : প্রাপ্তবয়স্ক : ৮৭৫ মি.গ্রা. প্রতি ১২ ঘন্টা অন্তর অথবা ৫০০ মি.গ্রা. প্রতি ৮ ঘন্টা অন্তর । 
o   শিশু : ৪৫ মি.গ্রা./কেজি দৈহিক ওজন/দিন প্রতি ১২ ঘন্টা অন্তর অথবা ৪০ মি.গ্রা./কেজি দৈহিক ওজন/দিন প্রতি ৮ ঘন্টা অন্তর। 
*** চিকিৎসকের পরামর্শ ছাড়া ওষুধ সেবন করলে দীর্ঘমেয়াদি সমস্যা দেখা দিতে পারে।
', 9)
GO
INSERT [dbo].[Configuration_MedicineFAQ] ([Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Question], [Answer], [MedicineId]) VALUES (10, CAST(N'2025-06-24T16:01:05.5766667' AS DateTime2), 2, NULL, NULL, N'ওষুধটির কি কি পাশ্ব প্রতিক্রিয়া আছে?
', N'উদরাময়, বদহজম অথবা চামড়ায় ফুসকুড়ি হতে পারে।', 10)
GO
INSERT [dbo].[Configuration_MedicineFAQ] ([Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Question], [Answer], [MedicineId]) VALUES (11, CAST(N'2025-06-24T16:01:05.5866667' AS DateTime2), 2, NULL, NULL, N'ওষুধটি ব্যবহারে বিশেষ যে সতর্কতা অবলম্বন করতে হবে?', N' বৃক্কের অকার্যকারিতার ক্ষেত্রে শরীর থেকে এন্টিবায়োটিক নির্গমণ বিলম্বিত হয় বলে ঔষধটির দৈনিক মাত্রা কমানোর প্রয়োজন হতে পারে।', 10)
GO
INSERT [dbo].[Configuration_MedicineFAQ] ([Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Question], [Answer], [MedicineId]) VALUES (12, CAST(N'2025-06-24T16:01:05.5933333' AS DateTime2), 2, NULL, NULL, N'ওষুধটির সাথে অন্য ওষুধের কি পাশ্ব প্রতিক্রিয়া আছে?', N'প্রাবেনিসিড। ', 10)
GO
INSERT [dbo].[Configuration_MedicineFAQ] ([Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Question], [Answer], [MedicineId]) VALUES (13, CAST(N'2025-06-24T16:01:05.5966667' AS DateTime2), 2, NULL, NULL, N'ওষুধটির কি কি পাশ্ব প্রতিক্রিয়া আছে?', N'উদরাময়, বদহজম অথবা চামড়ায় ফুসকুড়ি হতে পারে।', 10)
GO
INSERT [dbo].[Configuration_MedicineFAQ] ([Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Question], [Answer], [MedicineId]) VALUES (14, CAST(N'2025-06-24T16:01:05.6033333' AS DateTime2), 2, NULL, NULL, N'ওষুধটি সংক্ষণের উপায়
', N'বৃক্কের অকার্যকারিতার ক্ষেত্রে শরীর থেকে এন্টিবায়োটিক নির্গমণ বিলম্বিত হয় বলে ঔষধটির দৈনিক মাত্রা কমানোর প্রয়োজন হতে পারে।
', 10)
GO
INSERT [dbo].[Configuration_MedicineFAQ] ([Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Question], [Answer], [MedicineId]) VALUES (15, CAST(N'2025-06-24T16:01:05.6100000' AS DateTime2), 2, NULL, NULL, N'ওষুধটির সক্রিয় উপাদানগুলি কি?', N'এটি একটি অ্যামিনো-পেনিসিলিন, অ্যান্টিমাইক্রোবিয়াল প্রতিরোধের জন্য পেনিসিলিনের সাথে একটি অতিরিক্ত অ্যামিনো গ্রুপ যোগ করে তৈরি করা হয়।', 10)
GO
INSERT [dbo].[Configuration_MedicineFAQ] ([Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Question], [Answer], [MedicineId]) VALUES (16, CAST(N'2025-06-24T16:01:05.6133333' AS DateTime2), 2, NULL, NULL, N'ওষুধটি অন্য কি নামে পরিচিত?
', N'দয়া করে বিকল্প তালিকা চেক করুন - লিঙ্কে ক্লিক করুন', 10)
GO
INSERT [dbo].[Configuration_MedicineFAQ] ([Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Question], [Answer], [MedicineId]) VALUES (17, CAST(N'2025-06-24T16:01:05.6200000' AS DateTime2), 2, NULL, NULL, N'ওষুধটি কোন উদ্দেশ্যে ব্যবহার করা হয়?
', N'নাক-কান-গলা এর সংক্রমণ, যৌন ও মূত্রনালীর সংক্রমণ, ত্বক ও ত্বকের কাঠামাের সংক্রমণ, নিম্ন শ্বাসনালীর সংক্রমণ, গনােরিয়া এবং দাঁতের অস্ত্রোপচার এর পরবর্তীতে এন্ডােকার্ডিয়ামের প্রদাহের প্রতিরােধে ব্যবহার করা হয়। 
*** চিকিৎসকের পরামর্শ ছাড়া ওষুধ সেবন করলে দীর্ঘমেয়াদি সমস্যা দেখা দিতে পারে।
', 10)
GO
INSERT [dbo].[Configuration_MedicineFAQ] ([Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Question], [Answer], [MedicineId]) VALUES (18, CAST(N'2025-06-24T16:01:05.6233333' AS DateTime2), 2, NULL, NULL, N'ওষুধটি ব্যবহারের নিয়ম?
', N'অ্যামোক্সিল খাওয়ার নিয়ম / ব্যবহারের নিয়ম
o   মৃদু ও মাঝারি ধরণের সংক্রমণের ক্ষেত্রে প্রাপ্ত বয়স্ক : ৫০০ মি.গ্রা. প্রতি ১২ ঘন্টা অন্তর অথবা ২৫০ মি.গ্রা. প্রতি ৮ ঘন্টা অন্তর । 
o   শিশু : ২৫ মি.গ্রা./কেজি দৈহিক ওজন/দিন প্রতি ১২ ঘন্টা অন্তর অথবা ২০ মি.গ্রা./কেজি দৈহিক ওজন/দিন প্রতি ৮ ঘন্টা অন্তর। 
o   তীব্র সংক্রমণের ক্ষেত্রে : প্রাপ্তবয়স্ক : ৮৭৫ মি.গ্রা. প্রতি ১২ ঘন্টা অন্তর অথবা ৫০০ মি.গ্রা. প্রতি ৮ ঘন্টা অন্তর । 
o   শিশু : ৪৫ মি.গ্রা./কেজি দৈহিক ওজন/দিন প্রতি ১২ ঘন্টা অন্তর অথবা ৪০ মি.গ্রা./কেজি দৈহিক ওজন/দিন প্রতি ৮ ঘন্টা অন্তর। 
*** চিকিৎসকের পরামর্শ ছাড়া ওষুধ সেবন করলে দীর্ঘমেয়াদি সমস্যা দেখা দিতে পারে।
', 10)
GO
INSERT [dbo].[Configuration_MedicineFAQ] ([Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Question], [Answer], [MedicineId]) VALUES (19, CAST(N'2025-06-24T16:01:37.5933333' AS DateTime2), 2, NULL, NULL, N'ওষুধটির কি কি পাশ্ব প্রতিক্রিয়া আছে?
', N'উদরাময়, বদহজম অথবা চামড়ায় ফুসকুড়ি হতে পারে।', 16)
GO
INSERT [dbo].[Configuration_MedicineFAQ] ([Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Question], [Answer], [MedicineId]) VALUES (20, CAST(N'2025-06-24T16:01:37.6000000' AS DateTime2), 2, NULL, NULL, N'ওষুধটি ব্যবহারে বিশেষ যে সতর্কতা অবলম্বন করতে হবে?', N'বৃক্কের অকার্যকারিতার ক্ষেত্রে শরীর থেকে এন্টিবায়োটিক নির্গমণ বিলম্বিত হয় বলে ঔষধটির দৈনিক মাত্রা কমানোর প্রয়োজন হতে পারে।
', 16)
GO
INSERT [dbo].[Configuration_MedicineFAQ] ([Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Question], [Answer], [MedicineId]) VALUES (21, CAST(N'2025-06-24T16:01:37.6066667' AS DateTime2), 2, NULL, NULL, N'ওষুধটির সাথে অন্য ওষুধের কি পাশ্ব প্রতিক্রিয়া আছে?
', N'প্রাবেনিসিড।', 16)
GO
INSERT [dbo].[Configuration_MedicineFAQ] ([Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Question], [Answer], [MedicineId]) VALUES (22, CAST(N'2025-06-24T16:01:37.6133333' AS DateTime2), 2, NULL, NULL, N'ওষুধটির কি কি পাশ্ব প্রতিক্রিয়া আছে?', N'উদরাময়, বদহজম অথবা চামড়ায় ফুসকুড়ি হতে পারে।', 16)
GO
INSERT [dbo].[Configuration_MedicineFAQ] ([Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Question], [Answer], [MedicineId]) VALUES (23, CAST(N'2025-06-24T16:01:37.6200000' AS DateTime2), 2, NULL, NULL, N'ওষুধটি ব্যবহারে বিশেষ যে সতর্কতা অবলম্বন করতে হবে?
', N'বৃক্কের অকার্যকারিতার ক্ষেত্রে শরীর থেকে এন্টিবায়োটিক নির্গমণ বিলম্বিত হয় বলে ঔষধটির দৈনিক মাত্রা কমানোর প্রয়োজন হতে পারে।', 16)
GO
INSERT [dbo].[Configuration_MedicineFAQ] ([Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Question], [Answer], [MedicineId]) VALUES (24, CAST(N'2025-06-24T16:01:37.6233333' AS DateTime2), 2, NULL, NULL, N'ওষুধটির সাথে অন্য ওষুধের কি পাশ্ব প্রতিক্রিয়া আছে?', N'প্রাবেনিসিড।', 16)
GO
INSERT [dbo].[Configuration_MedicineFAQ] ([Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Question], [Answer], [MedicineId]) VALUES (25, CAST(N'2025-06-24T16:01:37.6300000' AS DateTime2), 2, NULL, NULL, N'ওষুধটির একটি ডোজ বাদ গেলে কি করবেন?', N'ওষুধটি নির্ধারিত সময়ে নিতে ভুলে গেলে মনে পড়ার সাথে সাথে গ্রহণ করতে হবে।  তবে পরবর্তী নির্ধারিত ডোজ গ্রহণের সময় হয়ে গেলে ভুলে যাওয়া ডোজ গ্রহণ করা যাবে না। ওষুধটি ডাবল ডোজ নেয়া যাবে না।', 16)
GO
INSERT [dbo].[Configuration_MedicineFAQ] ([Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Question], [Answer], [MedicineId]) VALUES (26, CAST(N'2025-06-24T16:01:37.6366667' AS DateTime2), 2, NULL, NULL, N'ওষুধটি সংক্ষণের উপায়', N'হালকা থেকে সুরক্ষিত একটি শীতল ও শুকনো জায়গায় সঞ্চয় করুন। অ্যামোক্সিসিলিন সাসপেনশন এবং ড্রপগুলি তাজা প্রস্তুত করা উচিত, একটি শীতল শুকনো স্থানে একটি ফ্রিজে সংরক্ষণ করা উচিত। পুনর্গঠিত স্থগিতাদেশ এবং ড্রপগুলি ঘরের তাপমাত্রায় রাখলে 5 দিনের মধ্যে বা ফ্রিজে রাখলে 7 দিনের মধ্যে ব্যবহার করতে হবে।', 16)
GO
INSERT [dbo].[Configuration_MedicineFAQ] ([Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Question], [Answer], [MedicineId]) VALUES (27, CAST(N'2025-06-24T16:01:37.6400000' AS DateTime2), 2, NULL, NULL, N'ওষুধটির সক্রিয় উপাদানগুলি কি?
', N'এটি একটি অ্যামিনো-পেনিসিলিন, অ্যান্টিমাইক্রোবিয়াল প্রতিরোধের জন্য পেনিসিলিনের সাথে একটি অতিরিক্ত অ্যামিনো গ্রুপ যোগ করে তৈরি করা হয়।', 16)
GO
INSERT [dbo].[Configuration_MedicineFAQ] ([Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Question], [Answer], [MedicineId]) VALUES (28, CAST(N'2025-06-24T16:02:03.5166667' AS DateTime2), 2, NULL, NULL, N'ওষুধটি অন্য কি নামে পরিচিত?', N'দয়া করে বিকল্প তালিকা চেক করুন - লিঙ্কে ক্লিক করুন', 18)
GO
INSERT [dbo].[Configuration_MedicineFAQ] ([Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Question], [Answer], [MedicineId]) VALUES (29, CAST(N'2025-06-24T16:02:03.5233333' AS DateTime2), 2, NULL, NULL, N'ওষুধটি কোন উদ্দেশ্যে ব্যবহার করা হয়?', N'নাক-কান-গলা এর সংক্রমণ, যৌন ও মূত্রনালীর সংক্রমণ, ত্বক ও ত্বকের কাঠামাের সংক্রমণ, নিম্ন শ্বাসনালীর সংক্রমণ, গনােরিয়া এবং দাঁতের অস্ত্রোপচার এর পরবর্তীতে এন্ডােকার্ডিয়ামের প্রদাহের প্রতিরােধে ব্যবহার করা হয়। 
*** চিকিৎসকের পরামর্শ ছাড়া ওষুধ সেবন করলে দীর্ঘমেয়াদি সমস্যা দেখা দিতে পারে।
', 18)
GO
INSERT [dbo].[Configuration_MedicineFAQ] ([Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Question], [Answer], [MedicineId]) VALUES (30, CAST(N'2025-06-24T16:02:03.5333333' AS DateTime2), 2, NULL, NULL, N'ওষুধটি ব্যবহারের নিয়ম?
', N'অ্যামোক্সিল খাওয়ার নিয়ম / ব্যবহারের নিয়ম
o   মৃদু ও মাঝারি ধরণের সংক্রমণের ক্ষেত্রে প্রাপ্ত বয়স্ক : ৫০০ মি.গ্রা. প্রতি ১২ ঘন্টা অন্তর অথবা ২৫০ মি.গ্রা. প্রতি ৮ ঘন্টা অন্তর । 
o   শিশু : ২৫ মি.গ্রা./কেজি দৈহিক ওজন/দিন প্রতি ১২ ঘন্টা অন্তর অথবা ২০ মি.গ্রা./কেজি দৈহিক ওজন/দিন প্রতি ৮ ঘন্টা অন্তর। 
o   তীব্র সংক্রমণের ক্ষেত্রে : প্রাপ্তবয়স্ক : ৮৭৫ মি.গ্রা. প্রতি ১২ ঘন্টা অন্তর অথবা ৫০০ মি.গ্রা. প্রতি ৮ ঘন্টা অন্তর । 
o   শিশু : ৪৫ মি.গ্রা./কেজি দৈহিক ওজন/দিন প্রতি ১২ ঘন্টা অন্তর অথবা ৪০ মি.গ্রা./কেজি দৈহিক ওজন/দিন প্রতি ৮ ঘন্টা অন্তর। 
*** চিকিৎসকের পরামর্শ ছাড়া ওষুধ সেবন করলে দীর্ঘমেয়াদি সমস্যা দেখা দিতে পারে।
', 18)
GO
INSERT [dbo].[Configuration_MedicineFAQ] ([Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Question], [Answer], [MedicineId]) VALUES (31, CAST(N'2025-06-24T16:02:03.5466667' AS DateTime2), 2, NULL, NULL, N'ওষুধটির কি কি পাশ্ব প্রতিক্রিয়া আছে?', N'উদরাময়, বদহজম অথবা চামড়ায় ফুসকুড়ি হতে পারে।', 18)
GO
INSERT [dbo].[Configuration_MedicineFAQ] ([Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Question], [Answer], [MedicineId]) VALUES (32, CAST(N'2025-06-24T16:02:03.5533333' AS DateTime2), 2, NULL, NULL, N'ওষুধটি ব্যবহারে বিশেষ যে সতর্কতা অবলম্বন করতে হবে?', N'বৃক্কের অকার্যকারিতার ক্ষেত্রে শরীর থেকে এন্টিবায়োটিক নির্গমণ বিলম্বিত হয় বলে ঔষধটির দৈনিক মাত্রা কমানোর প্রয়োজন হতে পারে।', 18)
GO
INSERT [dbo].[Configuration_MedicineFAQ] ([Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Question], [Answer], [MedicineId]) VALUES (33, CAST(N'2025-06-24T16:02:03.5566667' AS DateTime2), 2, NULL, NULL, N'ওষুধটির সাথে অন্য ওষুধের কি পাশ্ব প্রতিক্রিয়া আছে?', N'প্রাবেনিসিড। 
', 18)
GO
INSERT [dbo].[Configuration_MedicineFAQ] ([Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Question], [Answer], [MedicineId]) VALUES (34, CAST(N'2025-06-24T16:02:03.5666667' AS DateTime2), 2, NULL, NULL, N'ওষুধটির একটি ডোজ বাদ গেলে কি করবেন?
', N'ওষুধটি নির্ধারিত সময়ে নিতে ভুলে গেলে মনে পড়ার সাথে সাথে গ্রহণ করতে হবে।  তবে পরবর্তী নির্ধারিত ডোজ গ্রহণের সময় হয়ে গেলে ভুলে যাওয়া ডোজ গ্রহণ করা যাবে না। ওষুধটি ডাবল ডোজ নেয়া যাবে না।
', 18)
GO
INSERT [dbo].[Configuration_MedicineFAQ] ([Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Question], [Answer], [MedicineId]) VALUES (35, CAST(N'2025-06-24T16:02:03.5700000' AS DateTime2), 2, NULL, NULL, N'ওষুধটি সংক্ষণের উপায়
', N'হালকা থেকে সুরক্ষিত একটি শীতল ও শুকনো জায়গায় সঞ্চয় করুন। অ্যামোক্সিসিলিন সাসপেনশন এবং ড্রপগুলি তাজা প্রস্তুত করা উচিত, একটি শীতল শুকনো স্থানে একটি ফ্রিজে সংরক্ষণ করা উচিত। পুনর্গঠিত স্থগিতাদেশ এবং ড্রপগুলি ঘরের তাপমাত্রায় রাখলে 5 দিনের মধ্যে বা ফ্রিজে রাখলে 7 দিনের মধ্যে ব্যবহার করতে হবে।
', 18)
GO
INSERT [dbo].[Configuration_MedicineFAQ] ([Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Question], [Answer], [MedicineId]) VALUES (36, CAST(N'2025-06-24T16:02:03.5766667' AS DateTime2), 2, NULL, NULL, N'ওষুধটির সক্রিয় উপাদানগুলি কি?
', N'এটি একটি অ্যামিনো-পেনিসিলিন, অ্যান্টিমাইক্রোবিয়াল প্রতিরোধের জন্য পেনিসিলিনের সাথে একটি অতিরিক্ত অ্যামিনো গ্রুপ যোগ করে তৈরি করা হয়।', 18)
GO
INSERT [dbo].[Configuration_MedicineFAQ] ([Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Question], [Answer], [MedicineId]) VALUES (37, CAST(N'2025-06-24T16:02:29.2833333' AS DateTime2), 2, NULL, NULL, N'ওষুধটি অন্য কি নামে পরিচিত?', N'দয়া করে বিকল্প তালিকা চেক করুন - লিঙ্কে ক্লিক করুন', 20)
GO
INSERT [dbo].[Configuration_MedicineFAQ] ([Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Question], [Answer], [MedicineId]) VALUES (38, CAST(N'2025-06-24T16:02:29.2900000' AS DateTime2), 2, NULL, NULL, N'ওষুধটি কোন উদ্দেশ্যে ব্যবহার করা হয়?', N'নাক-কান-গলা এর সংক্রমণ, যৌন ও মূত্রনালীর সংক্রমণ, ত্বক ও ত্বকের কাঠামাের সংক্রমণ, নিম্ন শ্বাসনালীর সংক্রমণ, গনােরিয়া এবং দাঁতের অস্ত্রোপচার এর পরবর্তীতে এন্ডােকার্ডিয়ামের প্রদাহের প্রতিরােধে ব্যবহার করা হয়। 
*** চিকিৎসকের পরামর্শ ছাড়া ওষুধ সেবন করলে দীর্ঘমেয়াদি সমস্যা দেখা দিতে পারে।
', 20)
GO
INSERT [dbo].[Configuration_MedicineFAQ] ([Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Question], [Answer], [MedicineId]) VALUES (39, CAST(N'2025-06-24T16:02:29.2966667' AS DateTime2), 2, NULL, NULL, N'ওষুধটি ব্যবহারের নিয়ম?
', N'অ্যামোক্সিল খাওয়ার নিয়ম / ব্যবহারের নিয়ম
o   মৃদু ও মাঝারি ধরণের সংক্রমণের ক্ষেত্রে প্রাপ্ত বয়স্ক : ৫০০ মি.গ্রা. প্রতি ১২ ঘন্টা অন্তর অথবা ২৫০ মি.গ্রা. প্রতি ৮ ঘন্টা অন্তর । 
o   শিশু : ২৫ মি.গ্রা./কেজি দৈহিক ওজন/দিন প্রতি ১২ ঘন্টা অন্তর অথবা ২০ মি.গ্রা./কেজি দৈহিক ওজন/দিন প্রতি ৮ ঘন্টা অন্তর। 
o   তীব্র সংক্রমণের ক্ষেত্রে : প্রাপ্তবয়স্ক : ৮৭৫ মি.গ্রা. প্রতি ১২ ঘন্টা অন্তর অথবা ৫০০ মি.গ্রা. প্রতি ৮ ঘন্টা অন্তর । 
o   শিশু : ৪৫ মি.গ্রা./কেজি দৈহিক ওজন/দিন প্রতি ১২ ঘন্টা অন্তর অথবা ৪০ মি.গ্রা./কেজি দৈহিক ওজন/দিন প্রতি ৮ ঘন্টা অন্তর। 
*** চিকিৎসকের পরামর্শ ছাড়া ওষুধ সেবন করলে দীর্ঘমেয়াদি সমস্যা দেখা দিতে পারে।
', 20)
GO
INSERT [dbo].[Configuration_MedicineFAQ] ([Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Question], [Answer], [MedicineId]) VALUES (40, CAST(N'2025-06-24T16:02:29.3066667' AS DateTime2), 2, NULL, NULL, N'ওষুধটির কি কি পাশ্ব প্রতিক্রিয়া আছে?
', N'উদরাময়, বদহজম অথবা চামড়ায় ফুসকুড়ি হতে পারে।
', 20)
GO
INSERT [dbo].[Configuration_MedicineFAQ] ([Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Question], [Answer], [MedicineId]) VALUES (41, CAST(N'2025-06-24T16:02:29.3100000' AS DateTime2), 2, NULL, NULL, N'ওষুধটি ব্যবহারে বিশেষ যে সতর্কতা অবলম্বন করতে হবে?', N' বৃক্কের অকার্যকারিতার ক্ষেত্রে শরীর থেকে এন্টিবায়োটিক নির্গমণ বিলম্বিত হয় বলে ঔষধটির দৈনিক মাত্রা কমানোর প্রয়োজন হতে পারে।', 20)
GO
INSERT [dbo].[Configuration_MedicineFAQ] ([Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Question], [Answer], [MedicineId]) VALUES (42, CAST(N'2025-06-24T16:02:29.3200000' AS DateTime2), 2, NULL, NULL, N'ওষুধটির সাথে অন্য ওষুধের কি পাশ্ব প্রতিক্রিয়া আছে?
', N'প্রাবেনিসিড। 
', 20)
GO
INSERT [dbo].[Configuration_MedicineFAQ] ([Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Question], [Answer], [MedicineId]) VALUES (43, CAST(N'2025-06-24T16:02:29.3233333' AS DateTime2), 2, NULL, NULL, N'ওষুধটির একটি ডোজ বাদ গেলে কি করবেন?
', N'ওষুধটি নির্ধারিত সময়ে নিতে ভুলে গেলে মনে পড়ার সাথে সাথে গ্রহণ করতে হবে।  তবে পরবর্তী নির্ধারিত ডোজ গ্রহণের সময় হয়ে গেলে ভুলে যাওয়া ডোজ গ্রহণ করা যাবে না। ওষুধটি ডাবল ডোজ নেয়া যাবে না।', 20)
GO
INSERT [dbo].[Configuration_MedicineFAQ] ([Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Question], [Answer], [MedicineId]) VALUES (44, CAST(N'2025-06-24T16:02:29.3300000' AS DateTime2), 2, NULL, NULL, N'ওষুধটি সংক্ষণের উপায়
', N'হালকা থেকে সুরক্ষিত একটি শীতল ও শুকনো জায়গায় সঞ্চয় করুন। অ্যামোক্সিসিলিন সাসপেনশন এবং ড্রপগুলি তাজা প্রস্তুত করা উচিত, একটি শীতল শুকনো স্থানে একটি ফ্রিজে সংরক্ষণ করা উচিত। পুনর্গঠিত স্থগিতাদেশ এবং ড্রপগুলি ঘরের তাপমাত্রায় রাখলে 5 দিনের মধ্যে বা ফ্রিজে রাখলে 7 দিনের মধ্যে ব্যবহার করতে হবে।
', 20)
GO
INSERT [dbo].[Configuration_MedicineFAQ] ([Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Question], [Answer], [MedicineId]) VALUES (45, CAST(N'2025-06-24T16:02:29.3333333' AS DateTime2), 2, NULL, NULL, N'ওষুধটির সক্রিয় উপাদানগুলি কি?', N'এটি একটি অ্যামিনো-পেনিসিলিন, অ্যান্টিমাইক্রোবিয়াল প্রতিরোধের জন্য পেনিসিলিনের সাথে একটি অতিরিক্ত অ্যামিনো গ্রুপ যোগ করে তৈরি করা হয়।', 20)
GO
INSERT [dbo].[Configuration_MedicineFAQ] ([Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Question], [Answer], [MedicineId]) VALUES (46, CAST(N'2025-06-24T16:02:56.0300000' AS DateTime2), 2, NULL, NULL, N'ওষুধটি অন্য কি নামে পরিচিত?
', N'দয়া করে বিকল্প তালিকা চেক করুন - লিঙ্কে ক্লিক করুন
', 21)
GO
INSERT [dbo].[Configuration_MedicineFAQ] ([Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Question], [Answer], [MedicineId]) VALUES (47, CAST(N'2025-06-24T16:02:56.0400000' AS DateTime2), 2, NULL, NULL, N'ওষুধটি কোন উদ্দেশ্যে ব্যবহার করা হয়?
', N'নাক-কান-গলা এর সংক্রমণ, যৌন ও মূত্রনালীর সংক্রমণ, ত্বক ও ত্বকের কাঠামাের সংক্রমণ, নিম্ন শ্বাসনালীর সংক্রমণ, গনােরিয়া এবং দাঁতের অস্ত্রোপচার এর পরবর্তীতে এন্ডােকার্ডিয়ামের প্রদাহের প্রতিরােধে ব্যবহার করা হয়। 
*** চিকিৎসকের পরামর্শ ছাড়া ওষুধ সেবন করলে দীর্ঘমেয়াদি সমস্যা দেখা দিতে পারে।
', 21)
GO
INSERT [dbo].[Configuration_MedicineFAQ] ([Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Question], [Answer], [MedicineId]) VALUES (48, CAST(N'2025-06-24T16:02:56.0466667' AS DateTime2), 2, NULL, NULL, N'ওষুধটি ব্যবহারের নিয়ম?
', N'অ্যামোক্সিল খাওয়ার নিয়ম / ব্যবহারের নিয়ম
o   মৃদু ও মাঝারি ধরণের সংক্রমণের ক্ষেত্রে প্রাপ্ত বয়স্ক : ৫০০ মি.গ্রা. প্রতি ১২ ঘন্টা অন্তর অথবা ২৫০ মি.গ্রা. প্রতি ৮ ঘন্টা অন্তর । 
o   শিশু : ২৫ মি.গ্রা./কেজি দৈহিক ওজন/দিন প্রতি ১২ ঘন্টা অন্তর অথবা ২০ মি.গ্রা./কেজি দৈহিক ওজন/দিন প্রতি ৮ ঘন্টা অন্তর। 
o   তীব্র সংক্রমণের ক্ষেত্রে : প্রাপ্তবয়স্ক : ৮৭৫ মি.গ্রা. প্রতি ১২ ঘন্টা অন্তর অথবা ৫০০ মি.গ্রা. প্রতি ৮ ঘন্টা অন্তর । 
o   শিশু : ৪৫ মি.গ্রা./কেজি দৈহিক ওজন/দিন প্রতি ১২ ঘন্টা অন্তর অথবা ৪০ মি.গ্রা./কেজি দৈহিক ওজন/দিন প্রতি ৮ ঘন্টা অন্তর। 
*** চিকিৎসকের পরামর্শ ছাড়া ওষুধ সেবন করলে দীর্ঘমেয়াদি সমস্যা দেখা দিতে পারে।
', 21)
GO
INSERT [dbo].[Configuration_MedicineFAQ] ([Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Question], [Answer], [MedicineId]) VALUES (49, CAST(N'2025-06-24T16:02:56.0500000' AS DateTime2), 2, NULL, NULL, N'ওষুধটির কি কি পাশ্ব প্রতিক্রিয়া আছে?', N'উদরাময়, বদহজম অথবা চামড়ায় ফুসকুড়ি হতে পারে।
', 21)
GO
INSERT [dbo].[Configuration_MedicineFAQ] ([Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Question], [Answer], [MedicineId]) VALUES (50, CAST(N'2025-06-24T16:02:56.0566667' AS DateTime2), 2, NULL, NULL, N'ওষুধটি ব্যবহারে বিশেষ যে সতর্কতা অবলম্বন করতে হবে?', N' বৃক্কের অকার্যকারিতার ক্ষেত্রে শরীর থেকে এন্টিবায়োটিক নির্গমণ বিলম্বিত হয় বলে ঔষধটির দৈনিক মাত্রা কমানোর প্রয়োজন হতে পারে।', 21)
GO
INSERT [dbo].[Configuration_MedicineFAQ] ([Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Question], [Answer], [MedicineId]) VALUES (51, CAST(N'2025-06-24T16:02:56.0600000' AS DateTime2), 2, NULL, NULL, N'ওষুধটির সাথে অন্য ওষুধের কি পাশ্ব প্রতিক্রিয়া আছে?
', N'প্রাবেনিসিড। 
', 21)
GO
INSERT [dbo].[Configuration_MedicineFAQ] ([Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Question], [Answer], [MedicineId]) VALUES (52, CAST(N'2025-06-24T16:02:56.0666667' AS DateTime2), 2, NULL, NULL, N'ওষুধটির একটি ডোজ বাদ গেলে কি করবেন?', N'ওষুধটি নির্ধারিত সময়ে নিতে ভুলে গেলে মনে পড়ার সাথে সাথে গ্রহণ করতে হবে।  তবে পরবর্তী নির্ধারিত ডোজ গ্রহণের সময় হয়ে গেলে ভুলে যাওয়া ডোজ গ্রহণ করা যাবে না। ওষুধটি ডাবল ডোজ নেয়া যাবে না।
', 21)
GO
INSERT [dbo].[Configuration_MedicineFAQ] ([Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Question], [Answer], [MedicineId]) VALUES (53, CAST(N'2025-06-24T16:02:56.0700000' AS DateTime2), 2, NULL, NULL, N'ওষুধটি সংক্ষণের উপায়
', N'হালকা থেকে সুরক্ষিত একটি শীতল ও শুকনো জায়গায় সঞ্চয় করুন। অ্যামোক্সিসিলিন সাসপেনশন এবং ড্রপগুলি তাজা প্রস্তুত করা উচিত, একটি শীতল শুকনো স্থানে একটি ফ্রিজে সংরক্ষণ করা উচিত। পুনর্গঠিত স্থগিতাদেশ এবং ড্রপগুলি ঘরের তাপমাত্রায় রাখলে 5 দিনের মধ্যে বা ফ্রিজে রাখলে 7 দিনের মধ্যে ব্যবহার করতে হবে।', 21)
GO
INSERT [dbo].[Configuration_MedicineFAQ] ([Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Question], [Answer], [MedicineId]) VALUES (54, CAST(N'2025-06-24T16:02:56.0800000' AS DateTime2), 2, NULL, NULL, N'ওষুধটির সক্রিয় উপাদানগুলি কি?
', N'এটি একটি অ্যামিনো-পেনিসিলিন, অ্যান্টিমাইক্রোবিয়াল প্রতিরোধের জন্য পেনিসিলিনের সাথে একটি অতিরিক্ত অ্যামিনো গ্রুপ যোগ করে তৈরি করা হয়।
', 21)
GO
SET IDENTITY_INSERT [dbo].[Configuration_MedicineFAQ] OFF
GO
SET IDENTITY_INSERT [dbo].[Configuration_MedicineGeneric] ON 
GO
INSERT [dbo].[Configuration_MedicineGeneric] ([Id], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (1, N'Abacavir + Lamivudine + Zidovudine', NULL, CAST(N'2025-06-15T00:28:01.0166667' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_MedicineGeneric] ([Id], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (2, N'Abemaciclib', NULL, CAST(N'2025-06-15T00:28:01.0166667' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_MedicineGeneric] ([Id], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (3, N'Abiraterone Acetate', NULL, CAST(N'2025-06-15T00:28:01.0166667' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_MedicineGeneric] ([Id], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (4, N'Acalabrutinib', NULL, CAST(N'2025-06-15T00:28:01.0166667' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_MedicineGeneric] ([Id], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (5, N'Acarbose', NULL, CAST(N'2025-06-15T00:28:01.0166667' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_MedicineGeneric] ([Id], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (6, N'Aceclofenac', NULL, CAST(N'2025-06-15T00:28:01.0166667' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_MedicineGeneric] ([Id], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (7, N'Nabayas Louha Herbal Haematinic', NULL, CAST(N'2025-06-15T00:28:01.0166667' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_MedicineGeneric] ([Id], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (8, N'Aravindasav', NULL, CAST(N'2025-06-15T00:28:01.0166667' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_MedicineGeneric] ([Id], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (9, N'Arjunarista', NULL, CAST(N'2025-06-15T00:28:01.0166667' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_MedicineGeneric] ([Id], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (10, N'Malus sylvestris', NULL, CAST(N'2025-06-15T00:28:01.0166667' AS DateTime2), 2, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Configuration_MedicineGeneric] OFF
GO
SET IDENTITY_INSERT [dbo].[Configuration_MedicineManufactureInfo] ON 
GO
INSERT [dbo].[Configuration_MedicineManufactureInfo] ([Id], [Name], [OriginRegion], [Importer], [EstablishedDate], [Products], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CompanyUrl]) VALUES (1, N'Square Pharmaceuticals Ltd.', N'Bangladesh', N'N/A', CAST(N'1985-01-01T00:00:00.0000000' AS DateTime2), N'577 generics, 959 brand names', CAST(N'2025-06-15T00:26:06.7033333' AS DateTime2), 2, NULL, NULL, N'https://www.google.com/')
GO
INSERT [dbo].[Configuration_MedicineManufactureInfo] ([Id], [Name], [OriginRegion], [Importer], [EstablishedDate], [Products], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CompanyUrl]) VALUES (2, N'Incepta Pharmaceuticals Ltd.', N'Bangladesh', N'N/A', CAST(N'1999-01-01T00:00:00.0000000' AS DateTime2), N'768 generics, 1357 brand names', CAST(N'2025-06-15T00:26:06.7100000' AS DateTime2), 2, NULL, NULL, N'https://www.google.com/')
GO
INSERT [dbo].[Configuration_MedicineManufactureInfo] ([Id], [Name], [OriginRegion], [Importer], [EstablishedDate], [Products], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CompanyUrl]) VALUES (3, N'Beximco Pharmaceuticals Ltd.', N'Bangladesh', N'N/A', CAST(N'1980-01-01T00:00:00.0000000' AS DateTime2), N'398 generics, 734 brand names', CAST(N'2025-06-15T00:26:06.7233333' AS DateTime2), 2, NULL, NULL, N'https://www.google.com/')
GO
INSERT [dbo].[Configuration_MedicineManufactureInfo] ([Id], [Name], [OriginRegion], [Importer], [EstablishedDate], [Products], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CompanyUrl]) VALUES (4, N'Opsonin Pharma Limited', N'Bangladesh', N'N/A', CAST(N'1956-01-01T00:00:00.0000000' AS DateTime2), N'501 generics, 1006 brand names', CAST(N'2025-06-15T00:26:06.7233333' AS DateTime2), 2, NULL, NULL, N'https://www.google.com/')
GO
INSERT [dbo].[Configuration_MedicineManufactureInfo] ([Id], [Name], [OriginRegion], [Importer], [EstablishedDate], [Products], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CompanyUrl]) VALUES (5, N'Renata Limited', N'Bangladesh', N'N/A', CAST(N'1993-01-01T00:00:00.0000000' AS DateTime2), N'314 generics, 597 brand names', CAST(N'2025-06-15T00:26:06.7266667' AS DateTime2), 2, NULL, NULL, N'https://www.google.com/')
GO
INSERT [dbo].[Configuration_MedicineManufactureInfo] ([Id], [Name], [OriginRegion], [Importer], [EstablishedDate], [Products], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CompanyUrl]) VALUES (6, N'Eskayef Pharmaceuticals Limited', N'Bangladesh', N'N/A', CAST(N'1990-01-01T00:00:00.0000000' AS DateTime2), N'395 generics, 710 brand names', CAST(N'2025-06-15T00:26:06.7266667' AS DateTime2), 2, NULL, NULL, N'https://www.google.com/')
GO
INSERT [dbo].[Configuration_MedicineManufactureInfo] ([Id], [Name], [OriginRegion], [Importer], [EstablishedDate], [Products], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CompanyUrl]) VALUES (7, N'ACI Pharmaceuticals', N'Bangladesh', N'N/A', CAST(N'1992-01-01T00:00:00.0000000' AS DateTime2), N'379 generics, 730 brand names', CAST(N'2025-06-15T00:26:06.7300000' AS DateTime2), 2, NULL, NULL, N'https://www.google.com/')
GO
INSERT [dbo].[Configuration_MedicineManufactureInfo] ([Id], [Name], [OriginRegion], [Importer], [EstablishedDate], [Products], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CompanyUrl]) VALUES (8, N'ACME Laboratories Ltd.', N'Bangladesh', N'N/A', CAST(N'1954-01-01T00:00:00.0000000' AS DateTime2), N'432 generics, 735 brand names', CAST(N'2025-06-15T00:26:06.7300000' AS DateTime2), 2, NULL, NULL, N'https://www.google.com/')
GO
INSERT [dbo].[Configuration_MedicineManufactureInfo] ([Id], [Name], [OriginRegion], [Importer], [EstablishedDate], [Products], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CompanyUrl]) VALUES (9, N'Aristopharma Ltd.', N'Bangladesh', N'N/A', CAST(N'1986-01-01T00:00:00.0000000' AS DateTime2), N'336 generics, 558 brand names', CAST(N'2025-06-15T00:26:06.7333333' AS DateTime2), 2, NULL, NULL, N'https://www.google.com/')
GO
INSERT [dbo].[Configuration_MedicineManufactureInfo] ([Id], [Name], [OriginRegion], [Importer], [EstablishedDate], [Products], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CompanyUrl]) VALUES (10, N'Drug International Limited', N'Bangladesh', N'N/A', CAST(N'1974-01-01T00:00:00.0000000' AS DateTime2), N'460 generics, 751 brand names', CAST(N'2025-06-15T00:26:06.7333333' AS DateTime2), 2, NULL, NULL, N'https://www.google.com/')
GO
INSERT [dbo].[Configuration_MedicineManufactureInfo] ([Id], [Name], [OriginRegion], [Importer], [EstablishedDate], [Products], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CompanyUrl]) VALUES (11, N'Healthcare Pharma', N'Bangladesh', N'N/A', CAST(N'1988-01-01T00:00:00.0000000' AS DateTime2), N'334 generics, 605 brand names', CAST(N'2025-06-15T00:26:06.7366667' AS DateTime2), 2, NULL, NULL, N'https://www.google.com/')
GO
INSERT [dbo].[Configuration_MedicineManufactureInfo] ([Id], [Name], [OriginRegion], [Importer], [EstablishedDate], [Products], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CompanyUrl]) VALUES (12, N'Radiant Pharmaceuticals Ltd.', N'Bangladesh', N'N/A', CAST(N'2005-01-01T00:00:00.0000000' AS DateTime2), N'123 generics, 209 brand names', CAST(N'2025-06-15T00:26:06.7400000' AS DateTime2), 2, NULL, NULL, N'https://www.google.com/')
GO
INSERT [dbo].[Configuration_MedicineManufactureInfo] ([Id], [Name], [OriginRegion], [Importer], [EstablishedDate], [Products], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CompanyUrl]) VALUES (13, N'Popular Pharmaceuticals Ltd.', N'Bangladesh', N'N/A', CAST(N'2002-01-01T00:00:00.0000000' AS DateTime2), N'311 generics, 501 brand names', CAST(N'2025-06-15T00:26:06.7400000' AS DateTime2), 2, NULL, NULL, N'https://www.google.com/')
GO
INSERT [dbo].[Configuration_MedicineManufactureInfo] ([Id], [Name], [OriginRegion], [Importer], [EstablishedDate], [Products], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [CompanyUrl]) VALUES (14, N'Beacon Pharmaceuticals PLC', N'Bangladesh', NULL, CAST(N'2002-01-01T00:00:00.0000000' AS DateTime2), N'311 generics, 501 brand names', CAST(N'2025-06-15T00:26:06.7400000' AS DateTime2), 2, NULL, NULL, N'https://www.google.com/')
GO
SET IDENTITY_INSERT [dbo].[Configuration_MedicineManufactureInfo] OFF
GO
SET IDENTITY_INSERT [dbo].[Configuration_PoliceStation] ON 
GO
INSERT [dbo].[Configuration_PoliceStation] ([Id], [Code], [Name], [CityId], [DistrictId], [CountryId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (1, N'0000000001', N'Adabor Police Station', 1, 37, 2, CAST(N'2025-05-29T17:08:33.9133333' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_PoliceStation] ([Id], [Code], [Name], [CityId], [DistrictId], [CountryId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (2, N'0000000002', N'Badda Police Station', 1, 37, 2, CAST(N'2025-05-29T17:08:33.9233333' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_PoliceStation] ([Id], [Code], [Name], [CityId], [DistrictId], [CountryId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (3, N'0000000003', N'Banani Police Station', 1, 37, 2, CAST(N'2025-05-29T17:08:33.9266667' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_PoliceStation] ([Id], [Code], [Name], [CityId], [DistrictId], [CountryId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (4, N'0000000004', N'Bangshal Police Station', 1, 37, 2, CAST(N'2025-05-29T17:08:33.9266667' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_PoliceStation] ([Id], [Code], [Name], [CityId], [DistrictId], [CountryId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (5, N'0000000005', N'Bimanbondor Police Station', 1, 37, 2, CAST(N'2025-05-29T17:08:33.9300000' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_PoliceStation] ([Id], [Code], [Name], [CityId], [DistrictId], [CountryId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (6, N'0000000006', N'Cantonment Police Station', 1, 37, 2, CAST(N'2025-05-29T17:08:33.9333333' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_PoliceStation] ([Id], [Code], [Name], [CityId], [DistrictId], [CountryId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (7, N'0000000007', N'Chalkbazar Police Station', 1, 37, 2, CAST(N'2025-05-29T17:08:33.9366667' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_PoliceStation] ([Id], [Code], [Name], [CityId], [DistrictId], [CountryId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (8, N'0000000008', N'Dakshinkhan Police Station', 1, 37, 2, CAST(N'2025-05-29T17:08:33.9400000' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_PoliceStation] ([Id], [Code], [Name], [CityId], [DistrictId], [CountryId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (9, N'0000000009', N'Darus-Salam Police Station', 1, 37, 2, CAST(N'2025-05-29T17:08:33.9400000' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_PoliceStation] ([Id], [Code], [Name], [CityId], [DistrictId], [CountryId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (10, N'0000000010', N'Demra Police Station', 1, 37, 2, CAST(N'2025-05-29T17:08:33.9433333' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_PoliceStation] ([Id], [Code], [Name], [CityId], [DistrictId], [CountryId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (11, N'0000000011', N'Dhanmondi Police Station', 1, 37, 2, CAST(N'2025-05-29T17:08:33.9466667' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_PoliceStation] ([Id], [Code], [Name], [CityId], [DistrictId], [CountryId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (12, N'0000000012', N'Gandaria Police Station', 1, 37, 2, CAST(N'2025-05-29T17:08:33.9500000' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_PoliceStation] ([Id], [Code], [Name], [CityId], [DistrictId], [CountryId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (13, N'0000000013', N'Gulshan Police Station', 1, 37, 2, CAST(N'2025-05-29T17:08:33.9500000' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_PoliceStation] ([Id], [Code], [Name], [CityId], [DistrictId], [CountryId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (14, N'0000000014', N'Hazaribag Police Station', 1, 37, 2, CAST(N'2025-05-29T17:08:33.9500000' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_PoliceStation] ([Id], [Code], [Name], [CityId], [DistrictId], [CountryId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (15, N'0000000015', N'Jatrabari Police Station', 1, 37, 2, CAST(N'2025-05-29T17:08:33.9533333' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_PoliceStation] ([Id], [Code], [Name], [CityId], [DistrictId], [CountryId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (16, N'0000000016', N'Kafrul Police Station', 1, 37, 2, CAST(N'2025-05-29T17:08:33.9533333' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_PoliceStation] ([Id], [Code], [Name], [CityId], [DistrictId], [CountryId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (17, N'0000000017', N'Kalabagan Police Station', 1, 37, 2, CAST(N'2025-05-29T17:08:33.9566667' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_PoliceStation] ([Id], [Code], [Name], [CityId], [DistrictId], [CountryId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (18, N'0000000018', N'Kamrangirchar Police Station', 1, 37, 2, CAST(N'2025-05-29T17:08:33.9566667' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_PoliceStation] ([Id], [Code], [Name], [CityId], [DistrictId], [CountryId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (19, N'0000000019', N'Khilgaon Police Station', 1, 37, 2, CAST(N'2025-05-29T17:08:33.9566667' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_PoliceStation] ([Id], [Code], [Name], [CityId], [DistrictId], [CountryId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (20, N'0000000020', N'Khilkhet Police Station', 1, 37, 2, CAST(N'2025-05-29T17:08:33.9600000' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_PoliceStation] ([Id], [Code], [Name], [CityId], [DistrictId], [CountryId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (21, N'0000000021', N'Kadamtoli Police Station', 1, 37, 2, CAST(N'2025-05-29T17:08:33.9600000' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_PoliceStation] ([Id], [Code], [Name], [CityId], [DistrictId], [CountryId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (22, N'0000000022', N'Kotwali Police Station', 1, 37, 2, CAST(N'2025-05-29T17:08:33.9633333' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_PoliceStation] ([Id], [Code], [Name], [CityId], [DistrictId], [CountryId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (23, N'0000000023', N'Lalbagh Police Station', 1, 37, 2, CAST(N'2025-05-29T17:08:33.9633333' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_PoliceStation] ([Id], [Code], [Name], [CityId], [DistrictId], [CountryId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (24, N'0000000024', N'Mirpur Model Police Station', 1, 37, 2, CAST(N'2025-05-29T17:08:33.9633333' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_PoliceStation] ([Id], [Code], [Name], [CityId], [DistrictId], [CountryId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (25, N'0000000025', N'Mohammadpur Police Station', 1, 37, 2, CAST(N'2025-05-29T17:08:33.9666667' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_PoliceStation] ([Id], [Code], [Name], [CityId], [DistrictId], [CountryId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (26, N'0000000026', N'Motijheel Police Station', 1, 37, 2, CAST(N'2025-05-29T17:08:33.9666667' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_PoliceStation] ([Id], [Code], [Name], [CityId], [DistrictId], [CountryId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (27, N'0000000027', N'Mugda Police Station', 1, 37, 2, CAST(N'2025-05-29T17:08:33.9700000' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_PoliceStation] ([Id], [Code], [Name], [CityId], [DistrictId], [CountryId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (28, N'0000000028', N'New Market Police Station', 1, 37, 2, CAST(N'2025-05-29T17:08:33.9700000' AS DateTime2), 2, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Configuration_PoliceStation] OFF
GO
SET IDENTITY_INSERT [dbo].[Configuration_Reward] ON 
GO
INSERT [dbo].[Configuration_Reward] ([Id], [Heading], [Details], [IsNegativePointAllowed], [NonCashablePoints], [IsCashable], [CashablePoints], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [IsActive]) VALUES (3, N'Get point by uploading prescription', N'Upload a prescription and get reward point. You can use that point to get access to the system', 0, 300, 0, NULL, CAST(N'2025-10-13T05:48:58.2750432' AS DateTime2), 2, NULL, NULL, 1)
GO
INSERT [dbo].[Configuration_Reward] ([Id], [Heading], [Details], [IsNegativePointAllowed], [NonCashablePoints], [IsCashable], [CashablePoints], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [IsActive]) VALUES (4, N'Convert Prescription into SmartRx and Reedem 400 point', N'Upload a prescription and get reward point. You can use that point to get access to the system', 0, 400, 0, NULL, CAST(N'2025-10-13T05:49:53.3064203' AS DateTime2), 2, NULL, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[Configuration_Reward] OFF
GO
SET IDENTITY_INSERT [dbo].[Configuration_RewardBadge] ON 
GO
INSERT [dbo].[Configuration_RewardBadge] ([Id], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [IsActive]) VALUES (6, N'Medium Plus', N'Start your journey', CAST(N'2025-10-12T10:59:56.1010182' AS DateTime2), 2, NULL, NULL, 1)
GO
INSERT [dbo].[Configuration_RewardBadge] ([Id], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [IsActive]) VALUES (7, N'Super Plus', N'Start your journey', CAST(N'2025-10-12T11:08:24.0225801' AS DateTime2), 2, NULL, NULL, 1)
GO
INSERT [dbo].[Configuration_RewardBadge] ([Id], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [IsActive]) VALUES (8, N'Premium Plus', N'Your are at pick point of your journey. Enjoy the facility', CAST(N'2025-10-12T11:08:31.7891887' AS DateTime2), 2, CAST(N'2025-10-13T04:37:53.6910274' AS DateTime2), 2, 1)
GO
INSERT [dbo].[Configuration_RewardBadge] ([Id], [Name], [Description], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [IsActive]) VALUES (9, N'Basic Plus', N'Start your journey', CAST(N'2025-10-13T05:55:16.9244465' AS DateTime2), 2, NULL, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[Configuration_RewardBadge] OFF
GO
SET IDENTITY_INSERT [dbo].[Configuration_SmartRxAcronym] ON 
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (1, N'', N'A1A', N'', NULL, NULL, NULL, NULL, N'Alpha-1 Antitrypsin')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (2, N'', N'A1c', N'', NULL, NULL, NULL, NULL, N'Hemoglobin A1c')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (3, N'', N'AB', N'', NULL, NULL, NULL, NULL, N'Antibody')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (4, N'', N'ABG', N'', NULL, NULL, NULL, NULL, N'Arterial Blood Gas')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (5, N'', N'ABRH', N'', NULL, NULL, NULL, NULL, N'ABO Group and Rh Type')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (6, N'', N'ABT', N'', NULL, NULL, NULL, NULL, N'Antibody Titer')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (7, N'', N'ACA', N'', NULL, NULL, NULL, NULL, N'Anti-Cardiolipin Antibodies')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (8, N'', N'ACE', N'', NULL, NULL, NULL, NULL, N'Angiotensin Converting Enzyme')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (9, N'', N'ACID PHOS', N'', NULL, NULL, NULL, NULL, N'Acid Phosphatase')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (10, N'', N'ACP', N'', NULL, NULL, NULL, NULL, N'Acid Phosphatase')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (11, N'', N'ACT', N'', NULL, NULL, NULL, NULL, N'Activated Clotting Time')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (12, N'', N'ACTH', N'', NULL, NULL, NULL, NULL, N'Adrenocorticotropic Hormone')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (13, N'', N'ADA', N'', NULL, NULL, NULL, NULL, N'Adenosine Deaminase')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (14, N'', N'AFB', N'', NULL, NULL, NULL, NULL, N'Acid-Fast Bacillus')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (15, N'', N'AFLM', N'', NULL, NULL, NULL, NULL, N'Amniostat')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (16, N'', N'AFP', N'', NULL, NULL, NULL, NULL, N'Alpha Fetoprotein')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (17, N'', N'AG', N'', NULL, NULL, NULL, NULL, N'Antigen')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (18, N'', N'ALA', N'', NULL, NULL, NULL, NULL, N'Aminolevulinic Acid')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (19, N'', N'Alb', N'', NULL, NULL, NULL, NULL, N'Albumin')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (20, N'', N'Alk Phos', N'', NULL, NULL, NULL, NULL, N'Alkaline Phosphatase')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (21, N'', N'ALP', N'', NULL, NULL, NULL, NULL, N'Alkaline Phosphatase')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (22, N'', N'ANA', N'', NULL, NULL, NULL, NULL, N'Antinuclear Antibody')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (23, N'', N'Anti-HBc', N'', NULL, NULL, NULL, NULL, N'Hepatitis B Core Antibodies')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (24, N'', N'Anti-HBe', N'', NULL, NULL, NULL, NULL, N'Hepatitis Be Virus Antibody')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (25, N'', N'Anti-HBs', N'', NULL, NULL, NULL, NULL, N'Hepatitis B Surface Antibody')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (26, N'', N'Anti-HCV', N'', NULL, NULL, NULL, NULL, N'Hepatitis C Antibody')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (27, N'', N'APT', N'', NULL, NULL, NULL, NULL, N'APT – Stool for Fetal Hemoglobin')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (28, N'', N'aPTT', N'', NULL, NULL, NULL, NULL, N'Activated Partial Thrombin Time')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (29, N'', N'ASN', N'', NULL, NULL, NULL, NULL, N'Antibody Screen')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (30, N'', N'ASO', N'', NULL, NULL, NULL, NULL, N'Antistreptolysin-O')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (31, N'', N'AT III', N'', NULL, NULL, NULL, NULL, N'Antithrombin-III Activity')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (32, N'', N'B12', N'', NULL, NULL, NULL, NULL, N'Vitamin B12')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (33, N'', N'BMP', N'', NULL, NULL, NULL, NULL, N'Basic Metabolic Profile')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (34, N'', N'BNP', N'', NULL, NULL, NULL, NULL, N'Brain Natriuretic Peptide')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (35, NULL, N'BP', NULL, NULL, NULL, NULL, NULL, N'Blood Pressure')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (36, N'', N'BUN', N'', NULL, NULL, NULL, NULL, N'Blood Urea Nitrogen')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (37, N'', N'C1', N'', NULL, NULL, NULL, NULL, N'Complement C1, Functional')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (38, N'', N'C1Q', N'', NULL, NULL, NULL, NULL, N'C1Q Binding Assay')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (39, N'', N'C2', N'', NULL, NULL, NULL, NULL, N'Complement C2')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (40, N'', N'C3', N'', NULL, NULL, NULL, NULL, N'Complement C3')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (41, N'', N'C4', N'', NULL, NULL, NULL, NULL, N'Complement C4')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (42, N'', N'Ca', N'', NULL, NULL, NULL, NULL, N'Calcium')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (43, N'', N'CBC', N'', NULL, NULL, NULL, NULL, N'Complete Blood Count')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (44, N'', N'CBCD', N'', NULL, NULL, NULL, NULL, N'Complete Blood Count with Automated Differential')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (45, N'', N'CEA', N'', NULL, NULL, NULL, NULL, N'Carcinoembryonic Antigen')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (46, N'', N'CH50', N'', NULL, NULL, NULL, NULL, N'Complement Immunoassay, Total')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (47, N'', N'CK', N'', NULL, NULL, NULL, NULL, N'Creatine Kinase')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (48, N'', N'Cl', N'', NULL, NULL, NULL, NULL, N'Chloride')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (49, N'', N'CMB', N'', NULL, NULL, NULL, NULL, N'CKMB Panel')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (50, N'', N'CMP', N'', NULL, NULL, NULL, NULL, N'Comprehensive Metabolic Panel')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (51, N'', N'CMV', N'', NULL, NULL, NULL, NULL, N'Cytomegalovirus')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (52, N'', N'CMV Ag', N'', NULL, NULL, NULL, NULL, N'CMV Antigenemia')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (53, NULL, N'CO', NULL, NULL, NULL, NULL, NULL, N'Carbon Monoxide')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (54, N'', N'COHB', N'', NULL, NULL, NULL, NULL, N'Carboxyhemoglobin')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (55, N'', N'CONABO', N'', NULL, NULL, NULL, NULL, N'Confirmatory Type')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (56, N'', N'CPK', N'', NULL, NULL, NULL, NULL, N'Creatine Phosphokinase')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (57, N'', N'CRCL, CrCl', N'', NULL, NULL, NULL, NULL, N'Creatinine Clearance')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (58, N'', N'CRD', N'', NULL, NULL, NULL, NULL, N'Cord Type and DAT')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (59, N'', N'CREAT, Cr', N'Creatinine is a waste product from muscle and protein metabolism, released steadily by the body.', NULL, NULL, NULL, NULL, N'Creatinine')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (60, N'', N'CRP', N'', NULL, NULL, NULL, NULL, N'C-Reactive Protein')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (61, N'', N'Cu', N'', NULL, NULL, NULL, NULL, N'Copper')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (62, N'', N'D Bil', N'', NULL, NULL, NULL, NULL, N'Direct Bilirubin')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (63, N'', N'DAT', N'', NULL, NULL, NULL, NULL, N'Direct Antiglobulin (Coombs) Test')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (64, N'', N'DCAS', N'', NULL, NULL, NULL, NULL, N'DAT and AB Screen')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (65, N'', N'DHEA', N'', NULL, NULL, NULL, NULL, N'Dehydroepiandrosterone')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (66, N'', N'DHEAS', N'', NULL, NULL, NULL, NULL, N'Dehydroepiandrosterone-Sulfate')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (67, N'', N'DIFM', N'', NULL, NULL, NULL, NULL, N'Differential')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (68, N'', N'Dig', N'', NULL, NULL, NULL, NULL, N'Digoxin')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (69, N'', N'EOS', N'', NULL, NULL, NULL, NULL, N'Eosinophils')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (70, N'', N'EPO', N'', NULL, NULL, NULL, NULL, N'Erythropoietin')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (71, N'', N'ERA', N'', NULL, NULL, NULL, NULL, N'Estrogen Receptor Assay')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (72, N'', N'ESR', N'', NULL, NULL, NULL, NULL, N'Erythrocyte Sedimentation Rate')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (73, N'', N'ETOH', N'', NULL, NULL, NULL, NULL, N'Ethanol')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (74, N'', N'FBS', N'', NULL, NULL, NULL, NULL, N'Fasting Blood Sugar (Glucose)')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (75, N'', N'Fe', N'', NULL, NULL, NULL, NULL, N'Total Iron')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (76, N'', N'FEP', N'', NULL, NULL, NULL, NULL, N'Free Erythrocyte Protoporphyrin')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (77, N'', N'FFN', N'', NULL, NULL, NULL, NULL, N'Fetal Fibronectin')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (78, N'', N'Fol', N'', NULL, NULL, NULL, NULL, N'Folate')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (79, N'', N'FSH/LH', N'', NULL, NULL, NULL, NULL, N'FSH/LH Evaluation')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (80, N'', N'FT3', N'', NULL, NULL, NULL, NULL, N'Free T3')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (81, N'', N'FT4', N'', NULL, NULL, NULL, NULL, N'Free Thyroxine')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (82, N'', N'G2PP', N'', NULL, NULL, NULL, NULL, N'2 Hour Postprandial Glucose')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (83, N'', N'G-6-PD', N'', NULL, NULL, NULL, NULL, N'Glucose-6-Phosphate Dehydrogenase')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (84, N'', N'Gamma GT', N'', NULL, NULL, NULL, NULL, N'Gamma Glutamyl Transferase')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (85, N'', N'GCT', N'', NULL, NULL, NULL, NULL, N'Glucose Challenge Test')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (86, N'', N'GDS', N'', NULL, NULL, NULL, NULL, N'Gestational Diabetes Screen')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (87, N'', N'GGT', N'', NULL, NULL, NULL, NULL, N'Gamma Glutamyl Transferase')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (88, N'', N'GH', N'', NULL, NULL, NULL, NULL, N'Growth Hormone')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (89, N'', N'Glu', N'', NULL, NULL, NULL, NULL, N'Glucose')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (90, N'', N'H&H (or H/H)', N'', NULL, NULL, NULL, NULL, N'Hemoglobin and Hematocrit')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (91, N'', N'Hapto', N'', NULL, NULL, NULL, NULL, N'Haptoglobin')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (92, N'', N'HbA1c', N'', NULL, NULL, NULL, NULL, N'Hemoglobin A1c')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (93, N'', N'HBeAb', N'', NULL, NULL, NULL, NULL, N'Hepatitis Be Virus Antibody')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (94, N'', N'HBeAg', N'', NULL, NULL, NULL, NULL, N'Hepatitis Be Virus Antigen')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (95, N'', N'HBsAb', N'', NULL, NULL, NULL, NULL, N'Hepatitis B Surface Antibody')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (96, N'', N'HBsAg', N'', NULL, NULL, NULL, NULL, N'Hepatitis B Surface Antigen')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (97, N'', N'HBV titers', N'', NULL, NULL, NULL, NULL, N'Hepatitis B Surface Antibody')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (98, N'', N'hCG', N'', NULL, NULL, NULL, NULL, N'Human Chorionic Gonadotropin')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (99, N'', N'hCG (urine)', N'', NULL, NULL, NULL, NULL, N'Urine Pregnancy')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (100, N'', N'HCT', N'', NULL, NULL, NULL, NULL, N'Hematocrit')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (101, N'', N'HDL', N'', NULL, NULL, NULL, NULL, N'High Density Lipoprotein')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (102, N'', N'HFP', N'', NULL, NULL, NULL, NULL, N'Hepatic Function Panel')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (103, N'', N'HGB', N'', NULL, NULL, NULL, NULL, N'Hemoglobin')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (104, N'', N'HgbA1c', N'', NULL, NULL, NULL, NULL, N'Hemoglobin A1c')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (105, N'', N'HGH', N'', NULL, NULL, NULL, NULL, N'Human Growth Hormone')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (106, N'', N'HIAA', N'', NULL, NULL, NULL, NULL, N'5-Hydroxyindoleacetic Acid')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (107, N'', N'HIV', N'', NULL, NULL, NULL, NULL, N'Human Immunodeficiency Virus')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (108, N'', N'HPV', N'', NULL, NULL, NULL, NULL, N'Human Papilloma Virus')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (109, N'', N'HSV', N'', NULL, NULL, NULL, NULL, N'Herpes Simplex Virus')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (110, N'', N'iCa', N'', NULL, NULL, NULL, NULL, N'Ionized Calcium')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (111, N'', N'IEP', N'', NULL, NULL, NULL, NULL, N'Immunoelectrophoresis')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (112, N'', N'IFE', N'', NULL, NULL, NULL, NULL, N'Immunofixation Electrophoresis')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (113, N'', N'IgA', N'', NULL, NULL, NULL, NULL, N'Immunoglobulin A')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (114, N'', N'IgE', N'', NULL, NULL, NULL, NULL, N'Immunoglobulin E')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (115, N'', N'IGF', N'', NULL, NULL, NULL, NULL, N'Insulin-Like Growth Factor-I')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (116, N'', N'IgG', N'', NULL, NULL, NULL, NULL, N'Immunoglobulin G')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (117, N'', N'IgM', N'', NULL, NULL, NULL, NULL, N'Immunoglobulin M')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (118, N'', N'INR', N'', NULL, NULL, NULL, NULL, N'Prothrombin Time')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (119, N'', N'Jo-1', N'', NULL, NULL, NULL, NULL, N'Jo-1 Antibody')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (120, N'', N'KB', N'', NULL, NULL, NULL, NULL, N'Kleihauer-Betke')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (121, N'', N'K', N'', NULL, NULL, NULL, NULL, N'Potassium')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (122, NULL, N'Pb', NULL, NULL, NULL, NULL, NULL, N'Lead')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (123, N'', N'L/S', N'', NULL, NULL, NULL, NULL, N'Lecithin/Sphingomyelin Ratio')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (124, N'', N'LD', N'', NULL, NULL, NULL, NULL, N'Lactate Dehydrogenase')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (125, N'', N'LDH', N'', NULL, NULL, NULL, NULL, N'Lactate Dehydrogenase')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (126, N'', N'LFT', N'', NULL, NULL, NULL, NULL, N'Liver Function Tests')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (127, N'', N'LH', N'', NULL, NULL, NULL, NULL, N'Luteinizing Hormone')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (128, N'', N'Li+, Li', N'', NULL, NULL, NULL, NULL, N'Lithium')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (129, N'', N'MetHb/MetHgb', N'', NULL, NULL, NULL, NULL, N'Methemoglobin')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (130, N'', N'Mg, Mag', N'', NULL, NULL, NULL, NULL, N'Magnesium')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (131, N'', N'MIC', N'', NULL, NULL, NULL, NULL, N'Minimum Inhibitory Concentration')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (132, N'', N'MMA', N'', NULL, NULL, NULL, NULL, N'Methylmalonic Acid')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (133, N'', N'Mn', N'', NULL, NULL, NULL, NULL, N'Manganese')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (134, N'', N'Mono', N'', NULL, NULL, NULL, NULL, N'Mononucleosis')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (135, N'', N'NA', N'', NULL, NULL, NULL, NULL, N'Sodium')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (136, N'', N'NEOTY', N'', NULL, NULL, NULL, NULL, N'Neonate Type and DAT')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (137, N'', N'NEOXM', N'', NULL, NULL, NULL, NULL, N'Neonate Type and XM')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (138, NULL, N'NH3', NULL, NULL, NULL, NULL, NULL, N'Ammonia')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (139, N'NTR', N'NTR', N'', NULL, NULL, NULL, NULL, N'Newborn Type and Rh')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (140, N'', N'PAP', N'', NULL, NULL, NULL, NULL, N'Pap Smear/Pap Smear & HPV DNA Test/Prostatic Acid Phosphatase')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (141, N'', N'PBG', N'', NULL, NULL, NULL, NULL, N'Porphobilinogen')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (142, N'', N'PCP', N'', NULL, NULL, NULL, NULL, N'Phencyclidine')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (143, N'', N'PEP', N'', NULL, NULL, NULL, NULL, N'Protein Electrophoresis')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (144, N'', N'PG', N'', NULL, NULL, NULL, NULL, N'Phosphatidyl glycerol')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (145, N'', N'PHOS', N'', NULL, NULL, NULL, NULL, N'Phosphorus')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (146, N'', N'PKU', N'', NULL, NULL, NULL, NULL, N'Phenylketonuria')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (147, N'', N'PLT, PLT Ct', N'', NULL, NULL, NULL, NULL, N'Platelet Count')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (148, N'', N'PO4', N'', NULL, NULL, NULL, NULL, N'Phosphorus')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (149, N'', N'PRL', N'', NULL, NULL, NULL, NULL, N'Prolactin')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (150, N'', N'PSA', N'', NULL, NULL, NULL, NULL, N'Prostate Specific Antigen')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (151, N'', N'PT', N'', NULL, NULL, NULL, NULL, N'Prothrombin Time')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (152, N'', N'PTH', N'', NULL, NULL, NULL, NULL, N'Parathyroid Hormone')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (153, N'', N'PTT', N'', NULL, NULL, NULL, NULL, N'Partial Thromboplastin Time')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (154, N'', N'QIG', N'', NULL, NULL, NULL, NULL, N'Quantitative Immunoglobulins')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (155, N'', N'RBC', N'', NULL, NULL, NULL, NULL, N'Red Blood Cell')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (156, N'', N'RF', N'', NULL, NULL, NULL, NULL, N'Rheumatoid Factor')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (157, N'', N'RFP', N'', NULL, NULL, NULL, NULL, N'Renal Function Panel')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (158, N'', N'RhIG (Eval)', N'', NULL, NULL, NULL, NULL, N'RhIG Evaluation')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (159, N'', N'RPR', N'', NULL, NULL, NULL, NULL, N'Rapid Plasma Reagin')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (160, N'', N'RSV', N'', NULL, NULL, NULL, NULL, N'Respiratory Syncytial Virus')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (161, N'', N'Scl-70', N'', NULL, NULL, NULL, NULL, N'Scleroderma Antibody')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (162, N'', N'SHBG', N'', NULL, NULL, NULL, NULL, N'Sex Hormone-Binding Globulin')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (163, N'', N'SIFE', N'', NULL, NULL, NULL, NULL, N'Serum Immunofixation')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (164, N'', N'Electrophoresis', N'', NULL, NULL, NULL, NULL, N'Electrophoresis')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (165, N'', N'Siro', N'', NULL, NULL, NULL, NULL, N'Sirolimus')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (166, N'', N'SPEP', N'', NULL, NULL, NULL, NULL, N'Serum Protein Electrophoresis')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (167, N'', N'SSA', N'', NULL, NULL, NULL, NULL, N'Sjögren’s Syndrome A Antibody')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (168, N'', N'SSB', N'', NULL, NULL, NULL, NULL, N'Sjögren’s Syndrome B Antibody')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (169, N'', N'SSDNA', N'', NULL, NULL, NULL, NULL, N'Single Stranded DNA')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (170, N'', N'T Bil', N'', NULL, NULL, NULL, NULL, N'Total Bilirubin')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (171, N'', N'T3', N'', NULL, NULL, NULL, NULL, N'Triiodothyronine')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (172, N'', N'T4', N'', NULL, NULL, NULL, NULL, N'Thyroxine')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (173, N'', N'Tacro', N'', NULL, NULL, NULL, NULL, N'Tacrolimus')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (174, N'', N'TBG', N'', NULL, NULL, NULL, NULL, N'Thyroxine Binding Globulin')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (175, N'', N'TGL', N'', NULL, NULL, NULL, NULL, N'Triglycerides')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (176, N'', N'Theo', N'', NULL, NULL, NULL, NULL, N'Theophylline')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (177, N'', N'TIBC', N'', NULL, NULL, NULL, NULL, N'Total Iron Binding Capacity')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (178, N'', N'TP', N'', NULL, NULL, NULL, NULL, N'Total Protein')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (179, N'', N'TREP', N'', NULL, NULL, NULL, NULL, N'Treponemal Antibodies')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (180, N'', N'Trep Ab', N'', NULL, NULL, NULL, NULL, N'Treponemal Antibodies')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (181, N'', N'TRH', N'', NULL, NULL, NULL, NULL, N'Thyrotropin Releasing Hormone')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (182, N'', N'Trig', N'', NULL, NULL, NULL, NULL, N'Triglycerides')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (183, N'', N'TRXN', N'', NULL, NULL, NULL, NULL, N'Transfusion Reaction Evaluation')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (184, N'', N'TSH', N'', NULL, NULL, NULL, NULL, N'Thyroid Stimulating Hormone')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (185, N'', N'TSI', N'', NULL, NULL, NULL, NULL, N'Thyroid Stimulating Immunoglobulin')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (186, N'', N'TT', N'', NULL, NULL, NULL, NULL, N'Thrombin Time')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (187, N'', N'TYSC', N'', NULL, NULL, NULL, NULL, N'Type and Screen')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (188, N'', N'UIFE', N'', NULL, NULL, NULL, NULL, N'Urine Immunofixation')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (189, NULL, N'UPE, UPEP, Ur Prot Elect', NULL, NULL, NULL, NULL, NULL, N'Electrophoresis')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (190, N'', N'VCA', N'', NULL, NULL, NULL, NULL, N'Viral Capsid Antigen')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (191, N'', N'VDRL', N'', NULL, NULL, NULL, NULL, N'Venereal Disease Reference Lab (Syphilis Test)')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (192, N'', N'Vit A', N'', NULL, NULL, NULL, NULL, N'Vitamin A (Retinol)')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (193, N'', N'Vit B1', N'', NULL, NULL, NULL, NULL, N'Vitamin B1 (Thiamine)')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (194, N'', N'Vit B12', N'', NULL, NULL, NULL, NULL, N'Vitamin B12')
GO
INSERT [dbo].[Configuration_SmartRxAcronym] ([Id], [Acronym], [Abbreviation], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Elaboration]) VALUES (195, N'', N'Vit B2', N'', NULL, NULL, NULL, NULL, N'Vitamin B2 (Riboflavin)')
GO
SET IDENTITY_INSERT [dbo].[Configuration_SmartRxAcronym] OFF
GO
SET IDENTITY_INSERT [dbo].[Configuration_Tags] ON 
GO
INSERT [dbo].[Configuration_Tags] ([Id], [TagShortName], [TagDescription], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [TagPrescriptionSection]) VALUES (1, N'WARMWATER', N'About drinking warm water, doctor advised to rinse with warm water', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Configuration_Tags] ([Id], [TagShortName], [TagDescription], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [TagPrescriptionSection]) VALUES (2, N'COLDWATER', N'Do not use cold water', CAST(N'2025-06-03T12:00:00.0000000' AS DateTime2), 2, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Configuration_Tags] OFF
GO
SET IDENTITY_INSERT [dbo].[Configuration_Unit] ON 
GO
INSERT [dbo].[Configuration_Unit] ([Id], [Code], [Name], [MeasurementUnit], [Details], [Description], [Type], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (1, N'0001', N'Blood Pressure', N'mmHg', N'millimeters of mercury', N'Test', N'Vital', CAST(N'2025-06-02T11:30:01.8666667' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_Unit] ([Id], [Code], [Name], [MeasurementUnit], [Details], [Description], [Type], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (2, N'0002', N'Body Temperature', N'°C', N'Celsius', N'Test', N'Vital', CAST(N'2025-06-02T11:30:01.8766667' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_Unit] ([Id], [Code], [Name], [MeasurementUnit], [Details], [Description], [Type], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (3, N'0003', N'Body Temperature', N'°F', N'Fahrenheit', N'Test', N'Vital', CAST(N'2025-06-02T11:30:01.8800000' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_Unit] ([Id], [Code], [Name], [MeasurementUnit], [Details], [Description], [Type], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (4, N'0004', N'Pulse Rate (Heart Rate)', N'bpm', N'beats per minute', N'Test', N'Vital', CAST(N'2025-06-02T11:30:01.8800000' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_Unit] ([Id], [Code], [Name], [MeasurementUnit], [Details], [Description], [Type], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (5, N'0005', N'Respiration Rate', N'breaths/min', N'breaths per minute', N'Test', N'Vital', CAST(N'2025-06-02T11:30:01.8833333' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_Unit] ([Id], [Code], [Name], [MeasurementUnit], [Details], [Description], [Type], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (6, N'0006', N'Blood Oxygen (SpO2)', N'%', N'percentage saturation', N'Test', N'Vital', CAST(N'2025-06-02T11:30:01.8833333' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_Unit] ([Id], [Code], [Name], [MeasurementUnit], [Details], [Description], [Type], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (7, N'0007', N'Weight', N'kg', N'kilograms', N'Test', N'Vital', CAST(N'2025-06-02T11:30:01.8866667' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_Unit] ([Id], [Code], [Name], [MeasurementUnit], [Details], [Description], [Type], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (8, N'0008', N'Weight', N'lb', N'pounds', N'Test', N'Vital', CAST(N'2025-06-02T11:30:01.8866667' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_Unit] ([Id], [Code], [Name], [MeasurementUnit], [Details], [Description], [Type], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (9, N'0009', N'Blood Glucose Level', N'mg/dL', N'US', N'Test', N'Vital', CAST(N'2025-06-02T11:30:01.8900000' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_Unit] ([Id], [Code], [Name], [MeasurementUnit], [Details], [Description], [Type], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (10, N'0010', N'Blood Glucose Level', N'mmol/L', N'International', N'Test', N'Vital', CAST(N'2025-06-02T11:30:01.8900000' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_Unit] ([Id], [Code], [Name], [MeasurementUnit], [Details], [Description], [Type], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (11, N'0011', N'Body Mass Index (BMI)', N'kg/m²', N'kilograms per square meter', N'Test', N'Vital', CAST(N'2025-06-02T11:30:01.8933333' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_Unit] ([Id], [Code], [Name], [MeasurementUnit], [Details], [Description], [Type], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (17, N'0012', N'Taka', N'৳', N'Taka', N'''''', N'Money', CAST(N'2025-06-15T00:00:00.0000000' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_Unit] ([Id], [Code], [Name], [MeasurementUnit], [Details], [Description], [Type], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (18, N'0013', N'Dollar', N'$', N'Dollar', NULL, N'Money', CAST(N'2025-06-15T00:00:00.0000000' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_Unit] ([Id], [Code], [Name], [MeasurementUnit], [Details], [Description], [Type], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (19, N'0014', N'Miligram', N'mg', N'Miligram', NULL, N'Strength/Weight', CAST(N'2025-06-15T00:00:00.0000000' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_Unit] ([Id], [Code], [Name], [MeasurementUnit], [Details], [Description], [Type], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (20, N'0015', N'Mililitre', N'ml', N'Mililitre', NULL, N'Strength/Weight', CAST(N'2025-06-15T00:00:00.0000000' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_Unit] ([Id], [Code], [Name], [MeasurementUnit], [Details], [Description], [Type], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (21, N'0016', N'Height', N'ftin', N'Feet', NULL, N'Vital', CAST(N'2025-07-26T00:00:00.0000000' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Configuration_Unit] ([Id], [Code], [Name], [MeasurementUnit], [Details], [Description], [Type], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (22, N'0017', N'Height', N'cm', N'Centimeter', NULL, N'Vital', CAST(N'2025-07-19T00:00:00.0000000' AS DateTime2), 2, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Configuration_Unit] OFF
GO
SET IDENTITY_INSERT [dbo].[Configuration_Vital] ON 
GO
INSERT [dbo].[Configuration_Vital] ([Id], [Code], [Name], [Description], [ApplicableEntity], [UnitId], [LowRange], [LowStatus], [MidRange], [MidStatus], [MidNextRange], [MidNextStatus], [HighRange], [HighStatus], [ExtremeRange], [ExtremeStatus], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (64, N'01', N'Blood Pressure', N'', N'Diastolic', 1, CAST(80.00 AS Decimal(5, 2)), N'Low', CAST(80.00 AS Decimal(5, 2)), N'Normal', CAST(90.00 AS Decimal(5, 2)), N'Normal', CAST(90.00 AS Decimal(5, 2)), N'High', CAST(90.00 AS Decimal(5, 2)), N'Stage 2', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Configuration_Vital] ([Id], [Code], [Name], [Description], [ApplicableEntity], [UnitId], [LowRange], [LowStatus], [MidRange], [MidStatus], [MidNextRange], [MidNextStatus], [HighRange], [HighStatus], [ExtremeRange], [ExtremeStatus], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (65, N'02', N'Blood Pressure', N'', N'Systolic', 1, CAST(120.00 AS Decimal(5, 2)), N'Low', CAST(120.00 AS Decimal(5, 2)), N'Normal', CAST(130.00 AS Decimal(5, 2)), N'Normal', CAST(130.00 AS Decimal(5, 2)), N'High', CAST(140.00 AS Decimal(5, 2)), N'Stage 2', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Configuration_Vital] ([Id], [Code], [Name], [Description], [ApplicableEntity], [UnitId], [LowRange], [LowStatus], [MidRange], [MidStatus], [MidNextRange], [MidNextStatus], [HighRange], [HighStatus], [ExtremeRange], [ExtremeStatus], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (66, N'03', N'Body Temperature', N'', N'Farenheit', 3, CAST(98.60 AS Decimal(5, 2)), N'Low', CAST(98.60 AS Decimal(5, 2)), N'Normal', CAST(100.40 AS Decimal(5, 2)), N'Normal', CAST(100.40 AS Decimal(5, 2)), N'High', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Configuration_Vital] ([Id], [Code], [Name], [Description], [ApplicableEntity], [UnitId], [LowRange], [LowStatus], [MidRange], [MidStatus], [MidNextRange], [MidNextStatus], [HighRange], [HighStatus], [ExtremeRange], [ExtremeStatus], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (67, N'04', N'Body Temperature', N'', N'Degree', 2, CAST(36.50 AS Decimal(5, 2)), N'Low', CAST(37.00 AS Decimal(5, 2)), N'Normal', CAST(37.50 AS Decimal(5, 2)), N'Normal', CAST(37.50 AS Decimal(5, 2)), N'High', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Configuration_Vital] ([Id], [Code], [Name], [Description], [ApplicableEntity], [UnitId], [LowRange], [LowStatus], [MidRange], [MidStatus], [MidNextRange], [MidNextStatus], [HighRange], [HighStatus], [ExtremeRange], [ExtremeStatus], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (68, N'05', N'Pulse Rate', N'Heart Rate', N'BPM', 4, CAST(40.00 AS Decimal(5, 2)), N'Low', CAST(60.00 AS Decimal(5, 2)), N'Normal', CAST(60.00 AS Decimal(5, 2)), N'Normal', CAST(100.00 AS Decimal(5, 2)), N'High', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Configuration_Vital] ([Id], [Code], [Name], [Description], [ApplicableEntity], [UnitId], [LowRange], [LowStatus], [MidRange], [MidStatus], [MidNextRange], [MidNextStatus], [HighRange], [HighStatus], [ExtremeRange], [ExtremeStatus], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (69, N'06', N'Respiratory Rate', N'', N'Adults', 5, CAST(12.00 AS Decimal(5, 2)), N'Low', CAST(16.00 AS Decimal(5, 2)), N'Normal', CAST(16.00 AS Decimal(5, 2)), N'Normal', CAST(16.00 AS Decimal(5, 2)), N'High', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Configuration_Vital] ([Id], [Code], [Name], [Description], [ApplicableEntity], [UnitId], [LowRange], [LowStatus], [MidRange], [MidStatus], [MidNextRange], [MidNextStatus], [HighRange], [HighStatus], [ExtremeRange], [ExtremeStatus], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (70, N'07', N'Respiratory Rate', N'', N'Infants', 5, CAST(30.00 AS Decimal(5, 2)), N'Low', CAST(60.00 AS Decimal(5, 2)), N'Normal', CAST(60.00 AS Decimal(5, 2)), N'Normal', CAST(60.00 AS Decimal(5, 2)), N'High', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Configuration_Vital] ([Id], [Code], [Name], [Description], [ApplicableEntity], [UnitId], [LowRange], [LowStatus], [MidRange], [MidStatus], [MidNextRange], [MidNextStatus], [HighRange], [HighStatus], [ExtremeRange], [ExtremeStatus], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (71, N'08', N'Respiratory Rate', N'', N'Kids', 5, CAST(18.00 AS Decimal(5, 2)), N'Low', CAST(30.00 AS Decimal(5, 2)), N'Normal', CAST(30.00 AS Decimal(5, 2)), N'Normal', CAST(30.00 AS Decimal(5, 2)), N'High', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Configuration_Vital] ([Id], [Code], [Name], [Description], [ApplicableEntity], [UnitId], [LowRange], [LowStatus], [MidRange], [MidStatus], [MidNextRange], [MidNextStatus], [HighRange], [HighStatus], [ExtremeRange], [ExtremeStatus], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (72, N'09', N'Blood Oxygen', N'', N'Oxygen Saturation (SpO2)', 6, CAST(95.00 AS Decimal(5, 2)), N'Low', CAST(100.00 AS Decimal(5, 2)), N'Normal', CAST(100.00 AS Decimal(5, 2)), N'Normal', CAST(100.00 AS Decimal(5, 2)), N'High', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Configuration_Vital] ([Id], [Code], [Name], [Description], [ApplicableEntity], [UnitId], [LowRange], [LowStatus], [MidRange], [MidStatus], [MidNextRange], [MidNextStatus], [HighRange], [HighStatus], [ExtremeRange], [ExtremeStatus], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (73, N'10', N'Blood Glucose', N'', N'Children (under 6 yrs)', 9, CAST(100.00 AS Decimal(5, 2)), N'Low', CAST(180.00 AS Decimal(5, 2)), N'Normal', CAST(180.00 AS Decimal(5, 2)), N'Normal', NULL, N'High', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Configuration_Vital] ([Id], [Code], [Name], [Description], [ApplicableEntity], [UnitId], [LowRange], [LowStatus], [MidRange], [MidStatus], [MidNextRange], [MidNextStatus], [HighRange], [HighStatus], [ExtremeRange], [ExtremeStatus], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (74, N'37', N'BMI', N'Body Mass Index', N'Weight Status', 11, CAST(18.50 AS Decimal(5, 2)), N'Low', CAST(24.90 AS Decimal(5, 2)), N'Normal', CAST(30.00 AS Decimal(5, 2)), N'Overweight', CAST(30.00 AS Decimal(5, 2)), N'High', CAST(30.00 AS Decimal(5, 2)), N'', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Configuration_Vital] ([Id], [Code], [Name], [Description], [ApplicableEntity], [UnitId], [LowRange], [LowStatus], [MidRange], [MidStatus], [MidNextRange], [MidNextStatus], [HighRange], [HighStatus], [ExtremeRange], [ExtremeStatus], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (75, N'38', N'Weight', N'', N'Male', 7, CAST(70.00 AS Decimal(5, 2)), N'Low', CAST(90.00 AS Decimal(5, 2)), N'Normal', CAST(90.00 AS Decimal(5, 2)), N'Normal', CAST(90.00 AS Decimal(5, 2)), N'High', NULL, N'', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Configuration_Vital] ([Id], [Code], [Name], [Description], [ApplicableEntity], [UnitId], [LowRange], [LowStatus], [MidRange], [MidStatus], [MidNextRange], [MidNextStatus], [HighRange], [HighStatus], [ExtremeRange], [ExtremeStatus], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (76, N'39', N'Weight', N'', N'Female', 7, CAST(50.00 AS Decimal(5, 2)), N'Low', CAST(70.00 AS Decimal(5, 2)), N'Normal', CAST(70.00 AS Decimal(5, 2)), N'Normal', CAST(70.00 AS Decimal(5, 2)), N'High', NULL, N'', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Configuration_Vital] ([Id], [Code], [Name], [Description], [ApplicableEntity], [UnitId], [LowRange], [LowStatus], [MidRange], [MidStatus], [MidNextRange], [MidNextStatus], [HighRange], [HighStatus], [ExtremeRange], [ExtremeStatus], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (77, N'11', N'Blood Glucose', N'Diabetes', N'Fasting', 9, CAST(70.00 AS Decimal(5, 2)), N'Low', CAST(99.00 AS Decimal(5, 2)), N'Normal', CAST(99.00 AS Decimal(5, 2)), N'Normal', CAST(99.00 AS Decimal(5, 2)), N'High', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Configuration_Vital] ([Id], [Code], [Name], [Description], [ApplicableEntity], [UnitId], [LowRange], [LowStatus], [MidRange], [MidStatus], [MidNextRange], [MidNextStatus], [HighRange], [HighStatus], [ExtremeRange], [ExtremeStatus], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (78, N'12', N'Blood Glucose', N'Diabetes', N'2 Hour after meal', 9, CAST(120.00 AS Decimal(5, 2)), N'Low', CAST(140.00 AS Decimal(5, 2)), N'Normal', CAST(140.00 AS Decimal(5, 2)), N'Normal', CAST(140.00 AS Decimal(5, 2)), N'High', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Configuration_Vital] ([Id], [Code], [Name], [Description], [ApplicableEntity], [UnitId], [LowRange], [LowStatus], [MidRange], [MidStatus], [MidNextRange], [MidNextStatus], [HighRange], [HighStatus], [ExtremeRange], [ExtremeStatus], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (79, N'13', N'Blood Glucose', N'Diabetes', N'Before meal', 9, CAST(100.00 AS Decimal(5, 2)), N'Low', CAST(125.00 AS Decimal(5, 2)), N'Normal', CAST(125.00 AS Decimal(5, 2)), N'Normal', CAST(125.00 AS Decimal(5, 2)), N'High', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Configuration_Vital] ([Id], [Code], [Name], [Description], [ApplicableEntity], [UnitId], [LowRange], [LowStatus], [MidRange], [MidStatus], [MidNextRange], [MidNextStatus], [HighRange], [HighStatus], [ExtremeRange], [ExtremeStatus], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (85, N'40', N'Height', N'Height', N'Female', 21, CAST(4.10 AS Decimal(5, 2)), N'Low', CAST(5.20 AS Decimal(5, 2)), N'Normal', CAST(5.20 AS Decimal(5, 2)), N'Normal', CAST(5.50 AS Decimal(5, 2)), N'High', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Configuration_Vital] ([Id], [Code], [Name], [Description], [ApplicableEntity], [UnitId], [LowRange], [LowStatus], [MidRange], [MidStatus], [MidNextRange], [MidNextStatus], [HighRange], [HighStatus], [ExtremeRange], [ExtremeStatus], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (86, N'41', N'Height', N'Height', N'Male', 21, CAST(5.30 AS Decimal(5, 2)), N'Low', CAST(5.50 AS Decimal(5, 2)), N'Normal', CAST(5.50 AS Decimal(5, 2)), N'Normal', CAST(5.90 AS Decimal(5, 2)), N'High', NULL, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Configuration_Vital] OFF
GO
SET IDENTITY_INSERT [dbo].[Configuration_VitalFAQ] ON 
GO
INSERT [dbo].[Configuration_VitalFAQ] ([Id], [Question], [Answer], [TagSearchKeyword], [IconFileName], [IconFilePath], [IconFileExtension], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [VitalId]) VALUES (1, N'রক্তের গ্লুকোজের মাত্রা কি?', N'ব্লাড গ্লুকোজ, যা ব্লাড সুগার নামেও পরিচিত, একটি গুরুত্বপূর্ণ অত্যাবশ্যক লক্ষণ এবং সামগ্রিক স্বাস্থ্যের একটি মূল সূচক। এটি যে কোনো নির্দিষ্ট সময়ে রক্তপ্রবাহে চিনির পরিমাণ এবং এটি আপনাকে আপনার বিপাকীয় অবস্থা এবং সম্ভাব্য স্বাস্থ্য ঝুঁকির কথা বলে।', N'ব্লাডগ্লুকোজ, ব্লাডসুগার, BloodGlucose, BloodSugar', NULL, NULL, NULL, CAST(N'2025-06-30T18:53:07.8933333' AS DateTime2), 2, NULL, NULL, 77)
GO
INSERT [dbo].[Configuration_VitalFAQ] ([Id], [Question], [Answer], [TagSearchKeyword], [IconFileName], [IconFilePath], [IconFileExtension], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [VitalId]) VALUES (2, N'রক্তে গ্লুকোজের মাত্রা কখন পরিমাপ করবেন?', N'যাদের ডায়াবেটিস ধরা পড়েছে তাদের জন্য, খাবারের আগে এবং শোবার সময় প্রতিদিন চার থেকে ছয়টি রিডিং নেওয়ার পরামর্শ দেওয়া হয়। আপনার ডাক্তার আপনার রক্তের গ্লুকোজের মাত্রা পরীক্ষা করার জন্য কোন সময়গুলি সেরা তা নির্ধারণ করতে আপনাকে সাহায্য করতে পারে। খাওয়ার পরে আপনার স্তরগুলি পরীক্ষা করাও গুরুত্বপূর্ণ এবং যে কোনও সময় আপনি মাথা ঘোরা, বিভ্রান্তি বা ক্লান্তির মতো উপসর্গগুলি অনুভব করেন - এগুলি সবই আপনার চিনির মাত্রায় ভারসাম্যহীনতা নির্দেশ করতে পারে।', N'ব্লাডগ্লুকোজ, ব্লাডসুগার, BloodGlucose, BloodSugar', NULL, NULL, NULL, CAST(N'2025-06-30T18:53:07.9000000' AS DateTime2), 2, NULL, NULL, 77)
GO
INSERT [dbo].[Configuration_VitalFAQ] ([Id], [Question], [Answer], [TagSearchKeyword], [IconFileName], [IconFilePath], [IconFileExtension], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [VitalId]) VALUES (3, N'স্বাভাবিক রক্তে শর্করার মাত্রা কত?', N'একটি সাধারণ মান ব্যক্তি থেকে ব্যক্তিতে সামান্য পরিবর্তিত হতে পারে, তবে একজন সুস্থ প্রাপ্তবয়স্ক নন-ডায়াবেটিক ব্যক্তির গড় পরিসীমা সাধারণত নিম্নলিখিত সীমার মধ্যে পড়ে: 70 থেকে 99 mg/dL (মিলিগ্রাম প্রতি ডেসিলিটার), যখন উপবাস থাকে, 140 mg/dL এর কম খাওয়ার দুই ঘন্টা পরে এবং খাবারের আগে 100 থেকে 125 mg/dL।', N'ব্লাডগ্লুকোজ, ব্লাডসুগার, BloodGlucose, BloodSugar', NULL, NULL, NULL, CAST(N'2025-06-30T18:53:07.9066667' AS DateTime2), 2, NULL, NULL, 77)
GO
INSERT [dbo].[Configuration_VitalFAQ] ([Id], [Question], [Answer], [TagSearchKeyword], [IconFileName], [IconFilePath], [IconFileExtension], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [VitalId]) VALUES (4, N'রক্তে গ্লুকোজের মাত্রা কীভাবে পরিমাপ করবেন?', N'বাড়িতে আপনার নিজের রক্তে গ্লুকোজের মাত্রা পরিমাপ করা ডায়াবেটিস ব্যবস্থাপনার একটি গুরুত্বপূর্ণ অংশ। আপনার রক্তে শর্করার পরিমাপ করতে আপনার একটি গ্লুকোমিটার এবং পরীক্ষার স্ট্রিপ প্রয়োজন। ফলাফলের নির্ভুলতা নিশ্চিত করতে পরীক্ষার আগে হাত ধুয়ে শুকিয়ে নিন। তারপর বিশ্লেষণের জন্য গ্লুকোমিটার মেশিনে পরীক্ষার স্ট্রিপে রাখার আগে আঙুলের ডগা থেকে কৈশিক রক্তের একটি ছোট ফোঁটা আঁকতে গ্লুকোমিটারের সাথে দেওয়া ফিঙ্গার প্রিকার ব্যবহার করুন।', N'ব্লাডগ্লুকোজ, ব্লাডসুগার, BloodGlucose, BloodSugar', NULL, NULL, NULL, CAST(N'2025-06-30T18:53:07.9133333' AS DateTime2), 2, NULL, NULL, 77)
GO
INSERT [dbo].[Configuration_VitalFAQ] ([Id], [Question], [Answer], [TagSearchKeyword], [IconFileName], [IconFilePath], [IconFileExtension], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [VitalId]) VALUES (5, N'উচ্চ গ্লুকোজ মাত্রা কি নির্দেশ করে?', N'উচ্চ গ্লুকোজ মাত্রা, যা হাইপারগ্লাইসেমিয়া নামেও পরিচিত, এমন একটি অবস্থা হিসাবে সংজ্ঞায়িত করা হয় যেখানে শরীরের রক্তে গ্লুকোজ বা চিনির মাত্রা বেড়ে যায়। এটি ডায়েট, ব্যায়ামের অভাব, নির্দিষ্ট ওষুধ বা পূর্ব-বিদ্যমান চিকিৎসা অবস্থা সহ বিভিন্ন কারণের কারণে হতে পারে। কিছু ক্ষেত্রে, উচ্চ গ্লুকোজ মাত্রা ডায়াবেটিস নির্দেশ করতে পারে এবং হালকাভাবে নেওয়া উচিত নয়।', N'ব্লাডগ্লুকোজ, ব্লাডসুগার, BloodGlucose, BloodSugar', NULL, NULL, NULL, CAST(N'2025-06-30T18:53:07.9200000' AS DateTime2), 2, NULL, NULL, 77)
GO
INSERT [dbo].[Configuration_VitalFAQ] ([Id], [Question], [Answer], [TagSearchKeyword], [IconFileName], [IconFilePath], [IconFileExtension], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [VitalId]) VALUES (6, N'কম গ্লুকোজ মাত্রা কি নির্দেশ করে?', N'নিম্ন গ্লুকোজ মাত্রা, যা হাইপোগ্লাইসেমিয়া নামেও পরিচিত, এর বিভিন্ন কারণ থাকতে পারে এবং এটি একটি অন্তর্নিহিত চিকিৎসা অবস্থার উপস্থিতি নির্দেশ করতে পারে। এটি ঘটে যখন একটি অপর্যাপ্ত সরবরাহ থাকে, বা শরীর দক্ষতার সাথে সঞ্চালিত শর্করা নিয়ন্ত্রণ করতে পারে না। এটি ডায়াবেটিস, হরমোনের ভারসাম্যহীনতা বা এমনকি কিছু ওষুধের কারণে হতে পারে যা রক্তে শর্করার ঘনত্বকে পরিবর্তন করে।', N'ব্লাডগ্লুকোজ, ব্লাডসুগার, BloodGlucose, BloodSugar', NULL, NULL, NULL, CAST(N'2025-06-30T18:53:07.9233333' AS DateTime2), 2, NULL, NULL, 77)
GO
INSERT [dbo].[Configuration_VitalFAQ] ([Id], [Question], [Answer], [TagSearchKeyword], [IconFileName], [IconFilePath], [IconFileExtension], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [VitalId]) VALUES (7, N'রক্তের গ্লুকোজের মাত্রা কি?', N'ব্লাড গ্লুকোজ, যা ব্লাড সুগার নামেও পরিচিত, একটি গুরুত্বপূর্ণ অত্যাবশ্যক লক্ষণ এবং সামগ্রিক স্বাস্থ্যের একটি মূল সূচক। এটি যে কোনো নির্দিষ্ট সময়ে রক্তপ্রবাহে চিনির পরিমাণ এবং এটি আপনাকে আপনার বিপাকীয় অবস্থা এবং সম্ভাব্য স্বাস্থ্য ঝুঁকির কথা বলে।', N'ব্লাডগ্লুকোজ, ব্লাডসুগার, BloodGlucose, BloodSugar', NULL, NULL, NULL, CAST(N'2025-06-30T18:53:32.7633333' AS DateTime2), 2, NULL, NULL, 78)
GO
INSERT [dbo].[Configuration_VitalFAQ] ([Id], [Question], [Answer], [TagSearchKeyword], [IconFileName], [IconFilePath], [IconFileExtension], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [VitalId]) VALUES (8, N'রক্তে গ্লুকোজের মাত্রা কখন পরিমাপ করবেন?', N'যাদের ডায়াবেটিস ধরা পড়েছে তাদের জন্য, খাবারের আগে এবং শোবার সময় প্রতিদিন চার থেকে ছয়টি রিডিং নেওয়ার পরামর্শ দেওয়া হয়। আপনার ডাক্তার আপনার রক্তের গ্লুকোজের মাত্রা পরীক্ষা করার জন্য কোন সময়গুলি সেরা তা নির্ধারণ করতে আপনাকে সাহায্য করতে পারে। খাওয়ার পরে আপনার স্তরগুলি পরীক্ষা করাও গুরুত্বপূর্ণ এবং যে কোনও সময় আপনি মাথা ঘোরা, বিভ্রান্তি বা ক্লান্তির মতো উপসর্গগুলি অনুভব করেন - এগুলি সবই আপনার চিনির মাত্রায় ভারসাম্যহীনতা নির্দেশ করতে পারে।', N'ব্লাডগ্লুকোজ, ব্লাডসুগার, BloodGlucose, BloodSugar', NULL, NULL, NULL, CAST(N'2025-06-30T18:53:32.7866667' AS DateTime2), 2, NULL, NULL, 78)
GO
INSERT [dbo].[Configuration_VitalFAQ] ([Id], [Question], [Answer], [TagSearchKeyword], [IconFileName], [IconFilePath], [IconFileExtension], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [VitalId]) VALUES (9, N'স্বাভাবিক রক্তে শর্করার মাত্রা কত?', N'একটি সাধারণ মান ব্যক্তি থেকে ব্যক্তিতে সামান্য পরিবর্তিত হতে পারে, তবে একজন সুস্থ প্রাপ্তবয়স্ক নন-ডায়াবেটিক ব্যক্তির গড় পরিসীমা সাধারণত নিম্নলিখিত সীমার মধ্যে পড়ে: 70 থেকে 99 mg/dL (মিলিগ্রাম প্রতি ডেসিলিটার), যখন উপবাস থাকে, 140 mg/dL এর কম খাওয়ার দুই ঘন্টা পরে এবং খাবারের আগে 100 থেকে 125 mg/dL।', N'ব্লাডগ্লুকোজ, ব্লাডসুগার, BloodGlucose, BloodSugar', NULL, NULL, NULL, CAST(N'2025-06-30T18:53:32.7900000' AS DateTime2), 2, NULL, NULL, 78)
GO
INSERT [dbo].[Configuration_VitalFAQ] ([Id], [Question], [Answer], [TagSearchKeyword], [IconFileName], [IconFilePath], [IconFileExtension], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [VitalId]) VALUES (10, N'রক্তে গ্লুকোজের মাত্রা কীভাবে পরিমাপ করবেন?', N'বাড়িতে আপনার নিজের রক্তে গ্লুকোজের মাত্রা পরিমাপ করা ডায়াবেটিস ব্যবস্থাপনার একটি গুরুত্বপূর্ণ অংশ। আপনার রক্তে শর্করার পরিমাপ করতে আপনার একটি গ্লুকোমিটার এবং পরীক্ষার স্ট্রিপ প্রয়োজন। ফলাফলের নির্ভুলতা নিশ্চিত করতে পরীক্ষার আগে হাত ধুয়ে শুকিয়ে নিন। তারপর বিশ্লেষণের জন্য গ্লুকোমিটার মেশিনে পরীক্ষার স্ট্রিপে রাখার আগে আঙুলের ডগা থেকে কৈশিক রক্তের একটি ছোট ফোঁটা আঁকতে গ্লুকোমিটারের সাথে দেওয়া ফিঙ্গার প্রিকার ব্যবহার করুন।', N'ব্লাডগ্লুকোজ, ব্লাডসুগার, BloodGlucose, BloodSugar', NULL, NULL, NULL, CAST(N'2025-06-30T18:53:32.8000000' AS DateTime2), 2, NULL, NULL, 78)
GO
INSERT [dbo].[Configuration_VitalFAQ] ([Id], [Question], [Answer], [TagSearchKeyword], [IconFileName], [IconFilePath], [IconFileExtension], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [VitalId]) VALUES (11, N'উচ্চ গ্লুকোজ মাত্রা কি নির্দেশ করে?', N'উচ্চ গ্লুকোজ মাত্রা, যা হাইপারগ্লাইসেমিয়া নামেও পরিচিত, এমন একটি অবস্থা হিসাবে সংজ্ঞায়িত করা হয় যেখানে শরীরের রক্তে গ্লুকোজ বা চিনির মাত্রা বেড়ে যায়। এটি ডায়েট, ব্যায়ামের অভাব, নির্দিষ্ট ওষুধ বা পূর্ব-বিদ্যমান চিকিৎসা অবস্থা সহ বিভিন্ন কারণের কারণে হতে পারে। কিছু ক্ষেত্রে, উচ্চ গ্লুকোজ মাত্রা ডায়াবেটিস নির্দেশ করতে পারে এবং হালকাভাবে নেওয়া উচিত নয়।', N'ব্লাডগ্লুকোজ, ব্লাডসুগার, BloodGlucose, BloodSugar', NULL, NULL, NULL, CAST(N'2025-06-30T18:53:32.8033333' AS DateTime2), 2, NULL, NULL, 78)
GO
INSERT [dbo].[Configuration_VitalFAQ] ([Id], [Question], [Answer], [TagSearchKeyword], [IconFileName], [IconFilePath], [IconFileExtension], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [VitalId]) VALUES (12, N'কম গ্লুকোজ মাত্রা কি নির্দেশ করে?', N'নিম্ন গ্লুকোজ মাত্রা, যা হাইপোগ্লাইসেমিয়া নামেও পরিচিত, এর বিভিন্ন কারণ থাকতে পারে এবং এটি একটি অন্তর্নিহিত চিকিৎসা অবস্থার উপস্থিতি নির্দেশ করতে পারে। এটি ঘটে যখন একটি অপর্যাপ্ত সরবরাহ থাকে, বা শরীর দক্ষতার সাথে সঞ্চালিত শর্করা নিয়ন্ত্রণ করতে পারে না। এটি ডায়াবেটিস, হরমোনের ভারসাম্যহীনতা বা এমনকি কিছু ওষুধের কারণে হতে পারে যা রক্তে শর্করার ঘনত্বকে পরিবর্তন করে।', N'ব্লাডগ্লুকোজ, ব্লাডসুগার, BloodGlucose, BloodSugar', NULL, NULL, NULL, CAST(N'2025-06-30T18:53:32.8100000' AS DateTime2), 2, NULL, NULL, 78)
GO
INSERT [dbo].[Configuration_VitalFAQ] ([Id], [Question], [Answer], [TagSearchKeyword], [IconFileName], [IconFilePath], [IconFileExtension], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [VitalId]) VALUES (13, N'রক্তের গ্লুকোজের মাত্রা কি?', N'ব্লাড গ্লুকোজ, যা ব্লাড সুগার নামেও পরিচিত, একটি গুরুত্বপূর্ণ অত্যাবশ্যক লক্ষণ এবং সামগ্রিক স্বাস্থ্যের একটি মূল সূচক। এটি যে কোনো নির্দিষ্ট সময়ে রক্তপ্রবাহে চিনির পরিমাণ এবং এটি আপনাকে আপনার বিপাকীয় অবস্থা এবং সম্ভাব্য স্বাস্থ্য ঝুঁকির কথা বলে।', N'ব্লাডগ্লুকোজ, ব্লাডসুগার, BloodGlucose, BloodSugar', NULL, NULL, NULL, CAST(N'2025-06-30T18:53:52.2333333' AS DateTime2), 2, NULL, NULL, 79)
GO
INSERT [dbo].[Configuration_VitalFAQ] ([Id], [Question], [Answer], [TagSearchKeyword], [IconFileName], [IconFilePath], [IconFileExtension], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [VitalId]) VALUES (14, N'রক্তে গ্লুকোজের মাত্রা কখন পরিমাপ করবেন?', N'যাদের ডায়াবেটিস ধরা পড়েছে তাদের জন্য, খাবারের আগে এবং শোবার সময় প্রতিদিন চার থেকে ছয়টি রিডিং নেওয়ার পরামর্শ দেওয়া হয়। আপনার ডাক্তার আপনার রক্তের গ্লুকোজের মাত্রা পরীক্ষা করার জন্য কোন সময়গুলি সেরা তা নির্ধারণ করতে আপনাকে সাহায্য করতে পারে। খাওয়ার পরে আপনার স্তরগুলি পরীক্ষা করাও গুরুত্বপূর্ণ এবং যে কোনও সময় আপনি মাথা ঘোরা, বিভ্রান্তি বা ক্লান্তির মতো উপসর্গগুলি অনুভব করেন - এগুলি সবই আপনার চিনির মাত্রায় ভারসাম্যহীনতা নির্দেশ করতে পারে।', N'ব্লাডগ্লুকোজ, ব্লাডসুগার, BloodGlucose, BloodSugar', NULL, NULL, NULL, CAST(N'2025-06-30T18:53:52.2466667' AS DateTime2), 2, NULL, NULL, 79)
GO
INSERT [dbo].[Configuration_VitalFAQ] ([Id], [Question], [Answer], [TagSearchKeyword], [IconFileName], [IconFilePath], [IconFileExtension], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [VitalId]) VALUES (15, N'স্বাভাবিক রক্তে শর্করার মাত্রা কত?', N'একটি সাধারণ মান ব্যক্তি থেকে ব্যক্তিতে সামান্য পরিবর্তিত হতে পারে, তবে একজন সুস্থ প্রাপ্তবয়স্ক নন-ডায়াবেটিক ব্যক্তির গড় পরিসীমা সাধারণত নিম্নলিখিত সীমার মধ্যে পড়ে: 70 থেকে 99 mg/dL (মিলিগ্রাম প্রতি ডেসিলিটার), যখন উপবাস থাকে, 140 mg/dL এর কম খাওয়ার দুই ঘন্টা পরে এবং খাবারের আগে 100 থেকে 125 mg/dL।', N'ব্লাডগ্লুকোজ, ব্লাডসুগার, BloodGlucose, BloodSugar', NULL, NULL, NULL, CAST(N'2025-06-30T18:53:52.2533333' AS DateTime2), 2, NULL, NULL, 79)
GO
INSERT [dbo].[Configuration_VitalFAQ] ([Id], [Question], [Answer], [TagSearchKeyword], [IconFileName], [IconFilePath], [IconFileExtension], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [VitalId]) VALUES (16, N'রক্তে গ্লুকোজের মাত্রা কীভাবে পরিমাপ করবেন?', N'বাড়িতে আপনার নিজের রক্তে গ্লুকোজের মাত্রা পরিমাপ করা ডায়াবেটিস ব্যবস্থাপনার একটি গুরুত্বপূর্ণ অংশ। আপনার রক্তে শর্করার পরিমাপ করতে আপনার একটি গ্লুকোমিটার এবং পরীক্ষার স্ট্রিপ প্রয়োজন। ফলাফলের নির্ভুলতা নিশ্চিত করতে পরীক্ষার আগে হাত ধুয়ে শুকিয়ে নিন। তারপর বিশ্লেষণের জন্য গ্লুকোমিটার মেশিনে পরীক্ষার স্ট্রিপে রাখার আগে আঙুলের ডগা থেকে কৈশিক রক্তের একটি ছোট ফোঁটা আঁকতে গ্লুকোমিটারের সাথে দেওয়া ফিঙ্গার প্রিকার ব্যবহার করুন।', N'ব্লাডগ্লুকোজ, ব্লাডসুগার, BloodGlucose, BloodSugar', NULL, NULL, NULL, CAST(N'2025-06-30T18:53:52.2600000' AS DateTime2), 2, NULL, NULL, 79)
GO
INSERT [dbo].[Configuration_VitalFAQ] ([Id], [Question], [Answer], [TagSearchKeyword], [IconFileName], [IconFilePath], [IconFileExtension], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [VitalId]) VALUES (17, N'উচ্চ গ্লুকোজ মাত্রা কি নির্দেশ করে?', N'উচ্চ গ্লুকোজ মাত্রা, যা হাইপারগ্লাইসেমিয়া নামেও পরিচিত, এমন একটি অবস্থা হিসাবে সংজ্ঞায়িত করা হয় যেখানে শরীরের রক্তে গ্লুকোজ বা চিনির মাত্রা বেড়ে যায়। এটি ডায়েট, ব্যায়ামের অভাব, নির্দিষ্ট ওষুধ বা পূর্ব-বিদ্যমান চিকিৎসা অবস্থা সহ বিভিন্ন কারণের কারণে হতে পারে। কিছু ক্ষেত্রে, উচ্চ গ্লুকোজ মাত্রা ডায়াবেটিস নির্দেশ করতে পারে এবং হালকাভাবে নেওয়া উচিত নয়।', N'ব্লাডগ্লুকোজ, ব্লাডসুগার, BloodGlucose, BloodSugar', NULL, NULL, NULL, CAST(N'2025-06-30T18:53:52.2666667' AS DateTime2), 2, NULL, NULL, 79)
GO
INSERT [dbo].[Configuration_VitalFAQ] ([Id], [Question], [Answer], [TagSearchKeyword], [IconFileName], [IconFilePath], [IconFileExtension], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [VitalId]) VALUES (18, N'কম গ্লুকোজ মাত্রা কি নির্দেশ করে?', N'নিম্ন গ্লুকোজ মাত্রা, যা হাইপোগ্লাইসেমিয়া নামেও পরিচিত, এর বিভিন্ন কারণ থাকতে পারে এবং এটি একটি অন্তর্নিহিত চিকিৎসা অবস্থার উপস্থিতি নির্দেশ করতে পারে। এটি ঘটে যখন একটি অপর্যাপ্ত সরবরাহ থাকে, বা শরীর দক্ষতার সাথে সঞ্চালিত শর্করা নিয়ন্ত্রণ করতে পারে না। এটি ডায়াবেটিস, হরমোনের ভারসাম্যহীনতা বা এমনকি কিছু ওষুধের কারণে হতে পারে যা রক্তে শর্করার ঘনত্বকে পরিবর্তন করে।', N'ব্লাডগ্লুকোজ, ব্লাডসুগার, BloodGlucose, BloodSugar', NULL, NULL, NULL, CAST(N'2025-06-30T18:53:52.2700000' AS DateTime2), 2, NULL, NULL, 79)
GO
INSERT [dbo].[Configuration_VitalFAQ] ([Id], [Question], [Answer], [TagSearchKeyword], [IconFileName], [IconFilePath], [IconFileExtension], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [VitalId]) VALUES (19, N'রক্তের অক্সিজেন কি?', N'রক্তের অক্সিজেন, বা অক্সিজেন স্যাচুরেশন হল সবচেয়ে গুরুত্বপূর্ণ গুরুত্বপূর্ণ লক্ষণগুলির মধ্যে একটি যা একজন ব্যক্তির রক্তে অক্সিজেনের পরিমাণ পরিমাপ করে। আপনার রক্তে অক্সিজেনের পরিমাণ আপনার বয়স, শারীরিক ক্রিয়াকলাপের মাত্রা এবং আপনার যে কোনো চিকিৎসা অবস্থার উপর নির্ভর করে পরিবর্তিত হতে পারে।', N'ব্লাডগ্লুকোজ, ব্লাডসুগার, BloodGlucose, BloodSugar', NULL, NULL, NULL, CAST(N'2025-06-30T18:59:06.4233333' AS DateTime2), 2, NULL, NULL, 72)
GO
INSERT [dbo].[Configuration_VitalFAQ] ([Id], [Question], [Answer], [TagSearchKeyword], [IconFileName], [IconFilePath], [IconFileExtension], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [VitalId]) VALUES (20, N'রক্তের অক্সিজেনের মাত্রা কখন পরিমাপ করবেন?', N'চিকিত্সক পেশাদাররা সুপারিশ করেন যে বেশিরভাগ লোক ঠান্ডা এবং ফ্লু মৌসুমের শুরুতে বছরে দুবার তাদের রক্তের অক্সিজেনের মাত্রা পরীক্ষা করে। তাছাড়া, আপনার রক্তের অক্সিজেনও পরীক্ষা করা উচিত যদি আপনি শ্বাসকষ্টের লক্ষণ যেমন শ্বাস নিতে অসুবিধা, বুকে ব্যথা বা কফ কাশি দেখান।', N'ব্লাডগ্লুকোজ, ব্লাডসুগার, BloodGlucose, BloodSugar', NULL, NULL, NULL, CAST(N'2025-06-30T18:59:06.4333333' AS DateTime2), 2, NULL, NULL, 72)
GO
INSERT [dbo].[Configuration_VitalFAQ] ([Id], [Question], [Answer], [TagSearchKeyword], [IconFileName], [IconFilePath], [IconFileExtension], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [VitalId]) VALUES (21, N'রক্তের অক্সিজেনের মাত্রা কীভাবে পরিমাপ করবেন?', N'বাড়িতে আপনার রক্তের অক্সিজেন পরিমাপ করতে একটি পালস অক্সিমিটার ব্যবহার করুন। প্রথমে, আপনার আঙুলের চারপাশে বা আপনার কানের লতিতে ডিভাইসটি লাগান। একবার এটি সুরক্ষিত হয়ে গেলে, আপনার কয়েক সেকেন্ডের মধ্যে রিডিং পাওয়া উচিত।', N'ব্লাডগ্লুকোজ, ব্লাডসুগার, BloodGlucose, BloodSugar', NULL, NULL, NULL, CAST(N'2025-06-30T18:59:06.4400000' AS DateTime2), 2, NULL, NULL, 72)
GO
INSERT [dbo].[Configuration_VitalFAQ] ([Id], [Question], [Answer], [TagSearchKeyword], [IconFileName], [IconFilePath], [IconFileExtension], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [VitalId]) VALUES (22, N'রক্তে অক্সিজেনের গড় মাত্রা কত?', N'এই অত্যাবশ্যক চিহ্নের স্বাভাবিক মান বেশিরভাগ সুস্থ ব্যক্তিদের মধ্যে 95% এবং 100% এর মধ্যে থাকে। যদি আপনার অক্সিজেনের মাত্রা 95% এর নিচে নেমে যায়, তাহলে চিকিৎসা সহায়তা নিন।', N'ব্লাডগ্লুকোজ, ব্লাডসুগার, BloodGlucose, BloodSugar', NULL, NULL, NULL, CAST(N'2025-06-30T18:59:06.4433333' AS DateTime2), 2, NULL, NULL, 72)
GO
INSERT [dbo].[Configuration_VitalFAQ] ([Id], [Question], [Answer], [TagSearchKeyword], [IconFileName], [IconFilePath], [IconFileExtension], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [VitalId]) VALUES (23, N'রক্তে অক্সিজেনের মাত্রা খুব কম হলে কি হবে?', N'যদি আপনার রক্তের অক্সিজেনের মাত্রা খুব কম হয় তবে এটি হাইপোক্সেমিয়া হতে পারে। হাইপোক্সেমিয়া ঘটে যখন শরীর রক্ত প্রবাহে পর্যাপ্ত অক্সিজেন পায় না। এই অবস্থার লক্ষণগুলির মধ্যে রয়েছে শ্বাসকষ্ট, বিভ্রান্তি, বিরক্তি, ক্লান্তি এবং বুকে ব্যথা। যদি চিকিত্সা না করা হয়, হাইপোক্সেমিয়া গুরুতর স্বাস্থ্য জটিলতা সৃষ্টি করতে পারে যেমন শ্বাসযন্ত্রের ব্যর্থতা, মস্তিষ্কের ক্ষতি এবং হার্টের সমস্যা।', N'ব্লাডগ্লুকোজ, ব্লাডসুগার, BloodGlucose, BloodSugar', NULL, NULL, NULL, CAST(N'2025-06-30T18:59:06.4500000' AS DateTime2), 2, NULL, NULL, 72)
GO
INSERT [dbo].[Configuration_VitalFAQ] ([Id], [Question], [Answer], [TagSearchKeyword], [IconFileName], [IconFilePath], [IconFileExtension], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [VitalId]) VALUES (24, N'রক্তে অক্সিজেনের মাত্রা খুব বেশি হলে কি হবে?', N'যখন আপনার রক্ত গুরুত্বপূর্ণ লক্ষণগুলির স্বাভাবিক মান ছাড়িয়ে যায়, তখন আপনার হাইপারক্সেমিয়া হতে পারে। আর যদি চেক না করা হয় তবে এটি একাধিক অঙ্গের মারাত্মক ক্ষতি এমনকি মৃত্যু পর্যন্ত হতে পারে।', N'ব্লাডগ্লুকোজ, ব্লাডসুগার, BloodGlucose, BloodSugar', NULL, NULL, NULL, CAST(N'2025-06-30T18:59:06.4566667' AS DateTime2), 2, NULL, NULL, 72)
GO
INSERT [dbo].[Configuration_VitalFAQ] ([Id], [Question], [Answer], [TagSearchKeyword], [IconFileName], [IconFilePath], [IconFileExtension], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [VitalId]) VALUES (25, N'রক্তচাপ কি?', N'রক্তচাপ হল আরেকটি গুরুত্বপূর্ণ চিহ্ন যা আপনার কার্ডিওভাসকুলার সিস্টেমের স্বাস্থ্য পরিমাপ করে। এটি আমাদের ধমনী এবং শিরাগুলির দেয়ালের বিরুদ্ধে রক্তের দ্বারা প্রয়োগ করা শক্তি।।', N'ব্লাডগ্লুকোজ, ব্লাডসুগার, BloodGlucose, BloodSugar', NULL, NULL, NULL, CAST(N'2025-06-30T19:02:43.3366667' AS DateTime2), 2, NULL, NULL, 64)
GO
INSERT [dbo].[Configuration_VitalFAQ] ([Id], [Question], [Answer], [TagSearchKeyword], [IconFileName], [IconFilePath], [IconFileExtension], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [VitalId]) VALUES (26, N'রক্তচাপ কখন পরিমাপ করবেন?', N'আপনার সামগ্রিক স্বাস্থ্যের একটি গুরুত্বপূর্ণ সূচক হিসাবে, নিয়মিতভাবে আপনার রক্তচাপ পরিমাপ করার পরামর্শ দেওয়া হয়। পরিমাপ করার আদর্শ সময় হল সকালে ঘুম থেকে ওঠার পরে এবং প্রাতঃরাশ খাওয়ার আগে নিশ্চিত করুন যে আপনি এমন কিছু গ্রহণ করেননি যা সাময়িকভাবে আপনার রক্তচাপ পড়ার পরিমাণ বাড়াতে বা কমাতে পারে।', N'ব্লাডগ্লুকোজ, ব্লাডসুগার, BloodGlucose, BloodSugar', NULL, NULL, NULL, CAST(N'2025-06-30T19:02:43.3500000' AS DateTime2), 2, NULL, NULL, 64)
GO
INSERT [dbo].[Configuration_VitalFAQ] ([Id], [Question], [Answer], [TagSearchKeyword], [IconFileName], [IconFilePath], [IconFileExtension], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [VitalId]) VALUES (27, N'সাধারণ রক্তচাপ কি?', N'প্রাপ্তবয়স্কদের মধ্যে, স্বাভাবিক সিস্টোলিক চাপ (হার্ট সংকোচন পর্যায়ে) 120 বা তার কম, যখন সাধারণ ডায়াস্টোলিক চাপ (শিথিল পর্যায়ে হৃদয়) 80 বা তার কম।', N'ব্লাডগ্লুকোজ, ব্লাডসুগার, BloodGlucose, BloodSugar', NULL, NULL, NULL, CAST(N'2025-06-30T19:02:43.3566667' AS DateTime2), 2, NULL, NULL, 64)
GO
INSERT [dbo].[Configuration_VitalFAQ] ([Id], [Question], [Answer], [TagSearchKeyword], [IconFileName], [IconFilePath], [IconFileExtension], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [VitalId]) VALUES (28, N'রক্তচাপ কিভাবে পরিমাপ করবেন?', N'একটি ডায়াল গেজ সহ একটি অ্যানারয়েড মনিটর, যেমন একটি কম্পাস মুখ, রক্তচাপ পরিমাপ করতে পারে। যাইহোক, একটি ডিজিটাল মনিটর বেশি জনপ্রিয় কারণ এটি স্বয়ংক্রিয় এবং রিডিং সহজেই এর স্ক্রিনে দেখা যায়, সাধারণত লাল সংখ্যায়। কিন্তু একটি ডিজিটাল মনিটর আরো ব্যয়বহুল। বাছুর, কব্জি বা আঙুলের চারপাশে পরিধানের চেয়ে উপরের বাহুর চারপাশে ফিট করা একটি কাফ আরও সঠিক পাঠ দেবে।', N'ব্লাডগ্লুকোজ, ব্লাডসুগার, BloodGlucose, BloodSugar', NULL, NULL, NULL, CAST(N'2025-06-30T19:02:43.3666667' AS DateTime2), 2, NULL, NULL, 64)
GO
INSERT [dbo].[Configuration_VitalFAQ] ([Id], [Question], [Answer], [TagSearchKeyword], [IconFileName], [IconFilePath], [IconFileExtension], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [VitalId]) VALUES (29, N'উচ্চ রক্তচাপ কি?', N'উচ্চ রক্তচাপ, যা উচ্চ রক্তচাপ নামেও পরিচিত, ধমনীতে ক্রমাগত উচ্চ-চাপের মাত্রা দ্বারা চিহ্নিত করা হয়। এটি হার্ট অ্যাটাক এবং স্ট্রোকের মতো গুরুতর কার্ডিওভাসকুলার রোগের ঝুঁকি বাড়ায় এবং চিকিত্সা না করা হলে চোখ, কিডনি এবং মস্তিষ্কের মতো অন্যান্য অঙ্গের ক্ষতি করে। 140 mmHg বা তার বেশি সিস্টোলিক রিডিং উচ্চ রক্তচাপ হিসাবে বিবেচিত হয়; একইভাবে, 90 mmHg বা তার বেশি ডায়াস্টোলিক রিডিং উচ্চ রক্তচাপ নির্দেশ করে।', N'ব্লাডগ্লুকোজ, ব্লাডসুগার, BloodGlucose, BloodSugar', NULL, NULL, NULL, CAST(N'2025-06-30T19:02:43.3733333' AS DateTime2), 2, NULL, NULL, 64)
GO
INSERT [dbo].[Configuration_VitalFAQ] ([Id], [Question], [Answer], [TagSearchKeyword], [IconFileName], [IconFilePath], [IconFileExtension], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [VitalId]) VALUES (30, N'নিম্ন রক্তচাপ কি?', N'নিম্ন রক্তচাপ, যা হাইপোটেনশন নামেও পরিচিত, ঘটে যখন একজন ব্যক্তির ধমনীতে রক্তচাপ হওয়া উচিত তার চেয়ে কম হয়। এটি মাথা ঘোরা থেকে অঙ্গ ব্যর্থতা পর্যন্ত বিভিন্ন উপসর্গ এবং স্বাস্থ্য জটিলতা সৃষ্টি করতে পারে। প্রাপ্তবয়স্কদের জন্য একটি স্বাভাবিক বিশ্রামের সিস্টোলিক রক্তচাপ রিডিং সাধারণত 90-120mmHg এর মধ্যে হয়; যাইহোক, এই সংখ্যার নীচে পড়া নিম্ন রক্তচাপ নির্দেশ করতে পারে।', N'ব্লাডগ্লুকোজ, ব্লাডসুগার, BloodGlucose, BloodSugar', NULL, NULL, NULL, CAST(N'2025-06-30T19:02:43.3800000' AS DateTime2), 2, NULL, NULL, 64)
GO
INSERT [dbo].[Configuration_VitalFAQ] ([Id], [Question], [Answer], [TagSearchKeyword], [IconFileName], [IconFilePath], [IconFileExtension], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [VitalId]) VALUES (31, N'রক্তচাপ কি?', N'রক্তচাপ হল আরেকটি গুরুত্বপূর্ণ চিহ্ন যা আপনার কার্ডিওভাসকুলার সিস্টেমের স্বাস্থ্য পরিমাপ করে। এটি আমাদের ধমনী এবং শিরাগুলির দেয়ালের বিরুদ্ধে রক্তের দ্বারা প্রয়োগ করা শক্তি।।', N'ব্লাডগ্লুকোজ, ব্লাডসুগার, BloodGlucose, BloodSugar', NULL, NULL, NULL, CAST(N'2025-06-30T19:03:05.0033333' AS DateTime2), 2, NULL, NULL, 65)
GO
INSERT [dbo].[Configuration_VitalFAQ] ([Id], [Question], [Answer], [TagSearchKeyword], [IconFileName], [IconFilePath], [IconFileExtension], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [VitalId]) VALUES (32, N'রক্তচাপ কখন পরিমাপ করবেন?', N'আপনার সামগ্রিক স্বাস্থ্যের একটি গুরুত্বপূর্ণ সূচক হিসাবে, নিয়মিতভাবে আপনার রক্তচাপ পরিমাপ করার পরামর্শ দেওয়া হয়। পরিমাপ করার আদর্শ সময় হল সকালে ঘুম থেকে ওঠার পরে এবং প্রাতঃরাশ খাওয়ার আগে নিশ্চিত করুন যে আপনি এমন কিছু গ্রহণ করেননি যা সাময়িকভাবে আপনার রক্তচাপ পড়ার পরিমাণ বাড়াতে বা কমাতে পারে।', N'ব্লাডগ্লুকোজ, ব্লাডসুগার, BloodGlucose, BloodSugar', NULL, NULL, NULL, CAST(N'2025-06-30T19:03:05.0133333' AS DateTime2), 2, NULL, NULL, 65)
GO
INSERT [dbo].[Configuration_VitalFAQ] ([Id], [Question], [Answer], [TagSearchKeyword], [IconFileName], [IconFilePath], [IconFileExtension], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [VitalId]) VALUES (33, N'সাধারণ রক্তচাপ কি?', N'প্রাপ্তবয়স্কদের মধ্যে, স্বাভাবিক সিস্টোলিক চাপ (হার্ট সংকোচন পর্যায়ে) 120 বা তার কম, যখন সাধারণ ডায়াস্টোলিক চাপ (শিথিল পর্যায়ে হৃদয়) 80 বা তার কম।', N'ব্লাডগ্লুকোজ, ব্লাডসুগার, BloodGlucose, BloodSugar', NULL, NULL, NULL, CAST(N'2025-06-30T19:03:05.0200000' AS DateTime2), 2, NULL, NULL, 65)
GO
INSERT [dbo].[Configuration_VitalFAQ] ([Id], [Question], [Answer], [TagSearchKeyword], [IconFileName], [IconFilePath], [IconFileExtension], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [VitalId]) VALUES (34, N'রক্তচাপ কিভাবে পরিমাপ করবেন?', N'একটি ডায়াল গেজ সহ একটি অ্যানারয়েড মনিটর, যেমন একটি কম্পাস মুখ, রক্তচাপ পরিমাপ করতে পারে। যাইহোক, একটি ডিজিটাল মনিটর বেশি জনপ্রিয় কারণ এটি স্বয়ংক্রিয় এবং রিডিং সহজেই এর স্ক্রিনে দেখা যায়, সাধারণত লাল সংখ্যায়। কিন্তু একটি ডিজিটাল মনিটর আরো ব্যয়বহুল। বাছুর, কব্জি বা আঙুলের চারপাশে পরিধানের চেয়ে উপরের বাহুর চারপাশে ফিট করা একটি কাফ আরও সঠিক পাঠ দেবে।', N'ব্লাডগ্লুকোজ, ব্লাডসুগার, BloodGlucose, BloodSugar', NULL, NULL, NULL, CAST(N'2025-06-30T19:03:05.0266667' AS DateTime2), 2, NULL, NULL, 65)
GO
INSERT [dbo].[Configuration_VitalFAQ] ([Id], [Question], [Answer], [TagSearchKeyword], [IconFileName], [IconFilePath], [IconFileExtension], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [VitalId]) VALUES (35, N'উচ্চ রক্তচাপ কি?', N'উচ্চ রক্তচাপ, যা উচ্চ রক্তচাপ নামেও পরিচিত, ধমনীতে ক্রমাগত উচ্চ-চাপের মাত্রা দ্বারা চিহ্নিত করা হয়। এটি হার্ট অ্যাটাক এবং স্ট্রোকের মতো গুরুতর কার্ডিওভাসকুলার রোগের ঝুঁকি বাড়ায় এবং চিকিত্সা না করা হলে চোখ, কিডনি এবং মস্তিষ্কের মতো অন্যান্য অঙ্গের ক্ষতি করে। 140 mmHg বা তার বেশি সিস্টোলিক রিডিং উচ্চ রক্তচাপ হিসাবে বিবেচিত হয়; একইভাবে, 90 mmHg বা তার বেশি ডায়াস্টোলিক রিডিং উচ্চ রক্তচাপ নির্দেশ করে।', N'ব্লাডগ্লুকোজ, ব্লাডসুগার, BloodGlucose, BloodSugar', NULL, NULL, NULL, CAST(N'2025-06-30T19:03:05.0300000' AS DateTime2), 2, NULL, NULL, 65)
GO
INSERT [dbo].[Configuration_VitalFAQ] ([Id], [Question], [Answer], [TagSearchKeyword], [IconFileName], [IconFilePath], [IconFileExtension], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [VitalId]) VALUES (36, N'নিম্ন রক্তচাপ কি?', N'নিম্ন রক্তচাপ, যা হাইপোটেনশন নামেও পরিচিত, ঘটে যখন একজন ব্যক্তির ধমনীতে রক্তচাপ হওয়া উচিত তার চেয়ে কম হয়। এটি মাথা ঘোরা থেকে অঙ্গ ব্যর্থতা পর্যন্ত বিভিন্ন উপসর্গ এবং স্বাস্থ্য জটিলতা সৃষ্টি করতে পারে। প্রাপ্তবয়স্কদের জন্য একটি স্বাভাবিক বিশ্রামের সিস্টোলিক রক্তচাপ রিডিং সাধারণত 90-120mmHg এর মধ্যে হয়; যাইহোক, এই সংখ্যার নীচে পড়া নিম্ন রক্তচাপ নির্দেশ করতে পারে।', N'ব্লাডগ্লুকোজ, ব্লাডসুগার, BloodGlucose, BloodSugar', NULL, NULL, NULL, CAST(N'2025-06-30T19:03:05.0400000' AS DateTime2), 2, NULL, NULL, 65)
GO
INSERT [dbo].[Configuration_VitalFAQ] ([Id], [Question], [Answer], [TagSearchKeyword], [IconFileName], [IconFilePath], [IconFileExtension], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [VitalId]) VALUES (37, N'বডি মাস ইনডেক্স কি?', N'বডি মাস ইনডেক্স (BMI) হল একটি পরিমাপ যন্ত্রণা যা মানুষের ওজন এবং উচ্চতা নির্ধারণ করে তারা কতটুকু স্বাস্থ্যসম্মত ও সামান্য শরীরের পরিমাপ রেখে থাকে। এটি সাধারণত একটি সাধারণ গণিতিক প্রক্রিয়া ব্যবহার করে পরিবারে বা সম্প্রাণ গোষ্ঠীতে মানুষের বড়ী পরিমাপ করার জন্য।', N'ব্লাডগ্লুকোজ, ব্লাডসুগার, BloodGlucose, BloodSugar', NULL, NULL, NULL, CAST(N'2025-06-30T19:06:03.1433333' AS DateTime2), 2, NULL, NULL, 74)
GO
INSERT [dbo].[Configuration_VitalFAQ] ([Id], [Question], [Answer], [TagSearchKeyword], [IconFileName], [IconFilePath], [IconFileExtension], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [VitalId]) VALUES (38, N'কখন আপনার বডি মাস ইনডেক্স পরিমাপ করবেন?', N'বডি মাস ইনডেক্স পরিমাপ করা যাবে যখন আপনি আপনার উচ্চতা এবং ওজন জানেন। তারপর এই সংখ্যা হিসেবে প্রকাশ করা হয়:
BMI = ওজন (কেজি) / (উচ্চতা (মিটার) * উচ্চতা (মিটার))', N'ব্লাডগ্লুকোজ, ব্লাডসুগার, BloodGlucose, BloodSugar', NULL, NULL, NULL, CAST(N'2025-06-30T19:06:03.1566667' AS DateTime2), 2, NULL, NULL, 65)
GO
INSERT [dbo].[Configuration_VitalFAQ] ([Id], [Question], [Answer], [TagSearchKeyword], [IconFileName], [IconFilePath], [IconFileExtension], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [VitalId]) VALUES (39, N'আদর্শ বডি মাস ইনডে্ক্স পরিসীমা কি?', N'আদর্শ বডি মাস ইনডে্ক্স পরিসীমা সাধারণত ১৮.৫ থেকে ২৫ এর মধ্যে থাকে। এই সীমার মধ্যে থাকা মানুষের সামান্য শরীরের পরিমাপ বলে ধরা হয় এবং এই ব্যক্তিদের স্বাস্থ্য সামগ্রী খুব ভালো থাকে সাধারণত।', N'ব্লাডগ্লুকোজ, ব্লাডসুগার, BloodGlucose, BloodSugar', NULL, NULL, NULL, CAST(N'2025-06-30T19:06:03.1633333' AS DateTime2), 2, NULL, NULL, 65)
GO
INSERT [dbo].[Configuration_VitalFAQ] ([Id], [Question], [Answer], [TagSearchKeyword], [IconFileName], [IconFilePath], [IconFileExtension], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [VitalId]) VALUES (40, N'অতিরিক্ত বডি মাস ইনডেক্স এর সাথে সম্পর্কিত সমস্যাগুলি কী কী?', N'অতিরিক্ত বডি মাস ইনডেক্সের সাথে সম্পর্কিত সমস্যাগুলি হতে পারে হার্ট রোগ, ডায়াবেটিস, উচ্চ রক্তচাপ, শ্বাসকষ্ট, আর্থ্রাইটিস, মধুমেহ, বিভিন্ন ধরনের ক্যান্সার ইত্যাদি।', N'ব্লাডগ্লুকোজ, ব্লাডসুগার, BloodGlucose, BloodSugar', NULL, NULL, NULL, CAST(N'2025-06-30T19:06:03.1700000' AS DateTime2), 2, NULL, NULL, 65)
GO
INSERT [dbo].[Configuration_VitalFAQ] ([Id], [Question], [Answer], [TagSearchKeyword], [IconFileName], [IconFilePath], [IconFileExtension], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [VitalId]) VALUES (41, N'কম বডি মাস ইনডেক্স এর সাথে সম্পর্কিত সমস্যাগুলি কী কী?', N'কম বডি মাস ইনডেক্সের সাথে সম্পর্কিত সমস্যাগুলি হতে পারে অন্যেরভাবে স্বাস্থ্যসম্মত অসুস্থতা, মাংসপেশী দুর্বলতা, অস্বাভাবিক রক্তচাপ, হাড়-নষ্ট সমস্যা, অস্থিরতা, ইমিউন সিস্টেমের দুর্বলতা ইত্যাদি।', N'ব্লাডগ্লুকোজ, ব্লাডসুগার, BloodGlucose, BloodSugar', NULL, NULL, NULL, CAST(N'2025-06-30T19:06:03.1733333' AS DateTime2), 2, NULL, NULL, 65)
GO
SET IDENTITY_INSERT [dbo].[Configuration_VitalFAQ] OFF
GO
SET IDENTITY_INSERT [dbo].[Prescription_Upload] ON 
GO
INSERT [dbo].[Prescription_Upload] ([Id], [PrescriptionCode], [PatientId], [SmartRxId], [IsExistingPatient], [HasExistingRelative], [RelativePatientIds], [FileName], [FilePath], [FileExtension], [NumberOfFilesStoredForThisPrescription], [UserId], [FolderId], [IsSmartRxRequested], [IsLocked], [LockedById], [LockedDate], [IsReported], [ReportById], [ReportDate], [ReportReason], [ReportDetails], [IsRecommended], [RecommendedById], [RecommendedDate], [IsApproved], [ApprovedById], [ApprovedDate], [IsCompleted], [CompletedById], [CompletedDate], [Tag1], [Tag2], [Tag3], [Tag4], [Tag5], [NextAppoinmentDate], [NextAppoinmentTime], [DiscountPercentageOnMedicineByDoctor], [DiscountPercentageOnInvestigationByDoctor], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PrescriptionDate]) VALUES (3, N'0000000001          ', 1, 2, NULL, NULL, NULL, N'Mother Fever', N'files\0000000001_1_thumbnail.jpg', N'.pdf', 3, 8, 7, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 7, CAST(N'2025-06-02T18:30:21.6633333' AS DateTime2), 1, 2, CAST(N'2025-06-02T18:30:21.6633333' AS DateTime2), 1, 2, CAST(N'2025-06-02T18:30:21.6633333' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-06-02T17:30:01.4328402' AS DateTime2), 8, CAST(N'2025-06-19T17:42:16.3978771' AS DateTime2), 8, CAST(N'2025-02-03T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Prescription_Upload] ([Id], [PrescriptionCode], [PatientId], [SmartRxId], [IsExistingPatient], [HasExistingRelative], [RelativePatientIds], [FileName], [FilePath], [FileExtension], [NumberOfFilesStoredForThisPrescription], [UserId], [FolderId], [IsSmartRxRequested], [IsLocked], [LockedById], [LockedDate], [IsReported], [ReportById], [ReportDate], [ReportReason], [ReportDetails], [IsRecommended], [RecommendedById], [RecommendedDate], [IsApproved], [ApprovedById], [ApprovedDate], [IsCompleted], [CompletedById], [CompletedDate], [Tag1], [Tag2], [Tag3], [Tag4], [Tag5], [NextAppoinmentDate], [NextAppoinmentTime], [DiscountPercentageOnMedicineByDoctor], [DiscountPercentageOnInvestigationByDoctor], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PrescriptionDate]) VALUES (4, N'0000000002          ', 2, 3, NULL, NULL, NULL, N'Brother Pain', N'files\0000000002_1_thumbnail.jpg', N'.pdf', 1, 7, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-06-02T17:30:52.7182051' AS DateTime2), 7, CAST(N'2025-06-02T17:30:54.7711931' AS DateTime2), 7, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Prescription_Upload] ([Id], [PrescriptionCode], [PatientId], [SmartRxId], [IsExistingPatient], [HasExistingRelative], [RelativePatientIds], [FileName], [FilePath], [FileExtension], [NumberOfFilesStoredForThisPrescription], [UserId], [FolderId], [IsSmartRxRequested], [IsLocked], [LockedById], [LockedDate], [IsReported], [ReportById], [ReportDate], [ReportReason], [ReportDetails], [IsRecommended], [RecommendedById], [RecommendedDate], [IsApproved], [ApprovedById], [ApprovedDate], [IsCompleted], [CompletedById], [CompletedDate], [Tag1], [Tag2], [Tag3], [Tag4], [Tag5], [NextAppoinmentDate], [NextAppoinmentTime], [DiscountPercentageOnMedicineByDoctor], [DiscountPercentageOnInvestigationByDoctor], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PrescriptionDate]) VALUES (5, N'0000000003          ', 3, NULL, NULL, NULL, NULL, N'tst', N'files\0000000003_1_thumbnail.jpg', N'.jpg', 2, 8, 7, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-06-19T17:25:20.9177865' AS DateTime2), 8, CAST(N'2025-06-19T17:27:31.6599370' AS DateTime2), 8, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Prescription_Upload] ([Id], [PrescriptionCode], [PatientId], [SmartRxId], [IsExistingPatient], [HasExistingRelative], [RelativePatientIds], [FileName], [FilePath], [FileExtension], [NumberOfFilesStoredForThisPrescription], [UserId], [FolderId], [IsSmartRxRequested], [IsLocked], [LockedById], [LockedDate], [IsReported], [ReportById], [ReportDate], [ReportReason], [ReportDetails], [IsRecommended], [RecommendedById], [RecommendedDate], [IsApproved], [ApprovedById], [ApprovedDate], [IsCompleted], [CompletedById], [CompletedDate], [Tag1], [Tag2], [Tag3], [Tag4], [Tag5], [NextAppoinmentDate], [NextAppoinmentTime], [DiscountPercentageOnMedicineByDoctor], [DiscountPercentageOnInvestigationByDoctor], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PrescriptionDate]) VALUES (6, N'0000000004          ', 1, NULL, NULL, NULL, NULL, N'Raihan', N'files\0000000004_1_thumbnail.jpg', N'.jpg', 3, 8, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-06-19T19:17:14.1841152' AS DateTime2), 8, NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Prescription_Upload] ([Id], [PrescriptionCode], [PatientId], [SmartRxId], [IsExistingPatient], [HasExistingRelative], [RelativePatientIds], [FileName], [FilePath], [FileExtension], [NumberOfFilesStoredForThisPrescription], [UserId], [FolderId], [IsSmartRxRequested], [IsLocked], [LockedById], [LockedDate], [IsReported], [ReportById], [ReportDate], [ReportReason], [ReportDetails], [IsRecommended], [RecommendedById], [RecommendedDate], [IsApproved], [ApprovedById], [ApprovedDate], [IsCompleted], [CompletedById], [CompletedDate], [Tag1], [Tag2], [Tag3], [Tag4], [Tag5], [NextAppoinmentDate], [NextAppoinmentTime], [DiscountPercentageOnMedicineByDoctor], [DiscountPercentageOnInvestigationByDoctor], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PrescriptionDate]) VALUES (7, N'0000000005          ', 2, NULL, NULL, NULL, NULL, N'Test File', N'files\0000000005_1_thumbnail.jpg', N'.pdf', 3, 8, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-06-19T19:54:15.0125639' AS DateTime2), 8, NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Prescription_Upload] ([Id], [PrescriptionCode], [PatientId], [SmartRxId], [IsExistingPatient], [HasExistingRelative], [RelativePatientIds], [FileName], [FilePath], [FileExtension], [NumberOfFilesStoredForThisPrescription], [UserId], [FolderId], [IsSmartRxRequested], [IsLocked], [LockedById], [LockedDate], [IsReported], [ReportById], [ReportDate], [ReportReason], [ReportDetails], [IsRecommended], [RecommendedById], [RecommendedDate], [IsApproved], [ApprovedById], [ApprovedDate], [IsCompleted], [CompletedById], [CompletedDate], [Tag1], [Tag2], [Tag3], [Tag4], [Tag5], [NextAppoinmentDate], [NextAppoinmentTime], [DiscountPercentageOnMedicineByDoctor], [DiscountPercentageOnInvestigationByDoctor], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PrescriptionDate]) VALUES (8, N'0000000006          ', 3, NULL, NULL, NULL, NULL, N'abc', N'files\0000000006_1_thumbnail.jpg', N'.pdf', 4, 8, 7, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-06-20T17:09:45.0989056' AS DateTime2), 8, CAST(N'2025-09-18T18:47:46.2961857' AS DateTime2), 8, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Prescription_Upload] ([Id], [PrescriptionCode], [PatientId], [SmartRxId], [IsExistingPatient], [HasExistingRelative], [RelativePatientIds], [FileName], [FilePath], [FileExtension], [NumberOfFilesStoredForThisPrescription], [UserId], [FolderId], [IsSmartRxRequested], [IsLocked], [LockedById], [LockedDate], [IsReported], [ReportById], [ReportDate], [ReportReason], [ReportDetails], [IsRecommended], [RecommendedById], [RecommendedDate], [IsApproved], [ApprovedById], [ApprovedDate], [IsCompleted], [CompletedById], [CompletedDate], [Tag1], [Tag2], [Tag3], [Tag4], [Tag5], [NextAppoinmentDate], [NextAppoinmentTime], [DiscountPercentageOnMedicineByDoctor], [DiscountPercentageOnInvestigationByDoctor], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PrescriptionDate]) VALUES (9, N'0000000007          ', 1, NULL, NULL, NULL, NULL, N'Test File', N'files\0000000007_1_thumbnail.jpg', N'.pdf', 3, 8, 7, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-06-20T20:35:34.9478803' AS DateTime2), 8, CAST(N'2025-09-29T15:54:37.7577396' AS DateTime2), 8, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Prescription_Upload] ([Id], [PrescriptionCode], [PatientId], [SmartRxId], [IsExistingPatient], [HasExistingRelative], [RelativePatientIds], [FileName], [FilePath], [FileExtension], [NumberOfFilesStoredForThisPrescription], [UserId], [FolderId], [IsSmartRxRequested], [IsLocked], [LockedById], [LockedDate], [IsReported], [ReportById], [ReportDate], [ReportReason], [ReportDetails], [IsRecommended], [RecommendedById], [RecommendedDate], [IsApproved], [ApprovedById], [ApprovedDate], [IsCompleted], [CompletedById], [CompletedDate], [Tag1], [Tag2], [Tag3], [Tag4], [Tag5], [NextAppoinmentDate], [NextAppoinmentTime], [DiscountPercentageOnMedicineByDoctor], [DiscountPercentageOnInvestigationByDoctor], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PrescriptionDate]) VALUES (10, N'0000000008          ', 2, NULL, NULL, NULL, NULL, N'shahanaz', N'files\0000000008_1_thumbnail.jpg', N'.pdf', 3, 8, 7, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-06-20T20:49:33.2371888' AS DateTime2), 8, CAST(N'2025-09-29T15:54:45.6525120' AS DateTime2), 8, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Prescription_Upload] ([Id], [PrescriptionCode], [PatientId], [SmartRxId], [IsExistingPatient], [HasExistingRelative], [RelativePatientIds], [FileName], [FilePath], [FileExtension], [NumberOfFilesStoredForThisPrescription], [UserId], [FolderId], [IsSmartRxRequested], [IsLocked], [LockedById], [LockedDate], [IsReported], [ReportById], [ReportDate], [ReportReason], [ReportDetails], [IsRecommended], [RecommendedById], [RecommendedDate], [IsApproved], [ApprovedById], [ApprovedDate], [IsCompleted], [CompletedById], [CompletedDate], [Tag1], [Tag2], [Tag3], [Tag4], [Tag5], [NextAppoinmentDate], [NextAppoinmentTime], [DiscountPercentageOnMedicineByDoctor], [DiscountPercentageOnInvestigationByDoctor], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PrescriptionDate]) VALUES (11, N'0000000009          ', 3, NULL, NULL, NULL, NULL, N'bbbbb', N'files\0000000009_1_thumbnail.jpg', N'.pdf', 3, 8, 7, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-06-20T20:59:55.7641383' AS DateTime2), 8, CAST(N'2025-06-25T14:34:32.5610243' AS DateTime2), 8, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Prescription_Upload] ([Id], [PrescriptionCode], [PatientId], [SmartRxId], [IsExistingPatient], [HasExistingRelative], [RelativePatientIds], [FileName], [FilePath], [FileExtension], [NumberOfFilesStoredForThisPrescription], [UserId], [FolderId], [IsSmartRxRequested], [IsLocked], [LockedById], [LockedDate], [IsReported], [ReportById], [ReportDate], [ReportReason], [ReportDetails], [IsRecommended], [RecommendedById], [RecommendedDate], [IsApproved], [ApprovedById], [ApprovedDate], [IsCompleted], [CompletedById], [CompletedDate], [Tag1], [Tag2], [Tag3], [Tag4], [Tag5], [NextAppoinmentDate], [NextAppoinmentTime], [DiscountPercentageOnMedicineByDoctor], [DiscountPercentageOnInvestigationByDoctor], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PrescriptionDate]) VALUES (12, N'0000000010          ', 1, NULL, NULL, NULL, NULL, N'dddd', N'files\0000000010_1_thumbnail.jpg', N'.pdf', 1, 8, 7, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-06-20T21:15:44.0845314' AS DateTime2), 8, CAST(N'2025-09-29T15:54:49.2525020' AS DateTime2), 8, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Prescription_Upload] ([Id], [PrescriptionCode], [PatientId], [SmartRxId], [IsExistingPatient], [HasExistingRelative], [RelativePatientIds], [FileName], [FilePath], [FileExtension], [NumberOfFilesStoredForThisPrescription], [UserId], [FolderId], [IsSmartRxRequested], [IsLocked], [LockedById], [LockedDate], [IsReported], [ReportById], [ReportDate], [ReportReason], [ReportDetails], [IsRecommended], [RecommendedById], [RecommendedDate], [IsApproved], [ApprovedById], [ApprovedDate], [IsCompleted], [CompletedById], [CompletedDate], [Tag1], [Tag2], [Tag3], [Tag4], [Tag5], [NextAppoinmentDate], [NextAppoinmentTime], [DiscountPercentageOnMedicineByDoctor], [DiscountPercentageOnInvestigationByDoctor], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PrescriptionDate]) VALUES (13, N'0000000011          ', 2, NULL, NULL, NULL, NULL, N'File 5 added', N'files\0000000011_1_thumbnail.jpg', N'.jpg', 5, 8, 7, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-06-20T21:18:38.7191128' AS DateTime2), 8, CAST(N'2025-09-29T15:55:05.5947928' AS DateTime2), 8, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Prescription_Upload] ([Id], [PrescriptionCode], [PatientId], [SmartRxId], [IsExistingPatient], [HasExistingRelative], [RelativePatientIds], [FileName], [FilePath], [FileExtension], [NumberOfFilesStoredForThisPrescription], [UserId], [FolderId], [IsSmartRxRequested], [IsLocked], [LockedById], [LockedDate], [IsReported], [ReportById], [ReportDate], [ReportReason], [ReportDetails], [IsRecommended], [RecommendedById], [RecommendedDate], [IsApproved], [ApprovedById], [ApprovedDate], [IsCompleted], [CompletedById], [CompletedDate], [Tag1], [Tag2], [Tag3], [Tag4], [Tag5], [NextAppoinmentDate], [NextAppoinmentTime], [DiscountPercentageOnMedicineByDoctor], [DiscountPercentageOnInvestigationByDoctor], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PrescriptionDate]) VALUES (20, N'0000000012          ', 3, NULL, NULL, NULL, NULL, N'Raihan-1', N'files\0000000012_1_thumbnail.jpg', N'.pdf', 1, 8, 8, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-06-25T14:36:25.5406550' AS DateTime2), 8, CAST(N'2025-09-29T15:55:13.4497278' AS DateTime2), 8, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Prescription_Upload] ([Id], [PrescriptionCode], [PatientId], [SmartRxId], [IsExistingPatient], [HasExistingRelative], [RelativePatientIds], [FileName], [FilePath], [FileExtension], [NumberOfFilesStoredForThisPrescription], [UserId], [FolderId], [IsSmartRxRequested], [IsLocked], [LockedById], [LockedDate], [IsReported], [ReportById], [ReportDate], [ReportReason], [ReportDetails], [IsRecommended], [RecommendedById], [RecommendedDate], [IsApproved], [ApprovedById], [ApprovedDate], [IsCompleted], [CompletedById], [CompletedDate], [Tag1], [Tag2], [Tag3], [Tag4], [Tag5], [NextAppoinmentDate], [NextAppoinmentTime], [DiscountPercentageOnMedicineByDoctor], [DiscountPercentageOnInvestigationByDoctor], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PrescriptionDate]) VALUES (21, N'0000000013          ', 1, NULL, NULL, NULL, NULL, N'Hasan fever', N'files\0000000013_1_thumbnail.jpg', N'.jpg', 2, 8, 7, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-06-25T18:28:11.6111339' AS DateTime2), 8, CAST(N'2025-07-01T13:00:04.5396324' AS DateTime2), 8, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Prescription_Upload] ([Id], [PrescriptionCode], [PatientId], [SmartRxId], [IsExistingPatient], [HasExistingRelative], [RelativePatientIds], [FileName], [FilePath], [FileExtension], [NumberOfFilesStoredForThisPrescription], [UserId], [FolderId], [IsSmartRxRequested], [IsLocked], [LockedById], [LockedDate], [IsReported], [ReportById], [ReportDate], [ReportReason], [ReportDetails], [IsRecommended], [RecommendedById], [RecommendedDate], [IsApproved], [ApprovedById], [ApprovedDate], [IsCompleted], [CompletedById], [CompletedDate], [Tag1], [Tag2], [Tag3], [Tag4], [Tag5], [NextAppoinmentDate], [NextAppoinmentTime], [DiscountPercentageOnMedicineByDoctor], [DiscountPercentageOnInvestigationByDoctor], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PrescriptionDate]) VALUES (22, N'0000000014          ', 2, NULL, NULL, NULL, NULL, N'Hasan Back Pain', N'files\0000000014_1_thumbnail.jpg', N'.pdf', 3, 8, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-06-25T18:28:57.7676725' AS DateTime2), 8, NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Prescription_Upload] ([Id], [PrescriptionCode], [PatientId], [SmartRxId], [IsExistingPatient], [HasExistingRelative], [RelativePatientIds], [FileName], [FilePath], [FileExtension], [NumberOfFilesStoredForThisPrescription], [UserId], [FolderId], [IsSmartRxRequested], [IsLocked], [LockedById], [LockedDate], [IsReported], [ReportById], [ReportDate], [ReportReason], [ReportDetails], [IsRecommended], [RecommendedById], [RecommendedDate], [IsApproved], [ApprovedById], [ApprovedDate], [IsCompleted], [CompletedById], [CompletedDate], [Tag1], [Tag2], [Tag3], [Tag4], [Tag5], [NextAppoinmentDate], [NextAppoinmentTime], [DiscountPercentageOnMedicineByDoctor], [DiscountPercentageOnInvestigationByDoctor], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PrescriptionDate]) VALUES (23, N'0000000015          ', 3, NULL, NULL, NULL, NULL, N'Hasan Test', N'files\0000000015_1_thumbnail.jpg', N'.jpg', 2, 8, 7, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-06-25T18:29:58.1754356' AS DateTime2), 8, CAST(N'2025-06-25T18:32:16.6570343' AS DateTime2), 8, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Prescription_Upload] ([Id], [PrescriptionCode], [PatientId], [SmartRxId], [IsExistingPatient], [HasExistingRelative], [RelativePatientIds], [FileName], [FilePath], [FileExtension], [NumberOfFilesStoredForThisPrescription], [UserId], [FolderId], [IsSmartRxRequested], [IsLocked], [LockedById], [LockedDate], [IsReported], [ReportById], [ReportDate], [ReportReason], [ReportDetails], [IsRecommended], [RecommendedById], [RecommendedDate], [IsApproved], [ApprovedById], [ApprovedDate], [IsCompleted], [CompletedById], [CompletedDate], [Tag1], [Tag2], [Tag3], [Tag4], [Tag5], [NextAppoinmentDate], [NextAppoinmentTime], [DiscountPercentageOnMedicineByDoctor], [DiscountPercentageOnInvestigationByDoctor], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PrescriptionDate]) VALUES (25, N'0000000016          ', 1, NULL, NULL, NULL, NULL, N'kkk', N'files\0000000016_1_thumbnail.jpg', N'.jpg', 1, 8, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-07-08T13:25:01.1586763' AS DateTime2), 8, CAST(N'2025-07-08T13:25:44.6368857' AS DateTime2), 8, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Prescription_Upload] ([Id], [PrescriptionCode], [PatientId], [SmartRxId], [IsExistingPatient], [HasExistingRelative], [RelativePatientIds], [FileName], [FilePath], [FileExtension], [NumberOfFilesStoredForThisPrescription], [UserId], [FolderId], [IsSmartRxRequested], [IsLocked], [LockedById], [LockedDate], [IsReported], [ReportById], [ReportDate], [ReportReason], [ReportDetails], [IsRecommended], [RecommendedById], [RecommendedDate], [IsApproved], [ApprovedById], [ApprovedDate], [IsCompleted], [CompletedById], [CompletedDate], [Tag1], [Tag2], [Tag3], [Tag4], [Tag5], [NextAppoinmentDate], [NextAppoinmentTime], [DiscountPercentageOnMedicineByDoctor], [DiscountPercentageOnInvestigationByDoctor], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PrescriptionDate]) VALUES (26, N'0000000017          ', 2, NULL, NULL, NULL, NULL, N'sss', N'files\0000000017_1_thumbnail.jpg', N'.jpg', 1, 8, 7, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-07-08T13:26:53.5315289' AS DateTime2), 8, CAST(N'2025-07-08T13:27:19.4252906' AS DateTime2), 8, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Prescription_Upload] ([Id], [PrescriptionCode], [PatientId], [SmartRxId], [IsExistingPatient], [HasExistingRelative], [RelativePatientIds], [FileName], [FilePath], [FileExtension], [NumberOfFilesStoredForThisPrescription], [UserId], [FolderId], [IsSmartRxRequested], [IsLocked], [LockedById], [LockedDate], [IsReported], [ReportById], [ReportDate], [ReportReason], [ReportDetails], [IsRecommended], [RecommendedById], [RecommendedDate], [IsApproved], [ApprovedById], [ApprovedDate], [IsCompleted], [CompletedById], [CompletedDate], [Tag1], [Tag2], [Tag3], [Tag4], [Tag5], [NextAppoinmentDate], [NextAppoinmentTime], [DiscountPercentageOnMedicineByDoctor], [DiscountPercentageOnInvestigationByDoctor], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PrescriptionDate]) VALUES (27, N'0000000018          ', 3, NULL, NULL, NULL, NULL, N'Default file name auto', N'files\0000000018_1_thumbnail.jpg', N'.jpg', 2, 9, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-07-08T23:42:29.9638055' AS DateTime2), 9, NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Prescription_Upload] ([Id], [PrescriptionCode], [PatientId], [SmartRxId], [IsExistingPatient], [HasExistingRelative], [RelativePatientIds], [FileName], [FilePath], [FileExtension], [NumberOfFilesStoredForThisPrescription], [UserId], [FolderId], [IsSmartRxRequested], [IsLocked], [LockedById], [LockedDate], [IsReported], [ReportById], [ReportDate], [ReportReason], [ReportDetails], [IsRecommended], [RecommendedById], [RecommendedDate], [IsApproved], [ApprovedById], [ApprovedDate], [IsCompleted], [CompletedById], [CompletedDate], [Tag1], [Tag2], [Tag3], [Tag4], [Tag5], [NextAppoinmentDate], [NextAppoinmentTime], [DiscountPercentageOnMedicineByDoctor], [DiscountPercentageOnInvestigationByDoctor], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PrescriptionDate]) VALUES (28, N'0000000019          ', 1, NULL, NULL, NULL, NULL, N'sss', N'files\0000000019_1_thumbnail.jpg', N'.pdf', 1, 8, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-08-24T11:59:39.6492082' AS DateTime2), 8, NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Prescription_Upload] ([Id], [PrescriptionCode], [PatientId], [SmartRxId], [IsExistingPatient], [HasExistingRelative], [RelativePatientIds], [FileName], [FilePath], [FileExtension], [NumberOfFilesStoredForThisPrescription], [UserId], [FolderId], [IsSmartRxRequested], [IsLocked], [LockedById], [LockedDate], [IsReported], [ReportById], [ReportDate], [ReportReason], [ReportDetails], [IsRecommended], [RecommendedById], [RecommendedDate], [IsApproved], [ApprovedById], [ApprovedDate], [IsCompleted], [CompletedById], [CompletedDate], [Tag1], [Tag2], [Tag3], [Tag4], [Tag5], [NextAppoinmentDate], [NextAppoinmentTime], [DiscountPercentageOnMedicineByDoctor], [DiscountPercentageOnInvestigationByDoctor], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PrescriptionDate]) VALUES (29, N'0000000020          ', 2, NULL, NULL, NULL, NULL, N'rrr', N'files\0000000020_1_thumbnail.jpg', N'.pdf', 1, 8, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-08-24T12:44:24.3854188' AS DateTime2), 8, NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Prescription_Upload] ([Id], [PrescriptionCode], [PatientId], [SmartRxId], [IsExistingPatient], [HasExistingRelative], [RelativePatientIds], [FileName], [FilePath], [FileExtension], [NumberOfFilesStoredForThisPrescription], [UserId], [FolderId], [IsSmartRxRequested], [IsLocked], [LockedById], [LockedDate], [IsReported], [ReportById], [ReportDate], [ReportReason], [ReportDetails], [IsRecommended], [RecommendedById], [RecommendedDate], [IsApproved], [ApprovedById], [ApprovedDate], [IsCompleted], [CompletedById], [CompletedDate], [Tag1], [Tag2], [Tag3], [Tag4], [Tag5], [NextAppoinmentDate], [NextAppoinmentTime], [DiscountPercentageOnMedicineByDoctor], [DiscountPercentageOnInvestigationByDoctor], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PrescriptionDate]) VALUES (30, N'0000000021          ', 1, NULL, NULL, NULL, NULL, N'uuu', N'files\0000000021_1_thumbnail.jpg', N'.jpg', 2, 8, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-08-24T12:45:11.2348038' AS DateTime2), 8, NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Prescription_Upload] ([Id], [PrescriptionCode], [PatientId], [SmartRxId], [IsExistingPatient], [HasExistingRelative], [RelativePatientIds], [FileName], [FilePath], [FileExtension], [NumberOfFilesStoredForThisPrescription], [UserId], [FolderId], [IsSmartRxRequested], [IsLocked], [LockedById], [LockedDate], [IsReported], [ReportById], [ReportDate], [ReportReason], [ReportDetails], [IsRecommended], [RecommendedById], [RecommendedDate], [IsApproved], [ApprovedById], [ApprovedDate], [IsCompleted], [CompletedById], [CompletedDate], [Tag1], [Tag2], [Tag3], [Tag4], [Tag5], [NextAppoinmentDate], [NextAppoinmentTime], [DiscountPercentageOnMedicineByDoctor], [DiscountPercentageOnInvestigationByDoctor], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PrescriptionDate]) VALUES (31, N'0000000022          ', 2, NULL, NULL, NULL, NULL, N'23092025', N'files\0000000022_1_thumbnail.jpg', N'.jpg', 2, 10, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-09-23T22:32:08.1937385' AS DateTime2), 10, NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Prescription_Upload] ([Id], [PrescriptionCode], [PatientId], [SmartRxId], [IsExistingPatient], [HasExistingRelative], [RelativePatientIds], [FileName], [FilePath], [FileExtension], [NumberOfFilesStoredForThisPrescription], [UserId], [FolderId], [IsSmartRxRequested], [IsLocked], [LockedById], [LockedDate], [IsReported], [ReportById], [ReportDate], [ReportReason], [ReportDetails], [IsRecommended], [RecommendedById], [RecommendedDate], [IsApproved], [ApprovedById], [ApprovedDate], [IsCompleted], [CompletedById], [CompletedDate], [Tag1], [Tag2], [Tag3], [Tag4], [Tag5], [NextAppoinmentDate], [NextAppoinmentTime], [DiscountPercentageOnMedicineByDoctor], [DiscountPercentageOnInvestigationByDoctor], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PrescriptionDate]) VALUES (32, N'0000000023          ', 3, NULL, NULL, NULL, NULL, N'23092025', N'files\0000000023_1_thumbnail.jpg', N'.jpg', 2, 8, 7, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-09-23T22:42:18.3715246' AS DateTime2), 8, CAST(N'2025-09-23T22:53:52.2376355' AS DateTime2), 8, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Prescription_Upload] ([Id], [PrescriptionCode], [PatientId], [SmartRxId], [IsExistingPatient], [HasExistingRelative], [RelativePatientIds], [FileName], [FilePath], [FileExtension], [NumberOfFilesStoredForThisPrescription], [UserId], [FolderId], [IsSmartRxRequested], [IsLocked], [LockedById], [LockedDate], [IsReported], [ReportById], [ReportDate], [ReportReason], [ReportDetails], [IsRecommended], [RecommendedById], [RecommendedDate], [IsApproved], [ApprovedById], [ApprovedDate], [IsCompleted], [CompletedById], [CompletedDate], [Tag1], [Tag2], [Tag3], [Tag4], [Tag5], [NextAppoinmentDate], [NextAppoinmentTime], [DiscountPercentageOnMedicineByDoctor], [DiscountPercentageOnInvestigationByDoctor], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PrescriptionDate]) VALUES (33, N'0000000024          ', 1, NULL, NULL, NULL, NULL, N'List of Acronyms', N'files\0000000024_1_thumbnail.jpg', N'.pdf', 1, 8, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Shahanaz', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-09-25T12:42:38.6143352' AS DateTime2), 8, CAST(N'2025-09-29T12:00:18.4213506' AS DateTime2), 7, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Prescription_Upload] ([Id], [PrescriptionCode], [PatientId], [SmartRxId], [IsExistingPatient], [HasExistingRelative], [RelativePatientIds], [FileName], [FilePath], [FileExtension], [NumberOfFilesStoredForThisPrescription], [UserId], [FolderId], [IsSmartRxRequested], [IsLocked], [LockedById], [LockedDate], [IsReported], [ReportById], [ReportDate], [ReportReason], [ReportDetails], [IsRecommended], [RecommendedById], [RecommendedDate], [IsApproved], [ApprovedById], [ApprovedDate], [IsCompleted], [CompletedById], [CompletedDate], [Tag1], [Tag2], [Tag3], [Tag4], [Tag5], [NextAppoinmentDate], [NextAppoinmentTime], [DiscountPercentageOnMedicineByDoctor], [DiscountPercentageOnInvestigationByDoctor], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PrescriptionDate]) VALUES (36, N'0000000026          ', 2, NULL, NULL, NULL, NULL, N'cvc', N'files\0000000026_1_thumbnail.jpg', N'.pdf', 1, 11, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Khulna', N'Dhaka', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-09-28T12:10:35.8323420' AS DateTime2), 11, CAST(N'2025-09-28T23:20:00.8615053' AS DateTime2), 7, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Prescription_Upload] ([Id], [PrescriptionCode], [PatientId], [SmartRxId], [IsExistingPatient], [HasExistingRelative], [RelativePatientIds], [FileName], [FilePath], [FileExtension], [NumberOfFilesStoredForThisPrescription], [UserId], [FolderId], [IsSmartRxRequested], [IsLocked], [LockedById], [LockedDate], [IsReported], [ReportById], [ReportDate], [ReportReason], [ReportDetails], [IsRecommended], [RecommendedById], [RecommendedDate], [IsApproved], [ApprovedById], [ApprovedDate], [IsCompleted], [CompletedById], [CompletedDate], [Tag1], [Tag2], [Tag3], [Tag4], [Tag5], [NextAppoinmentDate], [NextAppoinmentTime], [DiscountPercentageOnMedicineByDoctor], [DiscountPercentageOnInvestigationByDoctor], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PrescriptionDate]) VALUES (37, N'0000000027          ', NULL, NULL, NULL, NULL, NULL, N'Toriqul Islam', N'files\0000000027_1_thumbnail.jpg', N'.jpg', 1, 12, 20, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-09-30T21:20:23.6836139' AS DateTime2), 12, CAST(N'2025-09-30T21:30:18.5185755' AS DateTime2), 12, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Prescription_Upload] ([Id], [PrescriptionCode], [PatientId], [SmartRxId], [IsExistingPatient], [HasExistingRelative], [RelativePatientIds], [FileName], [FilePath], [FileExtension], [NumberOfFilesStoredForThisPrescription], [UserId], [FolderId], [IsSmartRxRequested], [IsLocked], [LockedById], [LockedDate], [IsReported], [ReportById], [ReportDate], [ReportReason], [ReportDetails], [IsRecommended], [RecommendedById], [RecommendedDate], [IsApproved], [ApprovedById], [ApprovedDate], [IsCompleted], [CompletedById], [CompletedDate], [Tag1], [Tag2], [Tag3], [Tag4], [Tag5], [NextAppoinmentDate], [NextAppoinmentTime], [DiscountPercentageOnMedicineByDoctor], [DiscountPercentageOnInvestigationByDoctor], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PrescriptionDate]) VALUES (38, N'0000000028          ', NULL, NULL, NULL, NULL, NULL, N'Torikul 2', N'files\0000000028_1_thumbnail.jpg', N'.jpg', 2, 12, 20, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-09-30T21:36:30.8510537' AS DateTime2), 12, CAST(N'2025-09-30T21:36:44.6366895' AS DateTime2), 12, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Prescription_Upload] ([Id], [PrescriptionCode], [PatientId], [SmartRxId], [IsExistingPatient], [HasExistingRelative], [RelativePatientIds], [FileName], [FilePath], [FileExtension], [NumberOfFilesStoredForThisPrescription], [UserId], [FolderId], [IsSmartRxRequested], [IsLocked], [LockedById], [LockedDate], [IsReported], [ReportById], [ReportDate], [ReportReason], [ReportDetails], [IsRecommended], [RecommendedById], [RecommendedDate], [IsApproved], [ApprovedById], [ApprovedDate], [IsCompleted], [CompletedById], [CompletedDate], [Tag1], [Tag2], [Tag3], [Tag4], [Tag5], [NextAppoinmentDate], [NextAppoinmentTime], [DiscountPercentageOnMedicineByDoctor], [DiscountPercentageOnInvestigationByDoctor], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PrescriptionDate]) VALUES (39, N'0000000029          ', NULL, NULL, NULL, NULL, NULL, N'T 3', N'files\0000000029_1_thumbnail.jpg', N'.pdf', 1, 12, 20, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-09-30T21:38:39.1612366' AS DateTime2), 12, CAST(N'2025-09-30T21:39:02.7108803' AS DateTime2), 12, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Prescription_Upload] ([Id], [PrescriptionCode], [PatientId], [SmartRxId], [IsExistingPatient], [HasExistingRelative], [RelativePatientIds], [FileName], [FilePath], [FileExtension], [NumberOfFilesStoredForThisPrescription], [UserId], [FolderId], [IsSmartRxRequested], [IsLocked], [LockedById], [LockedDate], [IsReported], [ReportById], [ReportDate], [ReportReason], [ReportDetails], [IsRecommended], [RecommendedById], [RecommendedDate], [IsApproved], [ApprovedById], [ApprovedDate], [IsCompleted], [CompletedById], [CompletedDate], [Tag1], [Tag2], [Tag3], [Tag4], [Tag5], [NextAppoinmentDate], [NextAppoinmentTime], [DiscountPercentageOnMedicineByDoctor], [DiscountPercentageOnInvestigationByDoctor], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PrescriptionDate]) VALUES (40, N'0000000030          ', NULL, NULL, NULL, NULL, NULL, N'T4', N'files\0000000030_1_thumbnail.jpg', N'.jpg', 2, 12, 20, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-09-30T21:40:20.7128729' AS DateTime2), 12, CAST(N'2025-09-30T21:40:36.4046502' AS DateTime2), 12, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Prescription_Upload] ([Id], [PrescriptionCode], [PatientId], [SmartRxId], [IsExistingPatient], [HasExistingRelative], [RelativePatientIds], [FileName], [FilePath], [FileExtension], [NumberOfFilesStoredForThisPrescription], [UserId], [FolderId], [IsSmartRxRequested], [IsLocked], [LockedById], [LockedDate], [IsReported], [ReportById], [ReportDate], [ReportReason], [ReportDetails], [IsRecommended], [RecommendedById], [RecommendedDate], [IsApproved], [ApprovedById], [ApprovedDate], [IsCompleted], [CompletedById], [CompletedDate], [Tag1], [Tag2], [Tag3], [Tag4], [Tag5], [NextAppoinmentDate], [NextAppoinmentTime], [DiscountPercentageOnMedicineByDoctor], [DiscountPercentageOnInvestigationByDoctor], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PrescriptionDate]) VALUES (41, N'0000000031          ', NULL, NULL, NULL, NULL, NULL, N'Taa', N'files\0000000031_1_thumbnail.jpg', N'.jpg', 2, 13, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-09-30T22:17:33.1028031' AS DateTime2), 13, NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Prescription_Upload] ([Id], [PrescriptionCode], [PatientId], [SmartRxId], [IsExistingPatient], [HasExistingRelative], [RelativePatientIds], [FileName], [FilePath], [FileExtension], [NumberOfFilesStoredForThisPrescription], [UserId], [FolderId], [IsSmartRxRequested], [IsLocked], [LockedById], [LockedDate], [IsReported], [ReportById], [ReportDate], [ReportReason], [ReportDetails], [IsRecommended], [RecommendedById], [RecommendedDate], [IsApproved], [ApprovedById], [ApprovedDate], [IsCompleted], [CompletedById], [CompletedDate], [Tag1], [Tag2], [Tag3], [Tag4], [Tag5], [NextAppoinmentDate], [NextAppoinmentTime], [DiscountPercentageOnMedicineByDoctor], [DiscountPercentageOnInvestigationByDoctor], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PrescriptionDate]) VALUES (42, N'0000000032          ', NULL, NULL, NULL, NULL, NULL, N'Tbb', N'files\0000000032_1_thumbnail.jpg', N'.png', 1, 13, 21, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-09-30T22:19:44.8566784' AS DateTime2), 13, CAST(N'2025-09-30T22:19:48.5810682' AS DateTime2), 13, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[Prescription_Upload] OFF
GO
SET IDENTITY_INSERT [dbo].[Prescription_UserWiseFolder] ON 
GO
INSERT [dbo].[Prescription_UserWiseFolder] ([Id], [ParentFolderId], [FolderHierarchy], [FolderName], [Description], [UserId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PatientId]) VALUES (1, NULL, N'0', N'Primary', N'Default Folder', 7, CAST(N'2025-06-02T17:22:29.5910924' AS DateTime2), 7, NULL, NULL, NULL)
GO
INSERT [dbo].[Prescription_UserWiseFolder] ([Id], [ParentFolderId], [FolderHierarchy], [FolderName], [Description], [UserId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PatientId]) VALUES (2, 1, N'1', N'Mother', N'ss', 7, CAST(N'2025-06-02T17:27:00.2970010' AS DateTime2), 7, NULL, NULL, NULL)
GO
INSERT [dbo].[Prescription_UserWiseFolder] ([Id], [ParentFolderId], [FolderHierarchy], [FolderName], [Description], [UserId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PatientId]) VALUES (3, 1, N'1', N'Father', N'ff', 7, CAST(N'2025-06-02T17:27:08.7521060' AS DateTime2), 7, NULL, NULL, NULL)
GO
INSERT [dbo].[Prescription_UserWiseFolder] ([Id], [ParentFolderId], [FolderHierarchy], [FolderName], [Description], [UserId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PatientId]) VALUES (4, 1, N'1', N'Sister', N'sss', 7, CAST(N'2025-06-02T17:27:19.2718899' AS DateTime2), 7, NULL, NULL, NULL)
GO
INSERT [dbo].[Prescription_UserWiseFolder] ([Id], [ParentFolderId], [FolderHierarchy], [FolderName], [Description], [UserId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PatientId]) VALUES (5, 1, N'1', N'Brother 1', N'b1', 7, CAST(N'2025-06-02T17:27:27.1789902' AS DateTime2), 7, NULL, NULL, NULL)
GO
INSERT [dbo].[Prescription_UserWiseFolder] ([Id], [ParentFolderId], [FolderHierarchy], [FolderName], [Description], [UserId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PatientId]) VALUES (6, 1, N'1', N'Brother 2', N'b2', 7, CAST(N'2025-06-02T17:27:36.6282487' AS DateTime2), 7, NULL, NULL, NULL)
GO
INSERT [dbo].[Prescription_UserWiseFolder] ([Id], [ParentFolderId], [FolderHierarchy], [FolderName], [Description], [UserId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PatientId]) VALUES (7, NULL, N'0', N'Primary', N'Default Folder', 8, CAST(N'2025-06-16T19:27:31.7438920' AS DateTime2), 8, NULL, NULL, 1)
GO
INSERT [dbo].[Prescription_UserWiseFolder] ([Id], [ParentFolderId], [FolderHierarchy], [FolderName], [Description], [UserId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PatientId]) VALUES (8, 7, N'1', N'Tamzid', N'', 8, CAST(N'2025-06-23T15:40:54.7487466' AS DateTime2), 8, NULL, NULL, NULL)
GO
INSERT [dbo].[Prescription_UserWiseFolder] ([Id], [ParentFolderId], [FolderHierarchy], [FolderName], [Description], [UserId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PatientId]) VALUES (9, 8, N'2', N'Hasan', N'', 8, CAST(N'2025-06-25T18:27:06.6110275' AS DateTime2), 8, NULL, NULL, NULL)
GO
INSERT [dbo].[Prescription_UserWiseFolder] ([Id], [ParentFolderId], [FolderHierarchy], [FolderName], [Description], [UserId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PatientId]) VALUES (12, 7, N'1', N'test', N'no desc', 8, CAST(N'2025-07-08T13:23:50.0566066' AS DateTime2), 8, NULL, NULL, NULL)
GO
INSERT [dbo].[Prescription_UserWiseFolder] ([Id], [ParentFolderId], [FolderHierarchy], [FolderName], [Description], [UserId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PatientId]) VALUES (13, NULL, N'0', N'Primary', N'Default Folder', 9, CAST(N'2025-07-08T23:38:51.9756887' AS DateTime2), 9, NULL, NULL, NULL)
GO
INSERT [dbo].[Prescription_UserWiseFolder] ([Id], [ParentFolderId], [FolderHierarchy], [FolderName], [Description], [UserId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PatientId]) VALUES (14, 7, N'1', N'New Folder', N'Yesud', 8, CAST(N'2025-07-14T20:18:58.4017717' AS DateTime2), 8, CAST(N'2025-07-16T22:37:35.7380834' AS DateTime2), 8, NULL)
GO
INSERT [dbo].[Prescription_UserWiseFolder] ([Id], [ParentFolderId], [FolderHierarchy], [FolderName], [Description], [UserId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PatientId]) VALUES (16, NULL, N'0', N'Primary', N'Default Folder', 10, CAST(N'2025-09-23T22:29:43.6735098' AS DateTime2), 10, NULL, NULL, NULL)
GO
INSERT [dbo].[Prescription_UserWiseFolder] ([Id], [ParentFolderId], [FolderHierarchy], [FolderName], [Description], [UserId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PatientId]) VALUES (18, NULL, N'0', N'Primary', N'Default Folder', 11, CAST(N'2025-09-23T22:29:43.6735098' AS DateTime2), 11, NULL, NULL, NULL)
GO
INSERT [dbo].[Prescription_UserWiseFolder] ([Id], [ParentFolderId], [FolderHierarchy], [FolderName], [Description], [UserId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PatientId]) VALUES (19, 18, N'0', N'Shahanaz', N'', 11, CAST(N'2025-09-28T23:20:34.8287066' AS DateTime2), 11, NULL, NULL, NULL)
GO
INSERT [dbo].[Prescription_UserWiseFolder] ([Id], [ParentFolderId], [FolderHierarchy], [FolderName], [Description], [UserId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PatientId]) VALUES (20, NULL, N'0', N'Primary', N'Default Folder', 12, CAST(N'2025-09-30T21:11:24.0641285' AS DateTime2), 12, NULL, NULL, NULL)
GO
INSERT [dbo].[Prescription_UserWiseFolder] ([Id], [ParentFolderId], [FolderHierarchy], [FolderName], [Description], [UserId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PatientId]) VALUES (21, NULL, N'0', N'Primary', N'Default Folder', 13, CAST(N'2025-09-30T22:13:32.5934287' AS DateTime2), 13, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Prescription_UserWiseFolder] OFF
GO
SET IDENTITY_INSERT [dbo].[Security_PMSRole] ON 
GO
INSERT [dbo].[Security_PMSRole] ([Id], [Name], [Description], [IsSelfService], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (1, N'Super Admin', N'Super Admin is the only one user in the system and all super access has in it and to recover the system only this user can be usable ', 0, CAST(N'2025-06-11T23:34:00.8915593' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Security_PMSRole] ([Id], [Name], [Description], [IsSelfService], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (2, N'Admin', N'Admin is to manipulated all general access and manage system', 0, CAST(N'2025-06-11T23:34:00.8917110' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Security_PMSRole] ([Id], [Name], [Description], [IsSelfService], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (3, N'Entry User', N'An admin user who can enter all data into the system', 1, CAST(N'2025-06-11T23:34:00.8917160' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Security_PMSRole] ([Id], [Name], [Description], [IsSelfService], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (4, N'Recommender', NULL, 1, CAST(N'2025-06-11T23:34:00.8917201' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Security_PMSRole] ([Id], [Name], [Description], [IsSelfService], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (5, N'Approver', NULL, 1, CAST(N'2025-06-11T23:34:00.8917233' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Security_PMSRole] ([Id], [Name], [Description], [IsSelfService], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (6, N'External User', N'Only outside user are in this list', 0, CAST(N'2025-06-11T23:34:00.8917267' AS DateTime2), 2, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Security_PMSRole] OFF
GO
SET IDENTITY_INSERT [dbo].[Security_PMSUser] ON 
GO
INSERT [dbo].[Security_PMSUser] ([Id], [UserCode], [UserName], [Password], [MobileNo], [GoogleId], [FacebookId], [TwitterId], [Email], [FirstName], [LastName], [AuthMethod], [EmployeeId], [EmployeeCode], [Gender], [DateOfBirth], [Status], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [SmartRxUserEntityId]) VALUES (1, N'0000000001', N'superadmin', N'1234', N'01786756453', N'', N'', N'', N'', N'S. M.', N'Tamzid', 1, NULL, NULL, 1, CAST(N'1980-05-20T00:00:00.0000000' AS DateTime2), 1, CAST(N'2025-06-11T23:34:00.6111495' AS DateTime2), NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Security_PMSUser] ([Id], [UserCode], [UserName], [Password], [MobileNo], [GoogleId], [FacebookId], [TwitterId], [Email], [FirstName], [LastName], [AuthMethod], [EmployeeId], [EmployeeCode], [Gender], [DateOfBirth], [Status], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [SmartRxUserEntityId]) VALUES (2, N'0000000002', N'admin', N'1234', N'01786756453', N'', N'', N'', N'', N'Selim', N'Ahmed', 1, NULL, NULL, 1, CAST(N'1975-10-05T00:00:00.0000000' AS DateTime2), 1, CAST(N'2025-06-11T23:34:00.6120321' AS DateTime2), NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Security_PMSUser] ([Id], [UserCode], [UserName], [Password], [MobileNo], [GoogleId], [FacebookId], [TwitterId], [Email], [FirstName], [LastName], [AuthMethod], [EmployeeId], [EmployeeCode], [Gender], [DateOfBirth], [Status], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [SmartRxUserEntityId]) VALUES (3, N'0000000003', N'entryuser', N'1234', N'01786756456', N'', N'', N'', N'', N'Sharif', N'Uddin', 1, NULL, NULL, 1, CAST(N'1970-08-15T00:00:00.0000000' AS DateTime2), 1, CAST(N'2025-06-11T23:34:00.6120336' AS DateTime2), NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Security_PMSUser] ([Id], [UserCode], [UserName], [Password], [MobileNo], [GoogleId], [FacebookId], [TwitterId], [Email], [FirstName], [LastName], [AuthMethod], [EmployeeId], [EmployeeCode], [Gender], [DateOfBirth], [Status], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [SmartRxUserEntityId]) VALUES (4, N'0000000004', N'recommender', N'1234', N'01786756454', N'', N'', N'', N'', N'Mamun', N'Ahmed', 1, NULL, NULL, 1, CAST(N'1980-05-20T00:00:00.0000000' AS DateTime2), 1, CAST(N'2025-06-11T23:34:00.6120341' AS DateTime2), NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Security_PMSUser] ([Id], [UserCode], [UserName], [Password], [MobileNo], [GoogleId], [FacebookId], [TwitterId], [Email], [FirstName], [LastName], [AuthMethod], [EmployeeId], [EmployeeCode], [Gender], [DateOfBirth], [Status], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [SmartRxUserEntityId]) VALUES (5, N'0000000005', N'approver', N'1234', N'01786756455', N'', N'', N'', N'', N'Ali', N'Akbar', 1, NULL, NULL, 1, CAST(N'1978-05-30T00:00:00.0000000' AS DateTime2), 1, CAST(N'2025-06-11T23:34:00.6120346' AS DateTime2), NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Security_PMSUser] ([Id], [UserCode], [UserName], [Password], [MobileNo], [GoogleId], [FacebookId], [TwitterId], [Email], [FirstName], [LastName], [AuthMethod], [EmployeeId], [EmployeeCode], [Gender], [DateOfBirth], [Status], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [SmartRxUserEntityId]) VALUES (6, N'0000000006', N'externaluser', N'1234', N'01786756456', N'', N'', N'', N'', N'Rakibul', N'Islam', 1, NULL, NULL, 1, CAST(N'1988-08-15T00:00:00.0000000' AS DateTime2), 1, CAST(N'2025-06-11T23:34:00.6120350' AS DateTime2), NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Security_PMSUser] ([Id], [UserCode], [UserName], [Password], [MobileNo], [GoogleId], [FacebookId], [TwitterId], [Email], [FirstName], [LastName], [AuthMethod], [EmployeeId], [EmployeeCode], [Gender], [DateOfBirth], [Status], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [SmartRxUserEntityId]) VALUES (7, N'0000000007', N'8801996806686', N'AQAAAAIAAYagAAAAEFW2L41jBrR1VwVNQiWfB69VgnbQyNAi7aO7YfxzHAottLcIKKsSPRyTwIxYOJHvHQ==', N'8801996806686', N'', N'', N'', N'', N'Shahanaz', N'Sultana', 2, 0, N'', 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, CAST(N'2025-06-02T17:22:29.2835732' AS DateTime2), 6, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Security_PMSUser] ([Id], [UserCode], [UserName], [Password], [MobileNo], [GoogleId], [FacebookId], [TwitterId], [Email], [FirstName], [LastName], [AuthMethod], [EmployeeId], [EmployeeCode], [Gender], [DateOfBirth], [Status], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [SmartRxUserEntityId]) VALUES (8, N'0000000008', N'8801716155239', N'AQAAAAIAAYagAAAAEAY+fSyeQui8OR5PC2sLtca0xh8FbP7aDSk3PJIlvODjBrLRVQFpISR51Mjn98NTJw==', N'8801716155239', N'', N'', N'', N'', N'Raihan', N'Wahid', 2, 0, N'', 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, CAST(N'2025-06-16T19:27:31.3591639' AS DateTime2), 6, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Security_PMSUser] ([Id], [UserCode], [UserName], [Password], [MobileNo], [GoogleId], [FacebookId], [TwitterId], [Email], [FirstName], [LastName], [AuthMethod], [EmployeeId], [EmployeeCode], [Gender], [DateOfBirth], [Status], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [SmartRxUserEntityId]) VALUES (9, N'0000000009', N'8801767565432', N'AQAAAAIAAYagAAAAEFJF4clY8/A1R/NyDj/ic3Di8fOOLIp9dxvBbvyrBQgtSJ/zMOr3tg2qGXBL0m2x2w==', N'8801767565432', N'', N'', N'', N'', N'sss', N'sss', 2, 0, N'', 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, CAST(N'2025-07-08T23:38:51.6926700' AS DateTime2), 6, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Security_PMSUser] ([Id], [UserCode], [UserName], [Password], [MobileNo], [GoogleId], [FacebookId], [TwitterId], [Email], [FirstName], [LastName], [AuthMethod], [EmployeeId], [EmployeeCode], [Gender], [DateOfBirth], [Status], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [SmartRxUserEntityId]) VALUES (10, N'0000000010', N'8801786756453', N'AQAAAAIAAYagAAAAELHB4AGVMnJkpcIl30m6KO5Y0A+cc8ScrI1wy1U5ak0z9yISxII7oWw3yfqGKw9vlg==', N'8801786756453', N'', N'', N'', N'', N'ttt', N'yyy', 2, 0, N'', 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, CAST(N'2025-09-23T22:29:43.3846502' AS DateTime2), 6, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Security_PMSUser] ([Id], [UserCode], [UserName], [Password], [MobileNo], [GoogleId], [FacebookId], [TwitterId], [Email], [FirstName], [LastName], [AuthMethod], [EmployeeId], [EmployeeCode], [Gender], [DateOfBirth], [Status], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [SmartRxUserEntityId]) VALUES (11, N'0000000011', N'8801987967562', N'AQAAAAIAAYagAAAAEJ6Md20OkgprQFsTrPgX4DTibkOb+hQOHXp42jVqsPboWJ1jEaUiSAMMs8Ovgststw==', N'8801987967562', N'', N'', N'', N'', N'Ibn', N'Sina', 2, 0, N'', 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, CAST(N'2025-09-25T15:08:51.8047520' AS DateTime2), 6, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Security_PMSUser] ([Id], [UserCode], [UserName], [Password], [MobileNo], [GoogleId], [FacebookId], [TwitterId], [Email], [FirstName], [LastName], [AuthMethod], [EmployeeId], [EmployeeCode], [Gender], [DateOfBirth], [Status], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [SmartRxUserEntityId]) VALUES (12, N'0000000012', N'8801876549678', N'AQAAAAIAAYagAAAAEC859yfjDyRFloJcIRC5ISLwYaRERS+ZgwMdF+FiqYCSxUsSIXW+1/E9oSzFhdHaWw==', N'8801876549678', N'', N'', N'', N'', N'Toriqul ', N'Islam', 2, 0, N'', 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, CAST(N'2025-09-30T21:11:23.6295291' AS DateTime2), 6, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Security_PMSUser] ([Id], [UserCode], [UserName], [Password], [MobileNo], [GoogleId], [FacebookId], [TwitterId], [Email], [FirstName], [LastName], [AuthMethod], [EmployeeId], [EmployeeCode], [Gender], [DateOfBirth], [Status], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [SmartRxUserEntityId]) VALUES (13, N'0000000013', N'8801897869876', N'AQAAAAIAAYagAAAAEH/6SuJMlCmMadpZ8+nFAMj2xF/9H6b8e9dLpglbanExnbsLRlvCxJ3gqt+pwGGB0A==', N'8801897869876', N'', N'', N'', N'', N'Mizanur', N'Rahman', 2, 0, N'', 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, CAST(N'2025-09-30T22:13:32.4779707' AS DateTime2), 6, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Security_PMSUser] OFF
GO
SET IDENTITY_INSERT [dbo].[Security_PMSUserWiseRole] ON 
GO
INSERT [dbo].[Security_PMSUserWiseRole] ([UserId], [RoleId], [Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (1, 1, 1, CAST(N'2025-06-11T23:34:01.2298944' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Security_PMSUserWiseRole] ([UserId], [RoleId], [Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (2, 2, 2, CAST(N'2025-06-11T23:34:01.2299622' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Security_PMSUserWiseRole] ([UserId], [RoleId], [Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (3, 6, 3, CAST(N'2025-06-11T23:34:01.2299734' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Security_PMSUserWiseRole] ([UserId], [RoleId], [Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (4, 4, 4, CAST(N'2025-06-11T23:34:01.2299743' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Security_PMSUserWiseRole] ([UserId], [RoleId], [Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (5, 5, 5, CAST(N'2025-06-11T23:34:01.2299749' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Security_PMSUserWiseRole] ([UserId], [RoleId], [Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (6, 6, 6, CAST(N'2025-06-11T23:34:01.2299762' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[Security_PMSUserWiseRole] ([UserId], [RoleId], [Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (8, 6, 7, CAST(N'2025-06-16T19:27:31.8437410' AS DateTime2), 8, NULL, NULL)
GO
INSERT [dbo].[Security_PMSUserWiseRole] ([UserId], [RoleId], [Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (9, 6, 8, CAST(N'2025-07-08T23:38:52.2725758' AS DateTime2), 9, NULL, NULL)
GO
INSERT [dbo].[Security_PMSUserWiseRole] ([UserId], [RoleId], [Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (10, 6, 9, CAST(N'2025-09-23T22:29:43.8191550' AS DateTime2), 10, NULL, NULL)
GO
INSERT [dbo].[Security_PMSUserWiseRole] ([UserId], [RoleId], [Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (11, 6, 10, CAST(N'2025-09-25T15:08:52.1923661' AS DateTime2), 11, NULL, NULL)
GO
INSERT [dbo].[Security_PMSUserWiseRole] ([UserId], [RoleId], [Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (12, 6, 11, CAST(N'2025-09-30T21:11:24.1918744' AS DateTime2), 12, NULL, NULL)
GO
INSERT [dbo].[Security_PMSUserWiseRole] ([UserId], [RoleId], [Id], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (13, 6, 12, CAST(N'2025-09-30T22:13:32.6132058' AS DateTime2), 13, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Security_PMSUserWiseRole] OFF
GO
SET IDENTITY_INSERT [dbo].[SmartRx_Master] ON 
GO
INSERT [dbo].[SmartRx_Master] ([Id], [UserId], [PatientId], [ChiefComplaintIds], [NextAppoinmentDate], [NextAppoinmentTime], [DiscountPercentageOnMedicineByDoctor], [DiscountPercentageOnInvestigationByDoctor], [Remarks], [IsLocked], [LockedById], [LockedDate], [IsReported], [ReportById], [ReportDate], [ReportReason], [ReportDetails], [IsRecommended], [RecommendedById], [RecommendedDate], [IsApproved], [ApprovedById], [ApprovedDate], [IsCompleted], [CompletedById], [CompletedDate], [IsRejected], [RejectedById], [RejectedDate], [RejectionRemarks], [IsExistingPatient], [HasAnyRelative], [Tag1], [Tag2], [Tag3], [Tag4], [Tag5], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [HasInvestigationFavourite], [HasMedicineFavourite], [PrescriptionId], [PrescriptionDate]) VALUES (2, 8, 1, N'', CAST(N'2025-06-07T18:33:18.4233333' AS DateTime2), N'05:30PM', CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-06-02T18:33:18.4233333' AS DateTime2), 2, CAST(N'2025-09-09T15:46:48.6431330' AS DateTime2), 8, 1, 0, 3, CAST(N'2025-02-26T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[SmartRx_Master] ([Id], [UserId], [PatientId], [ChiefComplaintIds], [NextAppoinmentDate], [NextAppoinmentTime], [DiscountPercentageOnMedicineByDoctor], [DiscountPercentageOnInvestigationByDoctor], [Remarks], [IsLocked], [LockedById], [LockedDate], [IsReported], [ReportById], [ReportDate], [ReportReason], [ReportDetails], [IsRecommended], [RecommendedById], [RecommendedDate], [IsApproved], [ApprovedById], [ApprovedDate], [IsCompleted], [CompletedById], [CompletedDate], [IsRejected], [RejectedById], [RejectedDate], [RejectionRemarks], [IsExistingPatient], [HasAnyRelative], [Tag1], [Tag2], [Tag3], [Tag4], [Tag5], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [HasInvestigationFavourite], [HasMedicineFavourite], [PrescriptionId], [PrescriptionDate]) VALUES (3, 7, 2, N'', CAST(N'2025-06-07T18:33:18.4233333' AS DateTime2), N'05:30PM', CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-06-02T18:33:18.4233333' AS DateTime2), 2, NULL, NULL, NULL, NULL, 3, NULL)
GO
SET IDENTITY_INSERT [dbo].[SmartRx_Master] OFF
GO
SET IDENTITY_INSERT [dbo].[SmartRx_PatientAdvice] ON 
GO
INSERT [dbo].[SmartRx_PatientAdvice] ([Id], [SmartRxMasterId], [PrescriptionId], [Advice], [AdviceKeywordToRecommend], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (3, 2, 3, N'Rinse with warm water', N'দাঁত, দাঁতপরিষ্কার, দাঁতব্রাশ, Teeth, TeethClean, ToothBrush', CAST(N'2025-06-03T12:00:00.0000000' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[SmartRx_PatientAdvice] ([Id], [SmartRxMasterId], [PrescriptionId], [Advice], [AdviceKeywordToRecommend], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (4, 2, 3, N'Do not use cold water', N'এলার্জি, পরিবেশগতঅ্যালার্জি, অ্যালার্জেন, Allergy, EnvironmentalAllergy, Allergen', CAST(N'2025-06-03T12:00:00.0000000' AS DateTime2), 2, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[SmartRx_PatientAdvice] OFF
GO
SET IDENTITY_INSERT [dbo].[SmartRx_PatientChiefComplaint] ON 
GO
INSERT [dbo].[SmartRx_PatientChiefComplaint] ([Id], [SmartRxMasterId], [UploadedPrescriptionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Description]) VALUES (1, 2, 3, CAST(N'2025-09-03T00:00:00.0000000' AS DateTime2), 2, NULL, NULL, N'    Increased creatinine level since 2015, 
    Fluctuation in BP since 2007 
    Diabetes')
GO
INSERT [dbo].[SmartRx_PatientChiefComplaint] ([Id], [SmartRxMasterId], [UploadedPrescriptionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Description]) VALUES (2, 2, 3, CAST(N'2025-09-03T00:00:00.0000000' AS DateTime2), 2, NULL, NULL, N'Test Chief Complaint')
GO
SET IDENTITY_INSERT [dbo].[SmartRx_PatientChiefComplaint] OFF
GO
SET IDENTITY_INSERT [dbo].[SmartRx_PatientDoctor] ON 
GO
INSERT [dbo].[SmartRx_PatientDoctor] ([Id], [SmartRxMasterId], [PrescriptionId], [DoctorId], [ChamberWaitTime], [ChamberFee], [DoctorRating], [Comments], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [ActiveChamberId], [ChamberFeeMeasurementUnitId], [ChamberWaitTimeHour], [ChamberWaitTimeMinute], [ConsultingDurationInMinutes], [OtherExpense], [TransportExpense], [TravelTimeMinute]) VALUES (1, 2, 3, 3, N'2 hrs', CAST(1500.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), N'', CAST(N'2025-06-02T19:13:19.0566667' AS DateTime2), 7, CAST(N'2025-09-16T16:44:21.6258401' AS DateTime2), 8, NULL, 17, NULL, 50, 10, NULL, CAST(200.00 AS Decimal(18, 2)), CAST(130.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[SmartRx_PatientDoctor] OFF
GO
SET IDENTITY_INSERT [dbo].[SmartRx_PatientHistory] ON 
GO
INSERT [dbo].[SmartRx_PatientHistory] ([Id], [SmartRxMasterId], [PrescriptionId], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Title]) VALUES (13, 2, 3, N'Due to that had a stroke as per Pt was on medicine 2023', CAST(N'2025-06-02T22:19:11.6200000' AS DateTime2), 7, NULL, NULL, N'H/O COVID (2022)')
GO
INSERT [dbo].[SmartRx_PatientHistory] ([Id], [SmartRxMasterId], [PrescriptionId], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Title]) VALUES (14, 2, 3, N'', CAST(N'2025-06-02T22:19:11.6300000' AS DateTime2), 7, NULL, NULL, N'H/O Dengue (2024)')
GO
INSERT [dbo].[SmartRx_PatientHistory] ([Id], [SmartRxMasterId], [PrescriptionId], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Title]) VALUES (15, 2, 3, N'', CAST(N'2025-06-02T22:19:11.6333333' AS DateTime2), 7, NULL, NULL, N'Presence of hernia in right side of Aabdomen')
GO
INSERT [dbo].[SmartRx_PatientHistory] ([Id], [SmartRxMasterId], [PrescriptionId], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Title]) VALUES (16, 3, 3, N'Due to that had a stroke as per Pt was on medicine 2023', CAST(N'2025-06-02T22:19:11.6200000' AS DateTime2), 7, NULL, NULL, N'H/O COVID (2022)')
GO
INSERT [dbo].[SmartRx_PatientHistory] ([Id], [SmartRxMasterId], [PrescriptionId], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Title]) VALUES (17, 3, 3, N'', CAST(N'2025-06-02T22:19:11.6300000' AS DateTime2), 7, NULL, NULL, N'H/O Dengue (2024)')
GO
INSERT [dbo].[SmartRx_PatientHistory] ([Id], [SmartRxMasterId], [PrescriptionId], [Details], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [Title]) VALUES (18, 3, 3, N'', CAST(N'2025-06-02T22:19:11.6333333' AS DateTime2), 7, NULL, NULL, N'Presence of hernia in right side of Aabdomen')
GO
SET IDENTITY_INSERT [dbo].[SmartRx_PatientHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[SmartRx_PatientInvestigation] ON 
GO
INSERT [dbo].[SmartRx_PatientInvestigation] ([Id], [SmartRxMasterId], [PrescriptionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [DiscountByAuthority], [DiagnosticCenterWiseTestId], [IsCompleted], [Remarks], [Result], [TestDate], [TestPrice], [TestId], [UserSelectedTestCenterIds], [PriceUnitId], [Wishlist], [DoctorRecommendedTestCenterIds]) VALUES (11, 2, 3, CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), 2, CAST(N'2025-09-23T22:59:16.3173763' AS DateTime2), 8, CAST(5.00 AS Decimal(10, 2)), 3, 0, NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(500.00 AS Decimal(10, 2)), 1, N'50', 17, N'50,11', N'50,11')
GO
INSERT [dbo].[SmartRx_PatientInvestigation] ([Id], [SmartRxMasterId], [PrescriptionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [DiscountByAuthority], [DiagnosticCenterWiseTestId], [IsCompleted], [Remarks], [Result], [TestDate], [TestPrice], [TestId], [UserSelectedTestCenterIds], [PriceUnitId], [Wishlist], [DoctorRecommendedTestCenterIds]) VALUES (12, 2, 3, CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), 2, CAST(N'2025-09-23T22:59:16.3261199' AS DateTime2), 8, CAST(0.00 AS Decimal(10, 2)), 4, 0, NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(1000.00 AS Decimal(10, 2)), 10, N'50', 17, N'50,11', N'50')
GO
INSERT [dbo].[SmartRx_PatientInvestigation] ([Id], [SmartRxMasterId], [PrescriptionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [DiscountByAuthority], [DiagnosticCenterWiseTestId], [IsCompleted], [Remarks], [Result], [TestDate], [TestPrice], [TestId], [UserSelectedTestCenterIds], [PriceUnitId], [Wishlist], [DoctorRecommendedTestCenterIds]) VALUES (13, 2, 3, CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), 2, CAST(N'2025-08-08T22:44:37.2667410' AS DateTime2), 8, CAST(0.00 AS Decimal(10, 2)), 5, 0, NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(800.00 AS Decimal(10, 2)), 11, N'3', 17, N'50,11', N'50')
GO
INSERT [dbo].[SmartRx_PatientInvestigation] ([Id], [SmartRxMasterId], [PrescriptionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [DiscountByAuthority], [DiagnosticCenterWiseTestId], [IsCompleted], [Remarks], [Result], [TestDate], [TestPrice], [TestId], [UserSelectedTestCenterIds], [PriceUnitId], [Wishlist], [DoctorRecommendedTestCenterIds]) VALUES (14, 2, 3, CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), 2, CAST(N'2025-08-08T22:44:37.8330460' AS DateTime2), 8, CAST(0.00 AS Decimal(10, 2)), 6, 0, NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(200.00 AS Decimal(10, 2)), 12, N'14', 17, N'50,11', N'50')
GO
INSERT [dbo].[SmartRx_PatientInvestigation] ([Id], [SmartRxMasterId], [PrescriptionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [DiscountByAuthority], [DiagnosticCenterWiseTestId], [IsCompleted], [Remarks], [Result], [TestDate], [TestPrice], [TestId], [UserSelectedTestCenterIds], [PriceUnitId], [Wishlist], [DoctorRecommendedTestCenterIds]) VALUES (15, 2, 3, CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), 2, CAST(N'2025-08-08T22:44:37.8418458' AS DateTime2), 8, CAST(0.00 AS Decimal(10, 2)), NULL, 0, NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(0.00 AS Decimal(10, 2)), 13, N'3', 17, N'50,11', NULL)
GO
INSERT [dbo].[SmartRx_PatientInvestigation] ([Id], [SmartRxMasterId], [PrescriptionId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [DiscountByAuthority], [DiagnosticCenterWiseTestId], [IsCompleted], [Remarks], [Result], [TestDate], [TestPrice], [TestId], [UserSelectedTestCenterIds], [PriceUnitId], [Wishlist], [DoctorRecommendedTestCenterIds]) VALUES (16, 2, 3, CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), 2, CAST(N'2025-08-08T22:44:37.8515182' AS DateTime2), 8, CAST(0.00 AS Decimal(10, 2)), NULL, 0, NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(0.00 AS Decimal(10, 2)), 14, N'3', 17, N'50,11', NULL)
GO
SET IDENTITY_INSERT [dbo].[SmartRx_PatientInvestigation] OFF
GO
SET IDENTITY_INSERT [dbo].[SmartRx_PatientMedicine] ON 
GO
INSERT [dbo].[SmartRx_PatientMedicine] ([Id], [SmartRxMasterId], [PrescriptionId], [DurationOfContinuationCount], [Notes], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [MedicineId], [DescriptionForMoreThanRegularDose], [Dose10InADay], [Dose11InADay], [Dose12InADay], [Dose1InADay], [Dose2InADay], [Dose3InADay], [Dose4InADay], [Dose5InADay], [Dose6InADay], [Dose7InADay], [Dose8InADay], [Dose9InADay], [DurationOfContinuation], [DurationOfContinuationEndDate], [DurationOfContinuationStartDate], [FrequencyInADay], [IsBeforeMeal], [IsMoreThanRegularDose], [Restrictions], [Rules], [Wishlist]) VALUES (1, 2, 3, 30, N'Massage below eye regular', CAST(N'2025-06-15T17:16:31.3866667' AS DateTime2), 2, CAST(N'2025-07-24T08:20:29.6268482' AS DateTime2), 8, 9, NULL, CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)), CAST(2.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), N'1 Month', CAST(N'2025-06-17T17:16:31.3866667' AS DateTime2), CAST(N'2025-06-15T17:16:31.3866667' AS DateTime2), N'4', NULL, NULL, NULL, N'test', NULL)
GO
INSERT [dbo].[SmartRx_PatientMedicine] ([Id], [SmartRxMasterId], [PrescriptionId], [DurationOfContinuationCount], [Notes], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [MedicineId], [DescriptionForMoreThanRegularDose], [Dose10InADay], [Dose11InADay], [Dose12InADay], [Dose1InADay], [Dose2InADay], [Dose3InADay], [Dose4InADay], [Dose5InADay], [Dose6InADay], [Dose7InADay], [Dose8InADay], [Dose9InADay], [DurationOfContinuation], [DurationOfContinuationEndDate], [DurationOfContinuationStartDate], [FrequencyInADay], [IsBeforeMeal], [IsMoreThanRegularDose], [Restrictions], [Rules], [Wishlist]) VALUES (3, 2, 3, 30, N'Massage below eye regular', CAST(N'2025-06-15T17:18:01.4566667' AS DateTime2), 2, CAST(N'2025-07-24T08:20:29.7005914' AS DateTime2), 8, 10, NULL, CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), N'Continue', CAST(N'2025-06-17T17:18:01.4566667' AS DateTime2), CAST(N'2025-06-15T17:18:01.4566667' AS DateTime2), N'2', NULL, NULL, NULL, N'test', NULL)
GO
INSERT [dbo].[SmartRx_PatientMedicine] ([Id], [SmartRxMasterId], [PrescriptionId], [DurationOfContinuationCount], [Notes], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [MedicineId], [DescriptionForMoreThanRegularDose], [Dose10InADay], [Dose11InADay], [Dose12InADay], [Dose1InADay], [Dose2InADay], [Dose3InADay], [Dose4InADay], [Dose5InADay], [Dose6InADay], [Dose7InADay], [Dose8InADay], [Dose9InADay], [DurationOfContinuation], [DurationOfContinuationEndDate], [DurationOfContinuationStartDate], [FrequencyInADay], [IsBeforeMeal], [IsMoreThanRegularDose], [Restrictions], [Rules], [Wishlist]) VALUES (5, 2, 3, 30, N'', CAST(N'2025-06-15T00:00:00.0000000' AS DateTime2), 2, CAST(N'2025-09-09T09:46:48.5030487' AS DateTime2), 8, 16, NULL, CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), N'3 Months', CAST(N'2025-09-22T00:00:00.0000000' AS DateTime2), CAST(N'2025-06-23T00:00:00.0000000' AS DateTime2), N'2', NULL, NULL, NULL, NULL, N'')
GO
INSERT [dbo].[SmartRx_PatientMedicine] ([Id], [SmartRxMasterId], [PrescriptionId], [DurationOfContinuationCount], [Notes], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [MedicineId], [DescriptionForMoreThanRegularDose], [Dose10InADay], [Dose11InADay], [Dose12InADay], [Dose1InADay], [Dose2InADay], [Dose3InADay], [Dose4InADay], [Dose5InADay], [Dose6InADay], [Dose7InADay], [Dose8InADay], [Dose9InADay], [DurationOfContinuation], [DurationOfContinuationEndDate], [DurationOfContinuationStartDate], [FrequencyInADay], [IsBeforeMeal], [IsMoreThanRegularDose], [Restrictions], [Rules], [Wishlist]) VALUES (7, 2, 3, 30, NULL, CAST(N'2025-06-23T00:00:00.0000000' AS DateTime2), 2, CAST(N'2025-07-24T08:20:29.7610018' AS DateTime2), 8, 18, NULL, CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), N'2 Months', CAST(N'2025-07-23T00:00:00.0000000' AS DateTime2), CAST(N'2025-06-23T00:00:00.0000000' AS DateTime2), N'3', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SmartRx_PatientMedicine] ([Id], [SmartRxMasterId], [PrescriptionId], [DurationOfContinuationCount], [Notes], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [MedicineId], [DescriptionForMoreThanRegularDose], [Dose10InADay], [Dose11InADay], [Dose12InADay], [Dose1InADay], [Dose2InADay], [Dose3InADay], [Dose4InADay], [Dose5InADay], [Dose6InADay], [Dose7InADay], [Dose8InADay], [Dose9InADay], [DurationOfContinuation], [DurationOfContinuationEndDate], [DurationOfContinuationStartDate], [FrequencyInADay], [IsBeforeMeal], [IsMoreThanRegularDose], [Restrictions], [Rules], [Wishlist]) VALUES (8, 2, 3, 30, NULL, CAST(N'2025-06-23T00:00:00.0000000' AS DateTime2), 2, CAST(N'2025-07-24T08:20:29.7946371' AS DateTime2), 8, 20, NULL, CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), N'1 Month', CAST(N'2025-07-22T00:00:00.0000000' AS DateTime2), CAST(N'2025-06-23T00:00:00.0000000' AS DateTime2), N'1', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SmartRx_PatientMedicine] ([Id], [SmartRxMasterId], [PrescriptionId], [DurationOfContinuationCount], [Notes], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [MedicineId], [DescriptionForMoreThanRegularDose], [Dose10InADay], [Dose11InADay], [Dose12InADay], [Dose1InADay], [Dose2InADay], [Dose3InADay], [Dose4InADay], [Dose5InADay], [Dose6InADay], [Dose7InADay], [Dose8InADay], [Dose9InADay], [DurationOfContinuation], [DurationOfContinuationEndDate], [DurationOfContinuationStartDate], [FrequencyInADay], [IsBeforeMeal], [IsMoreThanRegularDose], [Restrictions], [Rules], [Wishlist]) VALUES (9, 2, 3, 30, NULL, CAST(N'2025-06-23T00:00:00.0000000' AS DateTime2), 2, CAST(N'2025-08-08T16:30:55.1239657' AS DateTime2), 8, 21, NULL, CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), N'2 Weeks', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'2025-06-23T00:00:00.0000000' AS DateTime2), N'5', NULL, NULL, NULL, NULL, N'16,20')
GO
SET IDENTITY_INSERT [dbo].[SmartRx_PatientMedicine] OFF
GO
SET IDENTITY_INSERT [dbo].[SmartRx_PatientOtherExpense] ON 
GO
INSERT [dbo].[SmartRx_PatientOtherExpense] ([Id], [SmartRxMasterId], [PrescriptionId], [ExpenseName], [Description], [Amount], [CurrencyUnitId], [ExpenseDate], [ExpenseNotes], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (2, 2, 3, N'Test expense', NULL, CAST(500.00 AS Decimal(10, 2)), 17, CAST(N'2025-09-15T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2025-09-15T13:59:08.2282569' AS DateTime2), 8, NULL, NULL)
GO
INSERT [dbo].[SmartRx_PatientOtherExpense] ([Id], [SmartRxMasterId], [PrescriptionId], [ExpenseName], [Description], [Amount], [CurrencyUnitId], [ExpenseDate], [ExpenseNotes], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (3, 2, 3, N'Other Test expense checking', NULL, CAST(500.00 AS Decimal(10, 2)), 17, CAST(N'2025-09-15T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2025-09-15T16:48:53.1502119' AS DateTime2), 8, CAST(N'2025-09-15T16:49:13.1547052' AS DateTime2), 8)
GO
SET IDENTITY_INSERT [dbo].[SmartRx_PatientOtherExpense] OFF
GO
SET IDENTITY_INSERT [dbo].[SmartRx_PatientProfile] ON 
GO
INSERT [dbo].[SmartRx_PatientProfile] ([Id], [PatientCode], [FirstName], [LastName], [NickName], [Age], [DateOfBirth], [Gender], [BloodGroup], [Height], [PhoneNumber], [Email], [ProfilePhotoName], [ProfilePhotoPath], [Address], [PoliceStationId], [CityId], [ExistingPatientId], [PostalCode], [EmergencyContact], [MaritalStatus], [IsActive], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [IsExistingPatient], [IsRelative], [Profession], [RelationToPatient], [RelatedToPatientId], [HeightFeet], [HeightInches], [HeightMeasurementUnitId], [Weight], [WeightMeasurementUnitId], [ProfileProgress], [AgeMonth], [AgeYear], [UserId]) VALUES (1, N'P000000001', N'John ABC', N'Doe', N'Johnny', CAST(36.00 AS Decimal(18, 2)), CAST(N'1988-11-13T12:00:00.0000000' AS DateTime2), 1, 3, N'5ft 5in', N'01784567702', N'john.doe@example.com', N'PatientProfilePhoto_0000000001_thumbnail.jpg', N'photos\PatientProfilePhoto_0000000001_thumbnail.jpg', N'Dhaka, BD', 5, 2, 2, N'1234', N'01987654320', 1, 1, CAST(N'2025-06-02T18:04:28.3166667' AS DateTime2), 2, CAST(N'2025-09-23T22:18:56.6499045' AS DateTime2), 8, 0, 0, N'Jr. Engineer Level 1', NULL, NULL, 5, CAST(5.00 AS Decimal(18, 2)), 21, CAST(80.00 AS Decimal(18, 2)), 7, 100, 5, 49, 8)
GO
INSERT [dbo].[SmartRx_PatientProfile] ([Id], [PatientCode], [FirstName], [LastName], [NickName], [Age], [DateOfBirth], [Gender], [BloodGroup], [Height], [PhoneNumber], [Email], [ProfilePhotoName], [ProfilePhotoPath], [Address], [PoliceStationId], [CityId], [ExistingPatientId], [PostalCode], [EmergencyContact], [MaritalStatus], [IsActive], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [IsExistingPatient], [IsRelative], [Profession], [RelationToPatient], [RelatedToPatientId], [HeightFeet], [HeightInches], [HeightMeasurementUnitId], [Weight], [WeightMeasurementUnitId], [ProfileProgress], [AgeMonth], [AgeYear], [UserId]) VALUES (2, N'P000000002', N'Shahriar', N'Kabir', N'', CAST(20.00 AS Decimal(18, 2)), CAST(N'2005-06-02T18:05:30.9633333' AS DateTime2), 1, 3, N'144cm', N'01996806687', N'shahanazdev19@gmail.com', N'Paira.jpg', N'photos\Paira.jpg', N'Dhaka, BD', 11, 1, 37, N'1215', NULL, 1, 1, CAST(N'2025-06-02T18:05:30.9633333' AS DateTime2), 2, CAST(N'2025-08-26T22:01:27.9452417' AS DateTime2), 8, 0, 1, NULL, N'Brother', 1, NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, 0, NULL, NULL, 8)
GO
INSERT [dbo].[SmartRx_PatientProfile] ([Id], [PatientCode], [FirstName], [LastName], [NickName], [Age], [DateOfBirth], [Gender], [BloodGroup], [Height], [PhoneNumber], [Email], [ProfilePhotoName], [ProfilePhotoPath], [Address], [PoliceStationId], [CityId], [ExistingPatientId], [PostalCode], [EmergencyContact], [MaritalStatus], [IsActive], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [IsExistingPatient], [IsRelative], [Profession], [RelationToPatient], [RelatedToPatientId], [HeightFeet], [HeightInches], [HeightMeasurementUnitId], [Weight], [WeightMeasurementUnitId], [ProfileProgress], [AgeMonth], [AgeYear], [UserId]) VALUES (3, N'P000000003', N'Shahanaz', N'Sultana', NULL, CAST(30.00 AS Decimal(18, 2)), CAST(N'1995-08-21T00:00:00.0000000' AS DateTime2), 2, 4, N'5ft 2in', N'01996806686', N'sha@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1, CAST(N'2025-08-20T00:00:00.0000000' AS DateTime2), 2, CAST(N'2025-08-26T22:01:27.9452427' AS DateTime2), 8, 0, 1, NULL, N'Sister', 1, NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, 0, NULL, NULL, 8)
GO
INSERT [dbo].[SmartRx_PatientProfile] ([Id], [PatientCode], [FirstName], [LastName], [NickName], [Age], [DateOfBirth], [Gender], [BloodGroup], [Height], [PhoneNumber], [Email], [ProfilePhotoName], [ProfilePhotoPath], [Address], [PoliceStationId], [CityId], [ExistingPatientId], [PostalCode], [EmergencyContact], [MaritalStatus], [IsActive], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [IsExistingPatient], [IsRelative], [Profession], [RelationToPatient], [RelatedToPatientId], [HeightFeet], [HeightInches], [HeightMeasurementUnitId], [Weight], [WeightMeasurementUnitId], [ProfileProgress], [AgeMonth], [AgeYear], [UserId]) VALUES (4, N'P000000004', N'null', N'null', NULL, CAST(25.00 AS Decimal(18, 2)), CAST(N'2025-10-05T17:29:23.8416383' AS DateTime2), 1, NULL, N'5 ft 5 in', N'', N'', NULL, NULL, N'', NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2025-10-05T17:29:23.8446344' AS DateTime2), 8, NULL, NULL, 0, 0, NULL, NULL, NULL, 5, CAST(5.00 AS Decimal(18, 2)), 21, CAST(80.00 AS Decimal(18, 2)), 7, 0, 8, 2000, 8)
GO
INSERT [dbo].[SmartRx_PatientProfile] ([Id], [PatientCode], [FirstName], [LastName], [NickName], [Age], [DateOfBirth], [Gender], [BloodGroup], [Height], [PhoneNumber], [Email], [ProfilePhotoName], [ProfilePhotoPath], [Address], [PoliceStationId], [CityId], [ExistingPatientId], [PostalCode], [EmergencyContact], [MaritalStatus], [IsActive], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [IsExistingPatient], [IsRelative], [Profession], [RelationToPatient], [RelatedToPatientId], [HeightFeet], [HeightInches], [HeightMeasurementUnitId], [Weight], [WeightMeasurementUnitId], [ProfileProgress], [AgeMonth], [AgeYear], [UserId]) VALUES (5, N'P000000005', N'null', N'null', NULL, CAST(25.00 AS Decimal(18, 2)), CAST(N'2025-10-05T17:30:45.2338741' AS DateTime2), 1, NULL, N'5 ft 5 in', N'', N'', NULL, NULL, N'', NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2025-10-05T17:30:45.6417775' AS DateTime2), 8, NULL, NULL, 0, 0, NULL, NULL, NULL, 5, CAST(5.00 AS Decimal(18, 2)), 21, CAST(80.00 AS Decimal(18, 2)), 7, 0, 8, 2000, 8)
GO
SET IDENTITY_INSERT [dbo].[SmartRx_PatientProfile] OFF
GO
SET IDENTITY_INSERT [dbo].[SmartRx_PatientRelatives] ON 
GO
INSERT [dbo].[SmartRx_PatientRelatives] ([Id], [PatientId], [PatientRelativeId], [SmartRx_MasterId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (1, 1, 2, 2, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[SmartRx_PatientRelatives] OFF
GO
SET IDENTITY_INSERT [dbo].[Smartrx_PatientReward] ON 
GO
INSERT [dbo].[Smartrx_PatientReward] ([Id], [SmartRxMasterId], [PrescriptionId], [PatientId], [BadgeId], [EarnedNonCashablePoints], [ConsumedNonCashablePoints], [TotalNonCashablePoints], [EarnedCashablePoints], [ConsumedCashablePoints], [TotalCashablePoints], [EarnedMoney], [ConsumedMoney], [TotalMoney], [EncashMoney], [Remarks], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (1, NULL, NULL, 1, 7, CAST(700.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(700.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'test', CAST(N'2025-10-13T06:41:15.4005963' AS DateTime2), 8, CAST(N'2025-10-13T07:03:44.0144823' AS DateTime2), 8)
GO
INSERT [dbo].[Smartrx_PatientReward] ([Id], [SmartRxMasterId], [PrescriptionId], [PatientId], [BadgeId], [EarnedNonCashablePoints], [ConsumedNonCashablePoints], [TotalNonCashablePoints], [EarnedCashablePoints], [ConsumedCashablePoints], [TotalCashablePoints], [EarnedMoney], [ConsumedMoney], [TotalMoney], [EncashMoney], [Remarks], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (2, NULL, NULL, 1, 6, CAST(600.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(600.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'test', CAST(N'2025-10-13T06:45:18.5268750' AS DateTime2), 8, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Smartrx_PatientReward] OFF
GO
SET IDENTITY_INSERT [dbo].[SmartRx_PatientVitals] ON 
GO
INSERT [dbo].[SmartRx_PatientVitals] ([Id], [SmartRxMasterId], [PrescriptionId], [VitalId], [VitalValue], [VitalStatus], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PatientId], [HeightFeet], [HeightInches]) VALUES (1, 2, 3, 65, CAST(150.00 AS Decimal(5, 2)), N'', CAST(N'2025-07-29T20:16:18.9673011' AS DateTime2), 8, CAST(N'2025-08-13T16:06:41.0986787' AS DateTime2), 8, 1, NULL, NULL)
GO
INSERT [dbo].[SmartRx_PatientVitals] ([Id], [SmartRxMasterId], [PrescriptionId], [VitalId], [VitalValue], [VitalStatus], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PatientId], [HeightFeet], [HeightInches]) VALUES (2, 2, 3, 64, CAST(100.00 AS Decimal(5, 2)), N'', CAST(N'2025-07-29T20:16:19.0017895' AS DateTime2), 8, CAST(N'2025-08-13T16:06:40.9564249' AS DateTime2), 8, 1, NULL, NULL)
GO
INSERT [dbo].[SmartRx_PatientVitals] ([Id], [SmartRxMasterId], [PrescriptionId], [VitalId], [VitalValue], [VitalStatus], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PatientId], [HeightFeet], [HeightInches]) VALUES (3, 2, 3, 68, CAST(25.00 AS Decimal(5, 2)), N'', CAST(N'2025-07-29T20:22:15.2034918' AS DateTime2), 8, CAST(N'2025-07-29T23:17:01.3815738' AS DateTime2), 8, 1, NULL, NULL)
GO
INSERT [dbo].[SmartRx_PatientVitals] ([Id], [SmartRxMasterId], [PrescriptionId], [VitalId], [VitalValue], [VitalStatus], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PatientId], [HeightFeet], [HeightInches]) VALUES (4, 2, 3, 86, CAST(5.90 AS Decimal(5, 2)), N'', CAST(N'2025-07-29T21:58:05.9844214' AS DateTime2), 8, CAST(N'2025-08-24T17:14:05.0083081' AS DateTime2), 8, 1, 5, CAST(9.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[SmartRx_PatientVitals] ([Id], [SmartRxMasterId], [PrescriptionId], [VitalId], [VitalValue], [VitalStatus], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PatientId], [HeightFeet], [HeightInches]) VALUES (5, 2, 3, 75, CAST(58.00 AS Decimal(5, 2)), N'', CAST(N'2025-07-29T21:58:26.6910201' AS DateTime2), 8, CAST(N'2025-08-24T17:14:05.0083254' AS DateTime2), 8, 1, NULL, NULL)
GO
INSERT [dbo].[SmartRx_PatientVitals] ([Id], [SmartRxMasterId], [PrescriptionId], [VitalId], [VitalValue], [VitalStatus], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PatientId], [HeightFeet], [HeightInches]) VALUES (6, 2, 3, 74, CAST(20.00 AS Decimal(5, 2)), NULL, CAST(N'2025-07-29T00:00:00.0000000' AS DateTime2), 8, NULL, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[SmartRx_PatientVitals] ([Id], [SmartRxMasterId], [PrescriptionId], [VitalId], [VitalValue], [VitalStatus], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PatientId], [HeightFeet], [HeightInches]) VALUES (7, 2, 3, 66, CAST(99.00 AS Decimal(5, 2)), N'', CAST(N'2025-08-07T19:54:29.1138755' AS DateTime2), 8, CAST(N'2025-08-11T20:33:42.4844079' AS DateTime2), 8, 1, NULL, NULL)
GO
INSERT [dbo].[SmartRx_PatientVitals] ([Id], [SmartRxMasterId], [PrescriptionId], [VitalId], [VitalValue], [VitalStatus], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PatientId], [HeightFeet], [HeightInches]) VALUES (10, 2, 3, 78, CAST(90.00 AS Decimal(5, 2)), N'', CAST(N'2025-08-10T20:13:39.2507736' AS DateTime2), 8, CAST(N'2025-08-12T13:43:08.5669486' AS DateTime2), 8, 1, NULL, NULL)
GO
INSERT [dbo].[SmartRx_PatientVitals] ([Id], [SmartRxMasterId], [PrescriptionId], [VitalId], [VitalValue], [VitalStatus], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PatientId], [HeightFeet], [HeightInches]) VALUES (11, 2, 3, 65, CAST(130.00 AS Decimal(5, 2)), N'', CAST(N'2025-08-25T20:16:19.0017895' AS DateTime2), 8, CAST(N'2025-08-13T16:06:41.0986787' AS DateTime2), 8, 1, NULL, NULL)
GO
INSERT [dbo].[SmartRx_PatientVitals] ([Id], [SmartRxMasterId], [PrescriptionId], [VitalId], [VitalValue], [VitalStatus], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PatientId], [HeightFeet], [HeightInches]) VALUES (12, 2, 3, 64, CAST(80.00 AS Decimal(5, 2)), N'', CAST(N'2025-08-25T20:16:19.0017895' AS DateTime2), 8, CAST(N'2025-08-13T16:06:40.9564249' AS DateTime2), 8, 1, NULL, NULL)
GO
INSERT [dbo].[SmartRx_PatientVitals] ([Id], [SmartRxMasterId], [PrescriptionId], [VitalId], [VitalValue], [VitalStatus], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PatientId], [HeightFeet], [HeightInches]) VALUES (13, 2, 3, 68, CAST(48.00 AS Decimal(5, 2)), N'', CAST(N'2025-08-25T20:16:19.0017895' AS DateTime2), 8, CAST(N'2025-07-29T23:17:01.3815738' AS DateTime2), 8, 1, NULL, NULL)
GO
INSERT [dbo].[SmartRx_PatientVitals] ([Id], [SmartRxMasterId], [PrescriptionId], [VitalId], [VitalValue], [VitalStatus], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PatientId], [HeightFeet], [HeightInches]) VALUES (14, 2, 3, 86, CAST(6.00 AS Decimal(5, 2)), N'', CAST(N'2025-08-25T20:16:19.0017895' AS DateTime2), 8, CAST(N'2025-08-24T17:14:05.0083081' AS DateTime2), 8, 1, 5, CAST(9.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[SmartRx_PatientVitals] ([Id], [SmartRxMasterId], [PrescriptionId], [VitalId], [VitalValue], [VitalStatus], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PatientId], [HeightFeet], [HeightInches]) VALUES (15, 2, 3, 75, CAST(78.00 AS Decimal(5, 2)), N'', CAST(N'2025-07-29T21:58:26.6910201' AS DateTime2), 8, CAST(N'2025-08-24T17:14:05.0083254' AS DateTime2), 8, 1, NULL, NULL)
GO
INSERT [dbo].[SmartRx_PatientVitals] ([Id], [SmartRxMasterId], [PrescriptionId], [VitalId], [VitalValue], [VitalStatus], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PatientId], [HeightFeet], [HeightInches]) VALUES (16, 2, 3, 69, CAST(16.00 AS Decimal(5, 2)), N'', CAST(N'2025-10-12T11:12:54.2687396' AS DateTime2), 8, NULL, NULL, 0, NULL, NULL)
GO
INSERT [dbo].[SmartRx_PatientVitals] ([Id], [SmartRxMasterId], [PrescriptionId], [VitalId], [VitalValue], [VitalStatus], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById], [PatientId], [HeightFeet], [HeightInches]) VALUES (17, 2, 3, 67, CAST(100.00 AS Decimal(5, 2)), N'', CAST(N'2025-10-12T11:18:42.1502412' AS DateTime2), 8, NULL, NULL, 0, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[SmartRx_PatientVitals] OFF
GO
SET IDENTITY_INSERT [dbo].[SmartRx_PatientWishlist] ON 
GO
INSERT [dbo].[SmartRx_PatientWishlist] ([Id], [SmartRxMasterId], [PrescriptionId], [WishListType], [PatientMedicineId], [PatientTestId], [PatientWishlistMedicineId], [PatientRecommendedTestCenterId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (1, 2, 3, N'Lab', NULL, 1, NULL, 17, CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[SmartRx_PatientWishlist] ([Id], [SmartRxMasterId], [PrescriptionId], [WishListType], [PatientMedicineId], [PatientTestId], [PatientWishlistMedicineId], [PatientRecommendedTestCenterId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (2, 2, 3, N'Lab', NULL, 10, NULL, 17, CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[SmartRx_PatientWishlist] ([Id], [SmartRxMasterId], [PrescriptionId], [WishListType], [PatientMedicineId], [PatientTestId], [PatientWishlistMedicineId], [PatientRecommendedTestCenterId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (3, 2, 3, N'Lab', NULL, 11, NULL, 17, CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[SmartRx_PatientWishlist] ([Id], [SmartRxMasterId], [PrescriptionId], [WishListType], [PatientMedicineId], [PatientTestId], [PatientWishlistMedicineId], [PatientRecommendedTestCenterId], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById]) VALUES (4, 2, 3, N'Lab', NULL, 12, NULL, 11, CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), 2, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[SmartRx_PatientWishlist] OFF
GO
/****** Object:  Index [IX_Configuration_AdviceFAQ_CreatedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_AdviceFAQ_CreatedById] ON [dbo].[Configuration_AdviceFAQ]
(
	[CreatedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_AdviceFAQ_ModifiedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_AdviceFAQ_ModifiedById] ON [dbo].[Configuration_AdviceFAQ]
(
	[ModifiedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_ChiefComplaint_CreatedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_ChiefComplaint_CreatedById] ON [dbo].[Configuration_ChiefComplaint]
(
	[CreatedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_ChiefComplaint_ModifiedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_ChiefComplaint_ModifiedById] ON [dbo].[Configuration_ChiefComplaint]
(
	[ModifiedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_City_CountryId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_City_CountryId] ON [dbo].[Configuration_City]
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_City_CreatedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_City_CreatedById] ON [dbo].[Configuration_City]
(
	[CreatedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_City_DistrictId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_City_DistrictId] ON [dbo].[Configuration_City]
(
	[DistrictId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_City_ModifiedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_City_ModifiedById] ON [dbo].[Configuration_City]
(
	[ModifiedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_Country_CreatedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_Country_CreatedById] ON [dbo].[Configuration_Country]
(
	[CreatedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_Country_ModifiedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_Country_ModifiedById] ON [dbo].[Configuration_Country]
(
	[ModifiedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_Department_CreatedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_Department_CreatedById] ON [dbo].[Configuration_Department]
(
	[CreatedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_Department_HospitalId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_Department_HospitalId] ON [dbo].[Configuration_Department]
(
	[HospitalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_Department_ModifiedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_Department_ModifiedById] ON [dbo].[Configuration_Department]
(
	[ModifiedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_Department_SectionId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_Department_SectionId] ON [dbo].[Configuration_Department]
(
	[SectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_DepartmentSection_CreatedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_DepartmentSection_CreatedById] ON [dbo].[Configuration_DepartmentSection]
(
	[CreatedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_DepartmentSection_HospitalId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_DepartmentSection_HospitalId] ON [dbo].[Configuration_DepartmentSection]
(
	[HospitalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_DepartmentSection_ModifiedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_DepartmentSection_ModifiedById] ON [dbo].[Configuration_DepartmentSection]
(
	[ModifiedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_Designation_CreatedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_Designation_CreatedById] ON [dbo].[Configuration_Designation]
(
	[CreatedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_Designation_ModifiedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_Designation_ModifiedById] ON [dbo].[Configuration_Designation]
(
	[ModifiedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_DiagnosisCenterWiseTest_CreatedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_DiagnosisCenterWiseTest_CreatedById] ON [dbo].[Configuration_DiagnosisCenterWiseTest]
(
	[CreatedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_DiagnosisCenterWiseTest_ModifiedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_DiagnosisCenterWiseTest_ModifiedById] ON [dbo].[Configuration_DiagnosisCenterWiseTest]
(
	[ModifiedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_DiagnosisCenterWiseTest_PriceUnitId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_DiagnosisCenterWiseTest_PriceUnitId] ON [dbo].[Configuration_DiagnosisCenterWiseTest]
(
	[PriceUnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_DiagnosisCenterWiseTest_TestCenterId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_DiagnosisCenterWiseTest_TestCenterId] ON [dbo].[Configuration_DiagnosisCenterWiseTest]
(
	[TestCenterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_DiagnosisCenterWiseTest_TestId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_DiagnosisCenterWiseTest_TestId] ON [dbo].[Configuration_DiagnosisCenterWiseTest]
(
	[TestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_District_CreatedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_District_CreatedById] ON [dbo].[Configuration_District]
(
	[CreatedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_District_ModifiedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_District_ModifiedById] ON [dbo].[Configuration_District]
(
	[ModifiedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_Doctor_CreatedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_Doctor_CreatedById] ON [dbo].[Configuration_Doctor]
(
	[CreatedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_Doctor_ModifiedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_Doctor_ModifiedById] ON [dbo].[Configuration_Doctor]
(
	[ModifiedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_DoctorChamber_CityId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_DoctorChamber_CityId] ON [dbo].[Configuration_DoctorChamber]
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_DoctorChamber_CreatedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_DoctorChamber_CreatedById] ON [dbo].[Configuration_DoctorChamber]
(
	[CreatedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_DoctorChamber_DepartmentId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_DoctorChamber_DepartmentId] ON [dbo].[Configuration_DoctorChamber]
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_DoctorChamber_DepartmentSectionId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_DoctorChamber_DepartmentSectionId] ON [dbo].[Configuration_DoctorChamber]
(
	[DepartmentSectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_DoctorChamber_DoctorDesignationInChamberId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_DoctorChamber_DoctorDesignationInChamberId] ON [dbo].[Configuration_DoctorChamber]
(
	[DoctorDesignationInChamberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_DoctorChamber_DoctorId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_DoctorChamber_DoctorId] ON [dbo].[Configuration_DoctorChamber]
(
	[DoctorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_DoctorChamber_HospitalId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_DoctorChamber_HospitalId] ON [dbo].[Configuration_DoctorChamber]
(
	[HospitalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_DoctorChamber_ModifiedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_DoctorChamber_ModifiedById] ON [dbo].[Configuration_DoctorChamber]
(
	[ModifiedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_Education_CreatedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_Education_CreatedById] ON [dbo].[Configuration_Education]
(
	[CreatedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_Education_ModifiedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_Education_ModifiedById] ON [dbo].[Configuration_Education]
(
	[ModifiedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_Hospital_CityId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_Hospital_CityId] ON [dbo].[Configuration_Hospital]
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_Hospital_CreatedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_Hospital_CreatedById] ON [dbo].[Configuration_Hospital]
(
	[CreatedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_Hospital_ModifiedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_Hospital_ModifiedById] ON [dbo].[Configuration_Hospital]
(
	[ModifiedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_Investigation_CreatedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_Investigation_CreatedById] ON [dbo].[Configuration_Investigation]
(
	[CreatedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_Investigation_ModifiedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_Investigation_ModifiedById] ON [dbo].[Configuration_Investigation]
(
	[ModifiedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_Investigation_NationalPriceUnitId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_Investigation_NationalPriceUnitId] ON [dbo].[Configuration_Investigation]
(
	[NationalPriceUnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_Investigation_PriceUnitId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_Investigation_PriceUnitId] ON [dbo].[Configuration_Investigation]
(
	[PriceUnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_InvestigationFAQ_CreatedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_InvestigationFAQ_CreatedById] ON [dbo].[Configuration_InvestigationFAQ]
(
	[CreatedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_InvestigationFAQ_ModifiedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_InvestigationFAQ_ModifiedById] ON [dbo].[Configuration_InvestigationFAQ]
(
	[ModifiedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_Medicine_BrandId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_Medicine_BrandId] ON [dbo].[Configuration_Medicine]
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_Medicine_CreatedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_Medicine_CreatedById] ON [dbo].[Configuration_Medicine]
(
	[CreatedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_Medicine_DosageFormId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_Medicine_DosageFormId] ON [dbo].[Configuration_Medicine]
(
	[DosageFormId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_Medicine_GenericId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_Medicine_GenericId] ON [dbo].[Configuration_Medicine]
(
	[GenericId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_Medicine_MeasurementUnitId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_Medicine_MeasurementUnitId] ON [dbo].[Configuration_Medicine]
(
	[MeasurementUnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_Medicine_ModifiedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_Medicine_ModifiedById] ON [dbo].[Configuration_Medicine]
(
	[ModifiedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_Medicine_PriceInUnitId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_Medicine_PriceInUnitId] ON [dbo].[Configuration_Medicine]
(
	[PriceInUnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_MedicineBrand_CreatedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_MedicineBrand_CreatedById] ON [dbo].[Configuration_MedicineBrand]
(
	[CreatedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_MedicineBrand_ManufacturerId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_MedicineBrand_ManufacturerId] ON [dbo].[Configuration_MedicineBrand]
(
	[ManufacturerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_MedicineBrand_ModifiedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_MedicineBrand_ModifiedById] ON [dbo].[Configuration_MedicineBrand]
(
	[ModifiedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_MedicineDosageForm_CreatedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_MedicineDosageForm_CreatedById] ON [dbo].[Configuration_MedicineDosageForm]
(
	[CreatedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_MedicineDosageForm_ModifiedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_MedicineDosageForm_ModifiedById] ON [dbo].[Configuration_MedicineDosageForm]
(
	[ModifiedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_MedicineFAQ_CreatedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_MedicineFAQ_CreatedById] ON [dbo].[Configuration_MedicineFAQ]
(
	[CreatedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_MedicineFAQ_ModifiedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_MedicineFAQ_ModifiedById] ON [dbo].[Configuration_MedicineFAQ]
(
	[ModifiedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_MedicineGeneric_CreatedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_MedicineGeneric_CreatedById] ON [dbo].[Configuration_MedicineGeneric]
(
	[CreatedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_MedicineGeneric_ModifiedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_MedicineGeneric_ModifiedById] ON [dbo].[Configuration_MedicineGeneric]
(
	[ModifiedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_MedicineManufactureInfo_CreatedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_MedicineManufactureInfo_CreatedById] ON [dbo].[Configuration_MedicineManufactureInfo]
(
	[CreatedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_MedicineManufactureInfo_ModifiedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_MedicineManufactureInfo_ModifiedById] ON [dbo].[Configuration_MedicineManufactureInfo]
(
	[ModifiedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_PoliceStation_CityId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_PoliceStation_CityId] ON [dbo].[Configuration_PoliceStation]
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_PoliceStation_CountryId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_PoliceStation_CountryId] ON [dbo].[Configuration_PoliceStation]
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_PoliceStation_CreatedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_PoliceStation_CreatedById] ON [dbo].[Configuration_PoliceStation]
(
	[CreatedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_PoliceStation_DistrictId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_PoliceStation_DistrictId] ON [dbo].[Configuration_PoliceStation]
(
	[DistrictId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_PoliceStation_ModifiedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_PoliceStation_ModifiedById] ON [dbo].[Configuration_PoliceStation]
(
	[ModifiedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_PrescriptionSection_CreatedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_PrescriptionSection_CreatedById] ON [dbo].[Configuration_PrescriptionSection]
(
	[CreatedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_PrescriptionSection_ModifiedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_PrescriptionSection_ModifiedById] ON [dbo].[Configuration_PrescriptionSection]
(
	[ModifiedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_Reward_CreatedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_Reward_CreatedById] ON [dbo].[Configuration_Reward]
(
	[CreatedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_Reward_ModifiedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_Reward_ModifiedById] ON [dbo].[Configuration_Reward]
(
	[ModifiedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_RewardBadge_CreatedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_RewardBadge_CreatedById] ON [dbo].[Configuration_RewardBadge]
(
	[CreatedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_RewardBadge_ModifiedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_RewardBadge_ModifiedById] ON [dbo].[Configuration_RewardBadge]
(
	[ModifiedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_SmartRxAcronym_CreatedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_SmartRxAcronym_CreatedById] ON [dbo].[Configuration_SmartRxAcronym]
(
	[CreatedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_SmartRxAcronym_ModifiedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_SmartRxAcronym_ModifiedById] ON [dbo].[Configuration_SmartRxAcronym]
(
	[ModifiedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_Unit_CreatedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_Unit_CreatedById] ON [dbo].[Configuration_Unit]
(
	[CreatedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_Unit_ModifiedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_Unit_ModifiedById] ON [dbo].[Configuration_Unit]
(
	[ModifiedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_Vital_CreatedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_Vital_CreatedById] ON [dbo].[Configuration_Vital]
(
	[CreatedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_Vital_ModifiedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_Vital_ModifiedById] ON [dbo].[Configuration_Vital]
(
	[ModifiedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_Vital_UnitId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_Vital_UnitId] ON [dbo].[Configuration_Vital]
(
	[UnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_VitalFAQ_CreatedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_VitalFAQ_CreatedById] ON [dbo].[Configuration_VitalFAQ]
(
	[CreatedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Configuration_VitalFAQ_ModifiedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Configuration_VitalFAQ_ModifiedById] ON [dbo].[Configuration_VitalFAQ]
(
	[ModifiedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Prescription_Upload_ApprovedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Prescription_Upload_ApprovedById] ON [dbo].[Prescription_Upload]
(
	[ApprovedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Prescription_Upload_CompletedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Prescription_Upload_CompletedById] ON [dbo].[Prescription_Upload]
(
	[CompletedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Prescription_Upload_CreatedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Prescription_Upload_CreatedById] ON [dbo].[Prescription_Upload]
(
	[CreatedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Prescription_Upload_FolderId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Prescription_Upload_FolderId] ON [dbo].[Prescription_Upload]
(
	[FolderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Prescription_Upload_LockedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Prescription_Upload_LockedById] ON [dbo].[Prescription_Upload]
(
	[LockedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Prescription_Upload_ModifiedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Prescription_Upload_ModifiedById] ON [dbo].[Prescription_Upload]
(
	[ModifiedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Prescription_Upload_PatientId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Prescription_Upload_PatientId] ON [dbo].[Prescription_Upload]
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Prescription_Upload_RecommendedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Prescription_Upload_RecommendedById] ON [dbo].[Prescription_Upload]
(
	[RecommendedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Prescription_Upload_ReportById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Prescription_Upload_ReportById] ON [dbo].[Prescription_Upload]
(
	[ReportById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Prescription_Upload_SmartRxId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Prescription_Upload_SmartRxId] ON [dbo].[Prescription_Upload]
(
	[SmartRxId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Prescription_Upload_UserId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Prescription_Upload_UserId] ON [dbo].[Prescription_Upload]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Prescription_UserWiseFolder_CreatedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Prescription_UserWiseFolder_CreatedById] ON [dbo].[Prescription_UserWiseFolder]
(
	[CreatedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Prescription_UserWiseFolder_ModifiedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Prescription_UserWiseFolder_ModifiedById] ON [dbo].[Prescription_UserWiseFolder]
(
	[ModifiedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Prescription_UserWiseFolder_ParentFolderId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Prescription_UserWiseFolder_ParentFolderId] ON [dbo].[Prescription_UserWiseFolder]
(
	[ParentFolderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Prescription_UserWiseFolder_UserId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Prescription_UserWiseFolder_UserId] ON [dbo].[Prescription_UserWiseFolder]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Security_PMSRole_CreatedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Security_PMSRole_CreatedById] ON [dbo].[Security_PMSRole]
(
	[CreatedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Security_PMSRole_ModifiedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Security_PMSRole_ModifiedById] ON [dbo].[Security_PMSRole]
(
	[ModifiedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Security_PMSUser_SmartRxUserEntityId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Security_PMSUser_SmartRxUserEntityId] ON [dbo].[Security_PMSUser]
(
	[SmartRxUserEntityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Security_PMSUserWiseRole_CreatedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Security_PMSUserWiseRole_CreatedById] ON [dbo].[Security_PMSUserWiseRole]
(
	[CreatedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Security_PMSUserWiseRole_ModifiedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Security_PMSUserWiseRole_ModifiedById] ON [dbo].[Security_PMSUserWiseRole]
(
	[ModifiedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Security_PMSUserWiseRole_RoleId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Security_PMSUserWiseRole_RoleId] ON [dbo].[Security_PMSUserWiseRole]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_Master_ApprovedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_Master_ApprovedById] ON [dbo].[SmartRx_Master]
(
	[ApprovedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_Master_CompletedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_Master_CompletedById] ON [dbo].[SmartRx_Master]
(
	[CompletedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_Master_CreatedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_Master_CreatedById] ON [dbo].[SmartRx_Master]
(
	[CreatedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_Master_LockedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_Master_LockedById] ON [dbo].[SmartRx_Master]
(
	[LockedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_Master_ModifiedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_Master_ModifiedById] ON [dbo].[SmartRx_Master]
(
	[ModifiedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_Master_PatientId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_Master_PatientId] ON [dbo].[SmartRx_Master]
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_Master_PrescriptionId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_Master_PrescriptionId] ON [dbo].[SmartRx_Master]
(
	[PrescriptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_Master_RecommendedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_Master_RecommendedById] ON [dbo].[SmartRx_Master]
(
	[RecommendedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_Master_RejectedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_Master_RejectedById] ON [dbo].[SmartRx_Master]
(
	[RejectedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_Master_ReportById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_Master_ReportById] ON [dbo].[SmartRx_Master]
(
	[ReportById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_Master_UserId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_Master_UserId] ON [dbo].[SmartRx_Master]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_PatientAdvice_CreatedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_PatientAdvice_CreatedById] ON [dbo].[SmartRx_PatientAdvice]
(
	[CreatedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_PatientAdvice_ModifiedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_PatientAdvice_ModifiedById] ON [dbo].[SmartRx_PatientAdvice]
(
	[ModifiedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_PatientAdvice_PrescriptionId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_PatientAdvice_PrescriptionId] ON [dbo].[SmartRx_PatientAdvice]
(
	[PrescriptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_PatientAdvice_SmartRxMasterId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_PatientAdvice_SmartRxMasterId] ON [dbo].[SmartRx_PatientAdvice]
(
	[SmartRxMasterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_PatientChiefComplaint_CreatedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_PatientChiefComplaint_CreatedById] ON [dbo].[SmartRx_PatientChiefComplaint]
(
	[CreatedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_PatientChiefComplaint_ModifiedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_PatientChiefComplaint_ModifiedById] ON [dbo].[SmartRx_PatientChiefComplaint]
(
	[ModifiedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_PatientChiefComplaint_SmartRxMasterId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_PatientChiefComplaint_SmartRxMasterId] ON [dbo].[SmartRx_PatientChiefComplaint]
(
	[SmartRxMasterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_PatientChiefComplaint_UploadedPrescriptionId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_PatientChiefComplaint_UploadedPrescriptionId] ON [dbo].[SmartRx_PatientChiefComplaint]
(
	[UploadedPrescriptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_PatientDoctor_ChamberFeeMeasurementUnitId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_PatientDoctor_ChamberFeeMeasurementUnitId] ON [dbo].[SmartRx_PatientDoctor]
(
	[ChamberFeeMeasurementUnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_PatientDoctor_CreatedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_PatientDoctor_CreatedById] ON [dbo].[SmartRx_PatientDoctor]
(
	[CreatedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_PatientDoctor_DoctorId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_PatientDoctor_DoctorId] ON [dbo].[SmartRx_PatientDoctor]
(
	[DoctorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_PatientDoctor_ModifiedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_PatientDoctor_ModifiedById] ON [dbo].[SmartRx_PatientDoctor]
(
	[ModifiedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_PatientDoctor_PrescriptionId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_PatientDoctor_PrescriptionId] ON [dbo].[SmartRx_PatientDoctor]
(
	[PrescriptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_PatientDoctor_SmartRxMasterId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_PatientDoctor_SmartRxMasterId] ON [dbo].[SmartRx_PatientDoctor]
(
	[SmartRxMasterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_PatientHistory_CreatedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_PatientHistory_CreatedById] ON [dbo].[SmartRx_PatientHistory]
(
	[CreatedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_PatientHistory_ModifiedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_PatientHistory_ModifiedById] ON [dbo].[SmartRx_PatientHistory]
(
	[ModifiedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_PatientHistory_PrescriptionId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_PatientHistory_PrescriptionId] ON [dbo].[SmartRx_PatientHistory]
(
	[PrescriptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_PatientHistory_SmartRxMasterId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_PatientHistory_SmartRxMasterId] ON [dbo].[SmartRx_PatientHistory]
(
	[SmartRxMasterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_PatientInvestigation_CreatedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_PatientInvestigation_CreatedById] ON [dbo].[SmartRx_PatientInvestigation]
(
	[CreatedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_PatientInvestigation_DiagnosticCenterWiseTestId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_PatientInvestigation_DiagnosticCenterWiseTestId] ON [dbo].[SmartRx_PatientInvestigation]
(
	[DiagnosticCenterWiseTestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_PatientInvestigation_ModifiedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_PatientInvestigation_ModifiedById] ON [dbo].[SmartRx_PatientInvestigation]
(
	[ModifiedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_PatientInvestigation_PrescriptionId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_PatientInvestigation_PrescriptionId] ON [dbo].[SmartRx_PatientInvestigation]
(
	[PrescriptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_PatientInvestigation_PriceUnitId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_PatientInvestigation_PriceUnitId] ON [dbo].[SmartRx_PatientInvestigation]
(
	[PriceUnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_PatientInvestigation_SmartRxMasterId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_PatientInvestigation_SmartRxMasterId] ON [dbo].[SmartRx_PatientInvestigation]
(
	[SmartRxMasterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_PatientInvestigation_TestId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_PatientInvestigation_TestId] ON [dbo].[SmartRx_PatientInvestigation]
(
	[TestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_PatientMedicine_CreatedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_PatientMedicine_CreatedById] ON [dbo].[SmartRx_PatientMedicine]
(
	[CreatedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_PatientMedicine_MedicineId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_PatientMedicine_MedicineId] ON [dbo].[SmartRx_PatientMedicine]
(
	[MedicineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_PatientMedicine_ModifiedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_PatientMedicine_ModifiedById] ON [dbo].[SmartRx_PatientMedicine]
(
	[ModifiedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_PatientMedicine_PrescriptionId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_PatientMedicine_PrescriptionId] ON [dbo].[SmartRx_PatientMedicine]
(
	[PrescriptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_PatientMedicine_SmartRxMasterId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_PatientMedicine_SmartRxMasterId] ON [dbo].[SmartRx_PatientMedicine]
(
	[SmartRxMasterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_PatientOtherExpense_CreatedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_PatientOtherExpense_CreatedById] ON [dbo].[SmartRx_PatientOtherExpense]
(
	[CreatedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_PatientOtherExpense_CurrencyUnitId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_PatientOtherExpense_CurrencyUnitId] ON [dbo].[SmartRx_PatientOtherExpense]
(
	[CurrencyUnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_PatientOtherExpense_ModifiedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_PatientOtherExpense_ModifiedById] ON [dbo].[SmartRx_PatientOtherExpense]
(
	[ModifiedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_PatientOtherExpense_PrescriptionId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_PatientOtherExpense_PrescriptionId] ON [dbo].[SmartRx_PatientOtherExpense]
(
	[PrescriptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_PatientOtherExpense_SmartRxMasterId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_PatientOtherExpense_SmartRxMasterId] ON [dbo].[SmartRx_PatientOtherExpense]
(
	[SmartRxMasterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_PatientProfile_CityId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_PatientProfile_CityId] ON [dbo].[SmartRx_PatientProfile]
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_PatientProfile_CreatedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_PatientProfile_CreatedById] ON [dbo].[SmartRx_PatientProfile]
(
	[CreatedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_PatientProfile_ExistingPatientId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_PatientProfile_ExistingPatientId] ON [dbo].[SmartRx_PatientProfile]
(
	[ExistingPatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_PatientProfile_HeightMeasurementUnitId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_PatientProfile_HeightMeasurementUnitId] ON [dbo].[SmartRx_PatientProfile]
(
	[HeightMeasurementUnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_PatientProfile_ModifiedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_PatientProfile_ModifiedById] ON [dbo].[SmartRx_PatientProfile]
(
	[ModifiedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_PatientProfile_PoliceStationId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_PatientProfile_PoliceStationId] ON [dbo].[SmartRx_PatientProfile]
(
	[PoliceStationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_PatientProfile_RelatedToPatientId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_PatientProfile_RelatedToPatientId] ON [dbo].[SmartRx_PatientProfile]
(
	[RelatedToPatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_PatientProfile_UserId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_PatientProfile_UserId] ON [dbo].[SmartRx_PatientProfile]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_PatientProfile_WeightMeasurementUnitId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_PatientProfile_WeightMeasurementUnitId] ON [dbo].[SmartRx_PatientProfile]
(
	[WeightMeasurementUnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_PatientRelatives_CreatedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_PatientRelatives_CreatedById] ON [dbo].[SmartRx_PatientRelatives]
(
	[CreatedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_PatientRelatives_ModifiedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_PatientRelatives_ModifiedById] ON [dbo].[SmartRx_PatientRelatives]
(
	[ModifiedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_PatientRelatives_PatientId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_PatientRelatives_PatientId] ON [dbo].[SmartRx_PatientRelatives]
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_PatientRelatives_PatientRelativeId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_PatientRelatives_PatientRelativeId] ON [dbo].[SmartRx_PatientRelatives]
(
	[PatientRelativeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_PatientRelatives_SmartRx_MasterEntityId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_PatientRelatives_SmartRx_MasterEntityId] ON [dbo].[SmartRx_PatientRelatives]
(
	[SmartRx_MasterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Smartrx_PatientReward_BadgeId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Smartrx_PatientReward_BadgeId] ON [dbo].[Smartrx_PatientReward]
(
	[BadgeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Smartrx_PatientReward_CreatedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Smartrx_PatientReward_CreatedById] ON [dbo].[Smartrx_PatientReward]
(
	[CreatedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Smartrx_PatientReward_ModifiedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Smartrx_PatientReward_ModifiedById] ON [dbo].[Smartrx_PatientReward]
(
	[ModifiedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Smartrx_PatientReward_PatientId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Smartrx_PatientReward_PatientId] ON [dbo].[Smartrx_PatientReward]
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Smartrx_PatientReward_PrescriptionId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Smartrx_PatientReward_PrescriptionId] ON [dbo].[Smartrx_PatientReward]
(
	[PrescriptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Smartrx_PatientReward_SmartRxMasterId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_Smartrx_PatientReward_SmartRxMasterId] ON [dbo].[Smartrx_PatientReward]
(
	[SmartRxMasterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_PatientVitals_CreatedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_PatientVitals_CreatedById] ON [dbo].[SmartRx_PatientVitals]
(
	[CreatedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_PatientVitals_ModifiedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_PatientVitals_ModifiedById] ON [dbo].[SmartRx_PatientVitals]
(
	[ModifiedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_PatientVitals_PatientId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_PatientVitals_PatientId] ON [dbo].[SmartRx_PatientVitals]
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_PatientVitals_PrescriptionId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_PatientVitals_PrescriptionId] ON [dbo].[SmartRx_PatientVitals]
(
	[PrescriptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_PatientVitals_SmartRxMasterId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_PatientVitals_SmartRxMasterId] ON [dbo].[SmartRx_PatientVitals]
(
	[SmartRxMasterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_PatientVitals_VitalId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_PatientVitals_VitalId] ON [dbo].[SmartRx_PatientVitals]
(
	[VitalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_ReferredConsultant_CreatedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_ReferredConsultant_CreatedById] ON [dbo].[SmartRx_ReferredConsultant]
(
	[CreatedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_ReferredConsultant_ModifiedById]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_ReferredConsultant_ModifiedById] ON [dbo].[SmartRx_ReferredConsultant]
(
	[ModifiedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_ReferredConsultant_ReferredConsultantId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_ReferredConsultant_ReferredConsultantId] ON [dbo].[SmartRx_ReferredConsultant]
(
	[ReferredConsultantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SmartRx_ReferredConsultant_SmartRxMasterId]    Script Date: 10/14/2025 12:08:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_SmartRx_ReferredConsultant_SmartRxMasterId] ON [dbo].[SmartRx_ReferredConsultant]
(
	[SmartRxMasterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Configuration_Doctor] ADD  DEFAULT (N'') FOR [FirstName]
GO
ALTER TABLE [dbo].[Configuration_Doctor] ADD  DEFAULT (N'') FOR [LastName]
GO
ALTER TABLE [dbo].[Configuration_Doctor] ADD  DEFAULT ((0)) FOR [YearOfExperiences]
GO
ALTER TABLE [dbo].[Configuration_DoctorChamber] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsMainChamber]
GO
ALTER TABLE [dbo].[Configuration_DoctorChamber] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Configuration_DoctorChamber] ADD  DEFAULT (N'') FOR [ChamberAddress]
GO
ALTER TABLE [dbo].[Configuration_DoctorChamber] ADD  DEFAULT (CONVERT([bigint],(0))) FOR [ChamberCityId]
GO
ALTER TABLE [dbo].[Configuration_DoctorChamber] ADD  DEFAULT (N'') FOR [ChamberDescription]
GO
ALTER TABLE [dbo].[Configuration_DoctorChamber] ADD  DEFAULT (N'') FOR [ChamberGoogleAddress]
GO
ALTER TABLE [dbo].[Configuration_DoctorChamber] ADD  DEFAULT (N'') FOR [ChamberGoogleLocationLink]
GO
ALTER TABLE [dbo].[Configuration_DoctorChamber] ADD  DEFAULT (N'') FOR [ChamberName]
GO
ALTER TABLE [dbo].[Configuration_DoctorChamber] ADD  DEFAULT (N'') FOR [ChamberPostalCode]
GO
ALTER TABLE [dbo].[Configuration_DoctorChamber] ADD  DEFAULT (N'') FOR [ChamberType]
GO
ALTER TABLE [dbo].[Configuration_DoctorChamber] ADD  DEFAULT (N'') FOR [DoctorVisitingDaysInChamber]
GO
ALTER TABLE [dbo].[Configuration_Hospital] ADD  DEFAULT (N'') FOR [Description]
GO
ALTER TABLE [dbo].[Configuration_Hospital] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Configuration_Hospital] ADD  DEFAULT (N'') FOR [DiagnosticCenterIcon]
GO
ALTER TABLE [dbo].[Configuration_Hospital] ADD  DEFAULT (N'') FOR [Branch]
GO
ALTER TABLE [dbo].[Configuration_Investigation] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Configuration_Investigation] ADD  DEFAULT (N'') FOR [NationalPriceReference]
GO
ALTER TABLE [dbo].[Configuration_Medicine] ADD  DEFAULT (N'') FOR [Name]
GO
ALTER TABLE [dbo].[Configuration_MedicineBrand] ADD  DEFAULT (CONVERT([bigint],(0))) FOR [BrandPublicId]
GO
ALTER TABLE [dbo].[Configuration_MedicineDosageForm] ADD  DEFAULT (N'') FOR [ShortForm]
GO
ALTER TABLE [dbo].[Configuration_MedicineFAQ] ADD  DEFAULT (N'') FOR [Question]
GO
ALTER TABLE [dbo].[Configuration_MedicineFAQ] ADD  DEFAULT (N'') FOR [Answer]
GO
ALTER TABLE [dbo].[Configuration_MedicineFAQ] ADD  DEFAULT (CONVERT([bigint],(0))) FOR [MedicineId]
GO
ALTER TABLE [dbo].[Configuration_SmartRxAcronym] ADD  DEFAULT (N'') FOR [Elaboration]
GO
ALTER TABLE [dbo].[Configuration_VitalFAQ] ADD  DEFAULT (CONVERT([bigint],(0))) FOR [VitalId]
GO
ALTER TABLE [dbo].[Prescription_Upload] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [PrescriptionDate]
GO
ALTER TABLE [dbo].[Prescription_UserWiseFolder] ADD  DEFAULT ('') FOR [FolderHierarchy]
GO
ALTER TABLE [dbo].[SmartRx_Master] ADD  DEFAULT (CONVERT([bigint],(0))) FOR [PrescriptionId]
GO
ALTER TABLE [dbo].[SmartRx_PatientChiefComplaint] ADD  DEFAULT (N'') FOR [Description]
GO
ALTER TABLE [dbo].[SmartRx_PatientHistory] ADD  DEFAULT (N'') FOR [Title]
GO
ALTER TABLE [dbo].[SmartRx_PatientInvestigation] ADD  DEFAULT ((0.0)) FOR [DiscountByAuthority]
GO
ALTER TABLE [dbo].[SmartRx_PatientInvestigation] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsCompleted]
GO
ALTER TABLE [dbo].[SmartRx_PatientInvestigation] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [TestDate]
GO
ALTER TABLE [dbo].[SmartRx_PatientMedicine] ADD  DEFAULT (CONVERT([bigint],(0))) FOR [MedicineId]
GO
ALTER TABLE [dbo].[SmartRx_PatientMedicine] ADD  DEFAULT ((0.0)) FOR [Dose10InADay]
GO
ALTER TABLE [dbo].[SmartRx_PatientMedicine] ADD  DEFAULT ((0.0)) FOR [Dose11InADay]
GO
ALTER TABLE [dbo].[SmartRx_PatientMedicine] ADD  DEFAULT ((0.0)) FOR [Dose12InADay]
GO
ALTER TABLE [dbo].[SmartRx_PatientMedicine] ADD  DEFAULT ((0.0)) FOR [Dose1InADay]
GO
ALTER TABLE [dbo].[SmartRx_PatientMedicine] ADD  DEFAULT ((0.0)) FOR [Dose2InADay]
GO
ALTER TABLE [dbo].[SmartRx_PatientMedicine] ADD  DEFAULT ((0.0)) FOR [Dose3InADay]
GO
ALTER TABLE [dbo].[SmartRx_PatientMedicine] ADD  DEFAULT ((0.0)) FOR [Dose4InADay]
GO
ALTER TABLE [dbo].[SmartRx_PatientMedicine] ADD  DEFAULT ((0.0)) FOR [Dose5InADay]
GO
ALTER TABLE [dbo].[SmartRx_PatientMedicine] ADD  DEFAULT ((0.0)) FOR [Dose6InADay]
GO
ALTER TABLE [dbo].[SmartRx_PatientMedicine] ADD  DEFAULT ((0.0)) FOR [Dose7InADay]
GO
ALTER TABLE [dbo].[SmartRx_PatientMedicine] ADD  DEFAULT ((0.0)) FOR [Dose8InADay]
GO
ALTER TABLE [dbo].[SmartRx_PatientMedicine] ADD  DEFAULT ((0.0)) FOR [Dose9InADay]
GO
ALTER TABLE [dbo].[SmartRx_PatientMedicine] ADD  DEFAULT (N'') FOR [DurationOfContinuation]
GO
ALTER TABLE [dbo].[SmartRx_PatientMedicine] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [DurationOfContinuationEndDate]
GO
ALTER TABLE [dbo].[SmartRx_PatientMedicine] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [DurationOfContinuationStartDate]
GO
ALTER TABLE [dbo].[SmartRx_PatientProfile] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsExistingPatient]
GO
ALTER TABLE [dbo].[SmartRx_PatientProfile] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsRelative]
GO
ALTER TABLE [dbo].[SmartRx_PatientProfile] ADD  DEFAULT ((0.0)) FOR [Weight]
GO
ALTER TABLE [dbo].[SmartRx_PatientProfile] ADD  DEFAULT ((0)) FOR [ProfileProgress]
GO
ALTER TABLE [dbo].[SmartRx_PatientProfile] ADD  DEFAULT (CONVERT([bigint],(0))) FOR [UserId]
GO
ALTER TABLE [dbo].[SmartRx_PatientVitals] ADD  DEFAULT (CONVERT([bigint],(0))) FOR [PatientId]
GO
ALTER TABLE [dbo].[SmartRx_PatientWishlist] ADD  DEFAULT (N'') FOR [WishListType]
GO
ALTER TABLE [dbo].[Configuration_AdviceFAQ]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_AdviceFAQ_Security_PMSUser_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_AdviceFAQ] CHECK CONSTRAINT [FK_Configuration_AdviceFAQ_Security_PMSUser_CreatedById]
GO
ALTER TABLE [dbo].[Configuration_AdviceFAQ]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_AdviceFAQ_Security_PMSUser_ModifiedById] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_AdviceFAQ] CHECK CONSTRAINT [FK_Configuration_AdviceFAQ_Security_PMSUser_ModifiedById]
GO
ALTER TABLE [dbo].[Configuration_ChiefComplaint]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_ChiefComplaint_Security_PMSUser_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_ChiefComplaint] CHECK CONSTRAINT [FK_Configuration_ChiefComplaint_Security_PMSUser_CreatedById]
GO
ALTER TABLE [dbo].[Configuration_ChiefComplaint]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_ChiefComplaint_Security_PMSUser_ModifiedById] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_ChiefComplaint] CHECK CONSTRAINT [FK_Configuration_ChiefComplaint_Security_PMSUser_ModifiedById]
GO
ALTER TABLE [dbo].[Configuration_City]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_City_Configuration_Country_CountryId] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Configuration_Country] ([Id])
GO
ALTER TABLE [dbo].[Configuration_City] CHECK CONSTRAINT [FK_Configuration_City_Configuration_Country_CountryId]
GO
ALTER TABLE [dbo].[Configuration_City]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_City_Configuration_District_DistrictId] FOREIGN KEY([DistrictId])
REFERENCES [dbo].[Configuration_District] ([Id])
GO
ALTER TABLE [dbo].[Configuration_City] CHECK CONSTRAINT [FK_Configuration_City_Configuration_District_DistrictId]
GO
ALTER TABLE [dbo].[Configuration_City]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_City_Security_PMSUser_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_City] CHECK CONSTRAINT [FK_Configuration_City_Security_PMSUser_CreatedById]
GO
ALTER TABLE [dbo].[Configuration_City]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_City_Security_PMSUser_ModifiedById] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_City] CHECK CONSTRAINT [FK_Configuration_City_Security_PMSUser_ModifiedById]
GO
ALTER TABLE [dbo].[Configuration_Country]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_Country_Security_PMSUser_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_Country] CHECK CONSTRAINT [FK_Configuration_Country_Security_PMSUser_CreatedById]
GO
ALTER TABLE [dbo].[Configuration_Country]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_Country_Security_PMSUser_ModifiedById] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_Country] CHECK CONSTRAINT [FK_Configuration_Country_Security_PMSUser_ModifiedById]
GO
ALTER TABLE [dbo].[Configuration_Department]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_Department_Configuration_DepartmentSection_SectionId] FOREIGN KEY([SectionId])
REFERENCES [dbo].[Configuration_DepartmentSection] ([Id])
GO
ALTER TABLE [dbo].[Configuration_Department] CHECK CONSTRAINT [FK_Configuration_Department_Configuration_DepartmentSection_SectionId]
GO
ALTER TABLE [dbo].[Configuration_Department]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_Department_Configuration_Hospital_HospitalId] FOREIGN KEY([HospitalId])
REFERENCES [dbo].[Configuration_Hospital] ([Id])
GO
ALTER TABLE [dbo].[Configuration_Department] CHECK CONSTRAINT [FK_Configuration_Department_Configuration_Hospital_HospitalId]
GO
ALTER TABLE [dbo].[Configuration_Department]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_Department_Security_PMSUser_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_Department] CHECK CONSTRAINT [FK_Configuration_Department_Security_PMSUser_CreatedById]
GO
ALTER TABLE [dbo].[Configuration_Department]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_Department_Security_PMSUser_ModifiedById] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_Department] CHECK CONSTRAINT [FK_Configuration_Department_Security_PMSUser_ModifiedById]
GO
ALTER TABLE [dbo].[Configuration_DepartmentSection]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_DepartmentSection_Configuration_Hospital_HospitalId] FOREIGN KEY([HospitalId])
REFERENCES [dbo].[Configuration_Hospital] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Configuration_DepartmentSection] CHECK CONSTRAINT [FK_Configuration_DepartmentSection_Configuration_Hospital_HospitalId]
GO
ALTER TABLE [dbo].[Configuration_DepartmentSection]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_DepartmentSection_Security_PMSUser_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_DepartmentSection] CHECK CONSTRAINT [FK_Configuration_DepartmentSection_Security_PMSUser_CreatedById]
GO
ALTER TABLE [dbo].[Configuration_DepartmentSection]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_DepartmentSection_Security_PMSUser_ModifiedById] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_DepartmentSection] CHECK CONSTRAINT [FK_Configuration_DepartmentSection_Security_PMSUser_ModifiedById]
GO
ALTER TABLE [dbo].[Configuration_Designation]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_Designation_Security_PMSUser_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_Designation] CHECK CONSTRAINT [FK_Configuration_Designation_Security_PMSUser_CreatedById]
GO
ALTER TABLE [dbo].[Configuration_Designation]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_Designation_Security_PMSUser_ModifiedById] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_Designation] CHECK CONSTRAINT [FK_Configuration_Designation_Security_PMSUser_ModifiedById]
GO
ALTER TABLE [dbo].[Configuration_DiagnosisCenterWiseTest]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_DiagnosisCenterWiseTest_Configuration_Hospital_TestCenterId] FOREIGN KEY([TestCenterId])
REFERENCES [dbo].[Configuration_Hospital] ([Id])
GO
ALTER TABLE [dbo].[Configuration_DiagnosisCenterWiseTest] CHECK CONSTRAINT [FK_Configuration_DiagnosisCenterWiseTest_Configuration_Hospital_TestCenterId]
GO
ALTER TABLE [dbo].[Configuration_DiagnosisCenterWiseTest]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_DiagnosisCenterWiseTest_Configuration_Investigation_TestId] FOREIGN KEY([TestId])
REFERENCES [dbo].[Configuration_Investigation] ([Id])
GO
ALTER TABLE [dbo].[Configuration_DiagnosisCenterWiseTest] CHECK CONSTRAINT [FK_Configuration_DiagnosisCenterWiseTest_Configuration_Investigation_TestId]
GO
ALTER TABLE [dbo].[Configuration_DiagnosisCenterWiseTest]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_DiagnosisCenterWiseTest_Configuration_Unit_PriceUnitId] FOREIGN KEY([PriceUnitId])
REFERENCES [dbo].[Configuration_Unit] ([Id])
GO
ALTER TABLE [dbo].[Configuration_DiagnosisCenterWiseTest] CHECK CONSTRAINT [FK_Configuration_DiagnosisCenterWiseTest_Configuration_Unit_PriceUnitId]
GO
ALTER TABLE [dbo].[Configuration_DiagnosisCenterWiseTest]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_DiagnosisCenterWiseTest_Security_PMSUser_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_DiagnosisCenterWiseTest] CHECK CONSTRAINT [FK_Configuration_DiagnosisCenterWiseTest_Security_PMSUser_CreatedById]
GO
ALTER TABLE [dbo].[Configuration_DiagnosisCenterWiseTest]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_DiagnosisCenterWiseTest_Security_PMSUser_ModifiedById] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_DiagnosisCenterWiseTest] CHECK CONSTRAINT [FK_Configuration_DiagnosisCenterWiseTest_Security_PMSUser_ModifiedById]
GO
ALTER TABLE [dbo].[Configuration_District]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_District_Security_PMSUser_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_District] CHECK CONSTRAINT [FK_Configuration_District_Security_PMSUser_CreatedById]
GO
ALTER TABLE [dbo].[Configuration_District]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_District_Security_PMSUser_ModifiedById] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_District] CHECK CONSTRAINT [FK_Configuration_District_Security_PMSUser_ModifiedById]
GO
ALTER TABLE [dbo].[Configuration_Doctor]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_Doctor_Security_PMSUser_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_Doctor] CHECK CONSTRAINT [FK_Configuration_Doctor_Security_PMSUser_CreatedById]
GO
ALTER TABLE [dbo].[Configuration_Doctor]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_Doctor_Security_PMSUser_ModifiedById] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_Doctor] CHECK CONSTRAINT [FK_Configuration_Doctor_Security_PMSUser_ModifiedById]
GO
ALTER TABLE [dbo].[Configuration_DoctorChamber]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_DoctorChamber_Configuration_City_CityId] FOREIGN KEY([CityId])
REFERENCES [dbo].[Configuration_City] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Configuration_DoctorChamber] CHECK CONSTRAINT [FK_Configuration_DoctorChamber_Configuration_City_CityId]
GO
ALTER TABLE [dbo].[Configuration_DoctorChamber]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_DoctorChamber_Configuration_Department_DepartmentId] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Configuration_Department] ([Id])
GO
ALTER TABLE [dbo].[Configuration_DoctorChamber] CHECK CONSTRAINT [FK_Configuration_DoctorChamber_Configuration_Department_DepartmentId]
GO
ALTER TABLE [dbo].[Configuration_DoctorChamber]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_DoctorChamber_Configuration_DepartmentSection_DepartmentSectionId] FOREIGN KEY([DepartmentSectionId])
REFERENCES [dbo].[Configuration_DepartmentSection] ([Id])
GO
ALTER TABLE [dbo].[Configuration_DoctorChamber] CHECK CONSTRAINT [FK_Configuration_DoctorChamber_Configuration_DepartmentSection_DepartmentSectionId]
GO
ALTER TABLE [dbo].[Configuration_DoctorChamber]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_DoctorChamber_Configuration_Designation_DoctorDesignationInChamberId] FOREIGN KEY([DoctorDesignationInChamberId])
REFERENCES [dbo].[Configuration_Designation] ([Id])
GO
ALTER TABLE [dbo].[Configuration_DoctorChamber] CHECK CONSTRAINT [FK_Configuration_DoctorChamber_Configuration_Designation_DoctorDesignationInChamberId]
GO
ALTER TABLE [dbo].[Configuration_DoctorChamber]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_DoctorChamber_Configuration_Doctor_DoctorId] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Configuration_Doctor] ([Id])
GO
ALTER TABLE [dbo].[Configuration_DoctorChamber] CHECK CONSTRAINT [FK_Configuration_DoctorChamber_Configuration_Doctor_DoctorId]
GO
ALTER TABLE [dbo].[Configuration_DoctorChamber]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_DoctorChamber_Configuration_Hospital_HospitalId] FOREIGN KEY([HospitalId])
REFERENCES [dbo].[Configuration_Hospital] ([Id])
GO
ALTER TABLE [dbo].[Configuration_DoctorChamber] CHECK CONSTRAINT [FK_Configuration_DoctorChamber_Configuration_Hospital_HospitalId]
GO
ALTER TABLE [dbo].[Configuration_DoctorChamber]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_DoctorChamber_Security_PMSUser_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_DoctorChamber] CHECK CONSTRAINT [FK_Configuration_DoctorChamber_Security_PMSUser_CreatedById]
GO
ALTER TABLE [dbo].[Configuration_DoctorChamber]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_DoctorChamber_Security_PMSUser_ModifiedById] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_DoctorChamber] CHECK CONSTRAINT [FK_Configuration_DoctorChamber_Security_PMSUser_ModifiedById]
GO
ALTER TABLE [dbo].[Configuration_Education]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_Education_Security_PMSUser_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_Education] CHECK CONSTRAINT [FK_Configuration_Education_Security_PMSUser_CreatedById]
GO
ALTER TABLE [dbo].[Configuration_Education]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_Education_Security_PMSUser_ModifiedById] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_Education] CHECK CONSTRAINT [FK_Configuration_Education_Security_PMSUser_ModifiedById]
GO
ALTER TABLE [dbo].[Configuration_Hospital]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_Hospital_Configuration_City_CityId] FOREIGN KEY([CityId])
REFERENCES [dbo].[Configuration_City] ([Id])
GO
ALTER TABLE [dbo].[Configuration_Hospital] CHECK CONSTRAINT [FK_Configuration_Hospital_Configuration_City_CityId]
GO
ALTER TABLE [dbo].[Configuration_Hospital]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_Hospital_Security_PMSUser_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_Hospital] CHECK CONSTRAINT [FK_Configuration_Hospital_Security_PMSUser_CreatedById]
GO
ALTER TABLE [dbo].[Configuration_Hospital]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_Hospital_Security_PMSUser_ModifiedById] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_Hospital] CHECK CONSTRAINT [FK_Configuration_Hospital_Security_PMSUser_ModifiedById]
GO
ALTER TABLE [dbo].[Configuration_Investigation]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_Investigation_Configuration_Unit_NationalPriceUnitId] FOREIGN KEY([NationalPriceUnitId])
REFERENCES [dbo].[Configuration_Unit] ([Id])
GO
ALTER TABLE [dbo].[Configuration_Investigation] CHECK CONSTRAINT [FK_Configuration_Investigation_Configuration_Unit_NationalPriceUnitId]
GO
ALTER TABLE [dbo].[Configuration_Investigation]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_Investigation_Configuration_Unit_PriceUnitId] FOREIGN KEY([PriceUnitId])
REFERENCES [dbo].[Configuration_Unit] ([Id])
GO
ALTER TABLE [dbo].[Configuration_Investigation] CHECK CONSTRAINT [FK_Configuration_Investigation_Configuration_Unit_PriceUnitId]
GO
ALTER TABLE [dbo].[Configuration_Investigation]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_Investigation_Security_PMSUser_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_Investigation] CHECK CONSTRAINT [FK_Configuration_Investigation_Security_PMSUser_CreatedById]
GO
ALTER TABLE [dbo].[Configuration_Investigation]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_Investigation_Security_PMSUser_ModifiedById] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_Investigation] CHECK CONSTRAINT [FK_Configuration_Investigation_Security_PMSUser_ModifiedById]
GO
ALTER TABLE [dbo].[Configuration_InvestigationFAQ]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_InvestigationFAQ_Security_PMSUser_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_InvestigationFAQ] CHECK CONSTRAINT [FK_Configuration_InvestigationFAQ_Security_PMSUser_CreatedById]
GO
ALTER TABLE [dbo].[Configuration_InvestigationFAQ]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_InvestigationFAQ_Security_PMSUser_ModifiedById] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_InvestigationFAQ] CHECK CONSTRAINT [FK_Configuration_InvestigationFAQ_Security_PMSUser_ModifiedById]
GO
ALTER TABLE [dbo].[Configuration_Medicine]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_Medicine_Configuration_MedicineBrand_BrandId] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Configuration_MedicineBrand] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Configuration_Medicine] CHECK CONSTRAINT [FK_Configuration_Medicine_Configuration_MedicineBrand_BrandId]
GO
ALTER TABLE [dbo].[Configuration_Medicine]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_Medicine_Configuration_MedicineDosageForm_DosageFormId] FOREIGN KEY([DosageFormId])
REFERENCES [dbo].[Configuration_MedicineDosageForm] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Configuration_Medicine] CHECK CONSTRAINT [FK_Configuration_Medicine_Configuration_MedicineDosageForm_DosageFormId]
GO
ALTER TABLE [dbo].[Configuration_Medicine]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_Medicine_Configuration_MedicineGeneric_GenericId] FOREIGN KEY([GenericId])
REFERENCES [dbo].[Configuration_MedicineGeneric] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Configuration_Medicine] CHECK CONSTRAINT [FK_Configuration_Medicine_Configuration_MedicineGeneric_GenericId]
GO
ALTER TABLE [dbo].[Configuration_Medicine]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_Medicine_Configuration_Unit_MeasurementUnitId] FOREIGN KEY([MeasurementUnitId])
REFERENCES [dbo].[Configuration_Unit] ([Id])
GO
ALTER TABLE [dbo].[Configuration_Medicine] CHECK CONSTRAINT [FK_Configuration_Medicine_Configuration_Unit_MeasurementUnitId]
GO
ALTER TABLE [dbo].[Configuration_Medicine]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_Medicine_Configuration_Unit_PriceInUnitId] FOREIGN KEY([PriceInUnitId])
REFERENCES [dbo].[Configuration_Unit] ([Id])
GO
ALTER TABLE [dbo].[Configuration_Medicine] CHECK CONSTRAINT [FK_Configuration_Medicine_Configuration_Unit_PriceInUnitId]
GO
ALTER TABLE [dbo].[Configuration_Medicine]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_Medicine_Security_PMSUser_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_Medicine] CHECK CONSTRAINT [FK_Configuration_Medicine_Security_PMSUser_CreatedById]
GO
ALTER TABLE [dbo].[Configuration_Medicine]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_Medicine_Security_PMSUser_ModifiedById] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_Medicine] CHECK CONSTRAINT [FK_Configuration_Medicine_Security_PMSUser_ModifiedById]
GO
ALTER TABLE [dbo].[Configuration_MedicineBrand]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_MedicineBrand_Configuration_MedicineManufactureInfo_ManufacturerId] FOREIGN KEY([ManufacturerId])
REFERENCES [dbo].[Configuration_MedicineManufactureInfo] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Configuration_MedicineBrand] CHECK CONSTRAINT [FK_Configuration_MedicineBrand_Configuration_MedicineManufactureInfo_ManufacturerId]
GO
ALTER TABLE [dbo].[Configuration_MedicineBrand]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_MedicineBrand_Security_PMSUser_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_MedicineBrand] CHECK CONSTRAINT [FK_Configuration_MedicineBrand_Security_PMSUser_CreatedById]
GO
ALTER TABLE [dbo].[Configuration_MedicineBrand]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_MedicineBrand_Security_PMSUser_ModifiedById] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_MedicineBrand] CHECK CONSTRAINT [FK_Configuration_MedicineBrand_Security_PMSUser_ModifiedById]
GO
ALTER TABLE [dbo].[Configuration_MedicineDosageForm]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_MedicineDosageForm_Security_PMSUser_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_MedicineDosageForm] CHECK CONSTRAINT [FK_Configuration_MedicineDosageForm_Security_PMSUser_CreatedById]
GO
ALTER TABLE [dbo].[Configuration_MedicineDosageForm]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_MedicineDosageForm_Security_PMSUser_ModifiedById] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_MedicineDosageForm] CHECK CONSTRAINT [FK_Configuration_MedicineDosageForm_Security_PMSUser_ModifiedById]
GO
ALTER TABLE [dbo].[Configuration_MedicineFAQ]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_MedicineFAQ_Security_PMSUser_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_MedicineFAQ] CHECK CONSTRAINT [FK_Configuration_MedicineFAQ_Security_PMSUser_CreatedById]
GO
ALTER TABLE [dbo].[Configuration_MedicineFAQ]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_MedicineFAQ_Security_PMSUser_ModifiedById] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_MedicineFAQ] CHECK CONSTRAINT [FK_Configuration_MedicineFAQ_Security_PMSUser_ModifiedById]
GO
ALTER TABLE [dbo].[Configuration_MedicineGeneric]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_MedicineGeneric_Security_PMSUser_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_MedicineGeneric] CHECK CONSTRAINT [FK_Configuration_MedicineGeneric_Security_PMSUser_CreatedById]
GO
ALTER TABLE [dbo].[Configuration_MedicineGeneric]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_MedicineGeneric_Security_PMSUser_ModifiedById] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_MedicineGeneric] CHECK CONSTRAINT [FK_Configuration_MedicineGeneric_Security_PMSUser_ModifiedById]
GO
ALTER TABLE [dbo].[Configuration_MedicineManufactureInfo]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_MedicineManufactureInfo_Security_PMSUser_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_MedicineManufactureInfo] CHECK CONSTRAINT [FK_Configuration_MedicineManufactureInfo_Security_PMSUser_CreatedById]
GO
ALTER TABLE [dbo].[Configuration_MedicineManufactureInfo]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_MedicineManufactureInfo_Security_PMSUser_ModifiedById] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_MedicineManufactureInfo] CHECK CONSTRAINT [FK_Configuration_MedicineManufactureInfo_Security_PMSUser_ModifiedById]
GO
ALTER TABLE [dbo].[Configuration_PoliceStation]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_PoliceStation_Configuration_City_CityId] FOREIGN KEY([CityId])
REFERENCES [dbo].[Configuration_City] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Configuration_PoliceStation] CHECK CONSTRAINT [FK_Configuration_PoliceStation_Configuration_City_CityId]
GO
ALTER TABLE [dbo].[Configuration_PoliceStation]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_PoliceStation_Configuration_Country_CountryId] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Configuration_Country] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Configuration_PoliceStation] CHECK CONSTRAINT [FK_Configuration_PoliceStation_Configuration_Country_CountryId]
GO
ALTER TABLE [dbo].[Configuration_PoliceStation]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_PoliceStation_Configuration_District_DistrictId] FOREIGN KEY([DistrictId])
REFERENCES [dbo].[Configuration_District] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Configuration_PoliceStation] CHECK CONSTRAINT [FK_Configuration_PoliceStation_Configuration_District_DistrictId]
GO
ALTER TABLE [dbo].[Configuration_PoliceStation]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_PoliceStation_Security_PMSUser_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_PoliceStation] CHECK CONSTRAINT [FK_Configuration_PoliceStation_Security_PMSUser_CreatedById]
GO
ALTER TABLE [dbo].[Configuration_PoliceStation]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_PoliceStation_Security_PMSUser_ModifiedById] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_PoliceStation] CHECK CONSTRAINT [FK_Configuration_PoliceStation_Security_PMSUser_ModifiedById]
GO
ALTER TABLE [dbo].[Configuration_PrescriptionSection]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_PrescriptionSection_Security_PMSUser_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_PrescriptionSection] CHECK CONSTRAINT [FK_Configuration_PrescriptionSection_Security_PMSUser_CreatedById]
GO
ALTER TABLE [dbo].[Configuration_PrescriptionSection]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_PrescriptionSection_Security_PMSUser_ModifiedById] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_PrescriptionSection] CHECK CONSTRAINT [FK_Configuration_PrescriptionSection_Security_PMSUser_ModifiedById]
GO
ALTER TABLE [dbo].[Configuration_Reward]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_Reward_Security_PMSUser_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_Reward] CHECK CONSTRAINT [FK_Configuration_Reward_Security_PMSUser_CreatedById]
GO
ALTER TABLE [dbo].[Configuration_Reward]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_Reward_Security_PMSUser_ModifiedById] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_Reward] CHECK CONSTRAINT [FK_Configuration_Reward_Security_PMSUser_ModifiedById]
GO
ALTER TABLE [dbo].[Configuration_RewardBadge]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_RewardBadge_Security_PMSUser_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_RewardBadge] CHECK CONSTRAINT [FK_Configuration_RewardBadge_Security_PMSUser_CreatedById]
GO
ALTER TABLE [dbo].[Configuration_RewardBadge]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_RewardBadge_Security_PMSUser_ModifiedById] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_RewardBadge] CHECK CONSTRAINT [FK_Configuration_RewardBadge_Security_PMSUser_ModifiedById]
GO
ALTER TABLE [dbo].[Configuration_SmartRxAcronym]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_SmartRxAcronym_Security_PMSUser_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_SmartRxAcronym] CHECK CONSTRAINT [FK_Configuration_SmartRxAcronym_Security_PMSUser_CreatedById]
GO
ALTER TABLE [dbo].[Configuration_SmartRxAcronym]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_SmartRxAcronym_Security_PMSUser_ModifiedById] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_SmartRxAcronym] CHECK CONSTRAINT [FK_Configuration_SmartRxAcronym_Security_PMSUser_ModifiedById]
GO
ALTER TABLE [dbo].[Configuration_Tags]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_Tags_Security_PMSUser_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_Tags] CHECK CONSTRAINT [FK_Configuration_Tags_Security_PMSUser_CreatedById]
GO
ALTER TABLE [dbo].[Configuration_Tags]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_Tags_Security_PMSUser_ModifiedById] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_Tags] CHECK CONSTRAINT [FK_Configuration_Tags_Security_PMSUser_ModifiedById]
GO
ALTER TABLE [dbo].[Configuration_Unit]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_Unit_Security_PMSUser_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_Unit] CHECK CONSTRAINT [FK_Configuration_Unit_Security_PMSUser_CreatedById]
GO
ALTER TABLE [dbo].[Configuration_Unit]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_Unit_Security_PMSUser_ModifiedById] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_Unit] CHECK CONSTRAINT [FK_Configuration_Unit_Security_PMSUser_ModifiedById]
GO
ALTER TABLE [dbo].[Configuration_Vital]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_Vital_Configuration_Unit_UnitId] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Configuration_Unit] ([Id])
GO
ALTER TABLE [dbo].[Configuration_Vital] CHECK CONSTRAINT [FK_Configuration_Vital_Configuration_Unit_UnitId]
GO
ALTER TABLE [dbo].[Configuration_Vital]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_Vital_Security_PMSUser_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_Vital] CHECK CONSTRAINT [FK_Configuration_Vital_Security_PMSUser_CreatedById]
GO
ALTER TABLE [dbo].[Configuration_Vital]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_Vital_Security_PMSUser_ModifiedById] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_Vital] CHECK CONSTRAINT [FK_Configuration_Vital_Security_PMSUser_ModifiedById]
GO
ALTER TABLE [dbo].[Configuration_VitalFAQ]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_VitalFAQ_Security_PMSUser_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_VitalFAQ] CHECK CONSTRAINT [FK_Configuration_VitalFAQ_Security_PMSUser_CreatedById]
GO
ALTER TABLE [dbo].[Configuration_VitalFAQ]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_VitalFAQ_Security_PMSUser_ModifiedById] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Configuration_VitalFAQ] CHECK CONSTRAINT [FK_Configuration_VitalFAQ_Security_PMSUser_ModifiedById]
GO
ALTER TABLE [dbo].[Prescription_Upload]  WITH CHECK ADD  CONSTRAINT [FK_Prescription_Upload_Prescription_UserWiseFolder_FolderId] FOREIGN KEY([FolderId])
REFERENCES [dbo].[Prescription_UserWiseFolder] ([Id])
GO
ALTER TABLE [dbo].[Prescription_Upload] CHECK CONSTRAINT [FK_Prescription_Upload_Prescription_UserWiseFolder_FolderId]
GO
ALTER TABLE [dbo].[Prescription_Upload]  WITH CHECK ADD  CONSTRAINT [FK_Prescription_Upload_Security_PMSUser_ApprovedById] FOREIGN KEY([ApprovedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Prescription_Upload] CHECK CONSTRAINT [FK_Prescription_Upload_Security_PMSUser_ApprovedById]
GO
ALTER TABLE [dbo].[Prescription_Upload]  WITH CHECK ADD  CONSTRAINT [FK_Prescription_Upload_Security_PMSUser_CompletedById] FOREIGN KEY([CompletedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Prescription_Upload] CHECK CONSTRAINT [FK_Prescription_Upload_Security_PMSUser_CompletedById]
GO
ALTER TABLE [dbo].[Prescription_Upload]  WITH CHECK ADD  CONSTRAINT [FK_Prescription_Upload_Security_PMSUser_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Prescription_Upload] CHECK CONSTRAINT [FK_Prescription_Upload_Security_PMSUser_CreatedById]
GO
ALTER TABLE [dbo].[Prescription_Upload]  WITH CHECK ADD  CONSTRAINT [FK_Prescription_Upload_Security_PMSUser_LockedById] FOREIGN KEY([LockedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Prescription_Upload] CHECK CONSTRAINT [FK_Prescription_Upload_Security_PMSUser_LockedById]
GO
ALTER TABLE [dbo].[Prescription_Upload]  WITH CHECK ADD  CONSTRAINT [FK_Prescription_Upload_Security_PMSUser_ModifiedById] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Prescription_Upload] CHECK CONSTRAINT [FK_Prescription_Upload_Security_PMSUser_ModifiedById]
GO
ALTER TABLE [dbo].[Prescription_Upload]  WITH CHECK ADD  CONSTRAINT [FK_Prescription_Upload_Security_PMSUser_RecommendedById] FOREIGN KEY([RecommendedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Prescription_Upload] CHECK CONSTRAINT [FK_Prescription_Upload_Security_PMSUser_RecommendedById]
GO
ALTER TABLE [dbo].[Prescription_Upload]  WITH CHECK ADD  CONSTRAINT [FK_Prescription_Upload_Security_PMSUser_ReportById] FOREIGN KEY([ReportById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Prescription_Upload] CHECK CONSTRAINT [FK_Prescription_Upload_Security_PMSUser_ReportById]
GO
ALTER TABLE [dbo].[Prescription_Upload]  WITH CHECK ADD  CONSTRAINT [FK_Prescription_Upload_Security_PMSUser_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Prescription_Upload] CHECK CONSTRAINT [FK_Prescription_Upload_Security_PMSUser_UserId]
GO
ALTER TABLE [dbo].[Prescription_Upload]  WITH CHECK ADD  CONSTRAINT [FK_Prescription_Upload_SmartRx_Master_SmartRxId] FOREIGN KEY([SmartRxId])
REFERENCES [dbo].[SmartRx_Master] ([Id])
GO
ALTER TABLE [dbo].[Prescription_Upload] CHECK CONSTRAINT [FK_Prescription_Upload_SmartRx_Master_SmartRxId]
GO
ALTER TABLE [dbo].[Prescription_Upload]  WITH CHECK ADD  CONSTRAINT [FK_Prescription_Upload_SmartRx_PatientProfile_PatientId] FOREIGN KEY([PatientId])
REFERENCES [dbo].[SmartRx_PatientProfile] ([Id])
GO
ALTER TABLE [dbo].[Prescription_Upload] CHECK CONSTRAINT [FK_Prescription_Upload_SmartRx_PatientProfile_PatientId]
GO
ALTER TABLE [dbo].[Prescription_UserWiseFolder]  WITH CHECK ADD  CONSTRAINT [FK_Prescription_UserWiseFolder_Prescription_UserWiseFolder_ParentFolderId] FOREIGN KEY([ParentFolderId])
REFERENCES [dbo].[Prescription_UserWiseFolder] ([Id])
GO
ALTER TABLE [dbo].[Prescription_UserWiseFolder] CHECK CONSTRAINT [FK_Prescription_UserWiseFolder_Prescription_UserWiseFolder_ParentFolderId]
GO
ALTER TABLE [dbo].[Prescription_UserWiseFolder]  WITH CHECK ADD  CONSTRAINT [FK_Prescription_UserWiseFolder_Security_PMSUser_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Prescription_UserWiseFolder] CHECK CONSTRAINT [FK_Prescription_UserWiseFolder_Security_PMSUser_CreatedById]
GO
ALTER TABLE [dbo].[Prescription_UserWiseFolder]  WITH CHECK ADD  CONSTRAINT [FK_Prescription_UserWiseFolder_Security_PMSUser_ModifiedById] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Prescription_UserWiseFolder] CHECK CONSTRAINT [FK_Prescription_UserWiseFolder_Security_PMSUser_ModifiedById]
GO
ALTER TABLE [dbo].[Prescription_UserWiseFolder]  WITH CHECK ADD  CONSTRAINT [FK_Prescription_UserWiseFolder_Security_PMSUser_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Security_PMSUser] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Prescription_UserWiseFolder] CHECK CONSTRAINT [FK_Prescription_UserWiseFolder_Security_PMSUser_UserId]
GO
ALTER TABLE [dbo].[Security_PMSRole]  WITH CHECK ADD  CONSTRAINT [FK_Security_PMSRole_Security_PMSUser_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Security_PMSRole] CHECK CONSTRAINT [FK_Security_PMSRole_Security_PMSUser_CreatedById]
GO
ALTER TABLE [dbo].[Security_PMSRole]  WITH CHECK ADD  CONSTRAINT [FK_Security_PMSRole_Security_PMSUser_ModifiedById] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Security_PMSRole] CHECK CONSTRAINT [FK_Security_PMSRole_Security_PMSUser_ModifiedById]
GO
ALTER TABLE [dbo].[Security_PMSUser]  WITH CHECK ADD  CONSTRAINT [FK_Security_PMSUser_Security_PMSUser_SmartRxUserEntityId] FOREIGN KEY([SmartRxUserEntityId])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Security_PMSUser] CHECK CONSTRAINT [FK_Security_PMSUser_Security_PMSUser_SmartRxUserEntityId]
GO
ALTER TABLE [dbo].[Security_PMSUserWiseRole]  WITH CHECK ADD  CONSTRAINT [FK_Security_PMSUserWiseRole_Security_PMSRole_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Security_PMSRole] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Security_PMSUserWiseRole] CHECK CONSTRAINT [FK_Security_PMSUserWiseRole_Security_PMSRole_RoleId]
GO
ALTER TABLE [dbo].[Security_PMSUserWiseRole]  WITH CHECK ADD  CONSTRAINT [FK_Security_PMSUserWiseRole_Security_PMSUser_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Security_PMSUserWiseRole] CHECK CONSTRAINT [FK_Security_PMSUserWiseRole_Security_PMSUser_CreatedById]
GO
ALTER TABLE [dbo].[Security_PMSUserWiseRole]  WITH CHECK ADD  CONSTRAINT [FK_Security_PMSUserWiseRole_Security_PMSUser_ModifiedById] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Security_PMSUserWiseRole] CHECK CONSTRAINT [FK_Security_PMSUserWiseRole_Security_PMSUser_ModifiedById]
GO
ALTER TABLE [dbo].[Security_PMSUserWiseRole]  WITH CHECK ADD  CONSTRAINT [FK_Security_PMSUserWiseRole_Security_PMSUser_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Security_PMSUser] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Security_PMSUserWiseRole] CHECK CONSTRAINT [FK_Security_PMSUserWiseRole_Security_PMSUser_UserId]
GO
ALTER TABLE [dbo].[SmartRx_Master]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_Master_Prescription_Upload_PrescriptionId] FOREIGN KEY([PrescriptionId])
REFERENCES [dbo].[Prescription_Upload] ([Id])
GO
ALTER TABLE [dbo].[SmartRx_Master] CHECK CONSTRAINT [FK_SmartRx_Master_Prescription_Upload_PrescriptionId]
GO
ALTER TABLE [dbo].[SmartRx_Master]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_Master_Security_PMSUser_ApprovedById] FOREIGN KEY([ApprovedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[SmartRx_Master] CHECK CONSTRAINT [FK_SmartRx_Master_Security_PMSUser_ApprovedById]
GO
ALTER TABLE [dbo].[SmartRx_Master]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_Master_Security_PMSUser_CompletedById] FOREIGN KEY([CompletedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[SmartRx_Master] CHECK CONSTRAINT [FK_SmartRx_Master_Security_PMSUser_CompletedById]
GO
ALTER TABLE [dbo].[SmartRx_Master]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_Master_Security_PMSUser_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[SmartRx_Master] CHECK CONSTRAINT [FK_SmartRx_Master_Security_PMSUser_CreatedById]
GO
ALTER TABLE [dbo].[SmartRx_Master]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_Master_Security_PMSUser_LockedById] FOREIGN KEY([LockedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[SmartRx_Master] CHECK CONSTRAINT [FK_SmartRx_Master_Security_PMSUser_LockedById]
GO
ALTER TABLE [dbo].[SmartRx_Master]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_Master_Security_PMSUser_ModifiedById] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[SmartRx_Master] CHECK CONSTRAINT [FK_SmartRx_Master_Security_PMSUser_ModifiedById]
GO
ALTER TABLE [dbo].[SmartRx_Master]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_Master_Security_PMSUser_RecommendedById] FOREIGN KEY([RecommendedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[SmartRx_Master] CHECK CONSTRAINT [FK_SmartRx_Master_Security_PMSUser_RecommendedById]
GO
ALTER TABLE [dbo].[SmartRx_Master]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_Master_Security_PMSUser_RejectedById] FOREIGN KEY([RejectedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[SmartRx_Master] CHECK CONSTRAINT [FK_SmartRx_Master_Security_PMSUser_RejectedById]
GO
ALTER TABLE [dbo].[SmartRx_Master]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_Master_Security_PMSUser_ReportById] FOREIGN KEY([ReportById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[SmartRx_Master] CHECK CONSTRAINT [FK_SmartRx_Master_Security_PMSUser_ReportById]
GO
ALTER TABLE [dbo].[SmartRx_Master]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_Master_Security_PMSUser_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Security_PMSUser] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SmartRx_Master] CHECK CONSTRAINT [FK_SmartRx_Master_Security_PMSUser_UserId]
GO
ALTER TABLE [dbo].[SmartRx_Master]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_Master_SmartRx_PatientProfile_PatientId] FOREIGN KEY([PatientId])
REFERENCES [dbo].[SmartRx_PatientProfile] ([Id])
GO
ALTER TABLE [dbo].[SmartRx_Master] CHECK CONSTRAINT [FK_SmartRx_Master_SmartRx_PatientProfile_PatientId]
GO
ALTER TABLE [dbo].[SmartRx_PatientAdvice]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_PatientAdvice_Prescription_Upload_PrescriptionId] FOREIGN KEY([PrescriptionId])
REFERENCES [dbo].[Prescription_Upload] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SmartRx_PatientAdvice] CHECK CONSTRAINT [FK_SmartRx_PatientAdvice_Prescription_Upload_PrescriptionId]
GO
ALTER TABLE [dbo].[SmartRx_PatientAdvice]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_PatientAdvice_Security_PMSUser_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[SmartRx_PatientAdvice] CHECK CONSTRAINT [FK_SmartRx_PatientAdvice_Security_PMSUser_CreatedById]
GO
ALTER TABLE [dbo].[SmartRx_PatientAdvice]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_PatientAdvice_Security_PMSUser_ModifiedById] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[SmartRx_PatientAdvice] CHECK CONSTRAINT [FK_SmartRx_PatientAdvice_Security_PMSUser_ModifiedById]
GO
ALTER TABLE [dbo].[SmartRx_PatientAdvice]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_PatientAdvice_SmartRx_Master_SmartRxMasterId] FOREIGN KEY([SmartRxMasterId])
REFERENCES [dbo].[SmartRx_Master] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SmartRx_PatientAdvice] CHECK CONSTRAINT [FK_SmartRx_PatientAdvice_SmartRx_Master_SmartRxMasterId]
GO
ALTER TABLE [dbo].[SmartRx_PatientChiefComplaint]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_PatientChiefComplaint_Prescription_Upload_UploadedPrescriptionId] FOREIGN KEY([UploadedPrescriptionId])
REFERENCES [dbo].[Prescription_Upload] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SmartRx_PatientChiefComplaint] CHECK CONSTRAINT [FK_SmartRx_PatientChiefComplaint_Prescription_Upload_UploadedPrescriptionId]
GO
ALTER TABLE [dbo].[SmartRx_PatientChiefComplaint]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_PatientChiefComplaint_Security_PMSUser_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[SmartRx_PatientChiefComplaint] CHECK CONSTRAINT [FK_SmartRx_PatientChiefComplaint_Security_PMSUser_CreatedById]
GO
ALTER TABLE [dbo].[SmartRx_PatientChiefComplaint]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_PatientChiefComplaint_Security_PMSUser_ModifiedById] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[SmartRx_PatientChiefComplaint] CHECK CONSTRAINT [FK_SmartRx_PatientChiefComplaint_Security_PMSUser_ModifiedById]
GO
ALTER TABLE [dbo].[SmartRx_PatientChiefComplaint]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_PatientChiefComplaint_SmartRx_Master_SmartRxMasterId] FOREIGN KEY([SmartRxMasterId])
REFERENCES [dbo].[SmartRx_Master] ([Id])
GO
ALTER TABLE [dbo].[SmartRx_PatientChiefComplaint] CHECK CONSTRAINT [FK_SmartRx_PatientChiefComplaint_SmartRx_Master_SmartRxMasterId]
GO
ALTER TABLE [dbo].[SmartRx_PatientDoctor]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_PatientDoctor_Configuration_Doctor_DoctorId] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Configuration_Doctor] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SmartRx_PatientDoctor] CHECK CONSTRAINT [FK_SmartRx_PatientDoctor_Configuration_Doctor_DoctorId]
GO
ALTER TABLE [dbo].[SmartRx_PatientDoctor]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_PatientDoctor_Configuration_Unit_ChamberFeeMeasurementUnitId] FOREIGN KEY([ChamberFeeMeasurementUnitId])
REFERENCES [dbo].[Configuration_Unit] ([Id])
GO
ALTER TABLE [dbo].[SmartRx_PatientDoctor] CHECK CONSTRAINT [FK_SmartRx_PatientDoctor_Configuration_Unit_ChamberFeeMeasurementUnitId]
GO
ALTER TABLE [dbo].[SmartRx_PatientDoctor]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_PatientDoctor_Prescription_Upload_PrescriptionId] FOREIGN KEY([PrescriptionId])
REFERENCES [dbo].[Prescription_Upload] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SmartRx_PatientDoctor] CHECK CONSTRAINT [FK_SmartRx_PatientDoctor_Prescription_Upload_PrescriptionId]
GO
ALTER TABLE [dbo].[SmartRx_PatientDoctor]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_PatientDoctor_Security_PMSUser_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[SmartRx_PatientDoctor] CHECK CONSTRAINT [FK_SmartRx_PatientDoctor_Security_PMSUser_CreatedById]
GO
ALTER TABLE [dbo].[SmartRx_PatientDoctor]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_PatientDoctor_Security_PMSUser_ModifiedById] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[SmartRx_PatientDoctor] CHECK CONSTRAINT [FK_SmartRx_PatientDoctor_Security_PMSUser_ModifiedById]
GO
ALTER TABLE [dbo].[SmartRx_PatientDoctor]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_PatientDoctor_SmartRx_Master_SmartRxMasterId] FOREIGN KEY([SmartRxMasterId])
REFERENCES [dbo].[SmartRx_Master] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SmartRx_PatientDoctor] CHECK CONSTRAINT [FK_SmartRx_PatientDoctor_SmartRx_Master_SmartRxMasterId]
GO
ALTER TABLE [dbo].[SmartRx_PatientHistory]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_PatientHistory_Prescription_Upload_PrescriptionId] FOREIGN KEY([PrescriptionId])
REFERENCES [dbo].[Prescription_Upload] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SmartRx_PatientHistory] CHECK CONSTRAINT [FK_SmartRx_PatientHistory_Prescription_Upload_PrescriptionId]
GO
ALTER TABLE [dbo].[SmartRx_PatientHistory]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_PatientHistory_Security_PMSUser_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[SmartRx_PatientHistory] CHECK CONSTRAINT [FK_SmartRx_PatientHistory_Security_PMSUser_CreatedById]
GO
ALTER TABLE [dbo].[SmartRx_PatientHistory]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_PatientHistory_Security_PMSUser_ModifiedById] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[SmartRx_PatientHistory] CHECK CONSTRAINT [FK_SmartRx_PatientHistory_Security_PMSUser_ModifiedById]
GO
ALTER TABLE [dbo].[SmartRx_PatientHistory]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_PatientHistory_SmartRx_Master_SmartRxMasterId] FOREIGN KEY([SmartRxMasterId])
REFERENCES [dbo].[SmartRx_Master] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SmartRx_PatientHistory] CHECK CONSTRAINT [FK_SmartRx_PatientHistory_SmartRx_Master_SmartRxMasterId]
GO
ALTER TABLE [dbo].[SmartRx_PatientInvestigation]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_PatientInvestigation_Configuration_DiagnosisCenterWiseTest_DiagnosticCenterWiseTestId] FOREIGN KEY([DiagnosticCenterWiseTestId])
REFERENCES [dbo].[Configuration_DiagnosisCenterWiseTest] ([Id])
GO
ALTER TABLE [dbo].[SmartRx_PatientInvestigation] CHECK CONSTRAINT [FK_SmartRx_PatientInvestigation_Configuration_DiagnosisCenterWiseTest_DiagnosticCenterWiseTestId]
GO
ALTER TABLE [dbo].[SmartRx_PatientInvestigation]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_PatientInvestigation_Configuration_Investigation_TestId] FOREIGN KEY([TestId])
REFERENCES [dbo].[Configuration_Investigation] ([Id])
GO
ALTER TABLE [dbo].[SmartRx_PatientInvestigation] CHECK CONSTRAINT [FK_SmartRx_PatientInvestigation_Configuration_Investigation_TestId]
GO
ALTER TABLE [dbo].[SmartRx_PatientInvestigation]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_PatientInvestigation_Configuration_Unit_PriceUnitId] FOREIGN KEY([PriceUnitId])
REFERENCES [dbo].[Configuration_Unit] ([Id])
GO
ALTER TABLE [dbo].[SmartRx_PatientInvestigation] CHECK CONSTRAINT [FK_SmartRx_PatientInvestigation_Configuration_Unit_PriceUnitId]
GO
ALTER TABLE [dbo].[SmartRx_PatientInvestigation]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_PatientInvestigation_Prescription_Upload_PrescriptionId] FOREIGN KEY([PrescriptionId])
REFERENCES [dbo].[Prescription_Upload] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SmartRx_PatientInvestigation] CHECK CONSTRAINT [FK_SmartRx_PatientInvestigation_Prescription_Upload_PrescriptionId]
GO
ALTER TABLE [dbo].[SmartRx_PatientInvestigation]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_PatientInvestigation_Security_PMSUser_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[SmartRx_PatientInvestigation] CHECK CONSTRAINT [FK_SmartRx_PatientInvestigation_Security_PMSUser_CreatedById]
GO
ALTER TABLE [dbo].[SmartRx_PatientInvestigation]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_PatientInvestigation_Security_PMSUser_ModifiedById] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[SmartRx_PatientInvestigation] CHECK CONSTRAINT [FK_SmartRx_PatientInvestigation_Security_PMSUser_ModifiedById]
GO
ALTER TABLE [dbo].[SmartRx_PatientInvestigation]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_PatientInvestigation_SmartRx_Master_SmartRxMasterId] FOREIGN KEY([SmartRxMasterId])
REFERENCES [dbo].[SmartRx_Master] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SmartRx_PatientInvestigation] CHECK CONSTRAINT [FK_SmartRx_PatientInvestigation_SmartRx_Master_SmartRxMasterId]
GO
ALTER TABLE [dbo].[SmartRx_PatientMedicine]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_PatientMedicine_Configuration_Medicine_MedicineId] FOREIGN KEY([MedicineId])
REFERENCES [dbo].[Configuration_Medicine] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SmartRx_PatientMedicine] CHECK CONSTRAINT [FK_SmartRx_PatientMedicine_Configuration_Medicine_MedicineId]
GO
ALTER TABLE [dbo].[SmartRx_PatientMedicine]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_PatientMedicine_Prescription_Upload_PrescriptionId] FOREIGN KEY([PrescriptionId])
REFERENCES [dbo].[Prescription_Upload] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SmartRx_PatientMedicine] CHECK CONSTRAINT [FK_SmartRx_PatientMedicine_Prescription_Upload_PrescriptionId]
GO
ALTER TABLE [dbo].[SmartRx_PatientMedicine]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_PatientMedicine_Security_PMSUser_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[SmartRx_PatientMedicine] CHECK CONSTRAINT [FK_SmartRx_PatientMedicine_Security_PMSUser_CreatedById]
GO
ALTER TABLE [dbo].[SmartRx_PatientMedicine]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_PatientMedicine_Security_PMSUser_ModifiedById] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[SmartRx_PatientMedicine] CHECK CONSTRAINT [FK_SmartRx_PatientMedicine_Security_PMSUser_ModifiedById]
GO
ALTER TABLE [dbo].[SmartRx_PatientMedicine]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_PatientMedicine_SmartRx_Master_SmartRxMasterId] FOREIGN KEY([SmartRxMasterId])
REFERENCES [dbo].[SmartRx_Master] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SmartRx_PatientMedicine] CHECK CONSTRAINT [FK_SmartRx_PatientMedicine_SmartRx_Master_SmartRxMasterId]
GO
ALTER TABLE [dbo].[SmartRx_PatientOtherExpense]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_PatientOtherExpense_Configuration_Unit_CurrencyUnitId] FOREIGN KEY([CurrencyUnitId])
REFERENCES [dbo].[Configuration_Unit] ([Id])
GO
ALTER TABLE [dbo].[SmartRx_PatientOtherExpense] CHECK CONSTRAINT [FK_SmartRx_PatientOtherExpense_Configuration_Unit_CurrencyUnitId]
GO
ALTER TABLE [dbo].[SmartRx_PatientOtherExpense]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_PatientOtherExpense_Prescription_Upload_PrescriptionId] FOREIGN KEY([PrescriptionId])
REFERENCES [dbo].[Prescription_Upload] ([Id])
GO
ALTER TABLE [dbo].[SmartRx_PatientOtherExpense] CHECK CONSTRAINT [FK_SmartRx_PatientOtherExpense_Prescription_Upload_PrescriptionId]
GO
ALTER TABLE [dbo].[SmartRx_PatientOtherExpense]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_PatientOtherExpense_Security_PMSUser_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[SmartRx_PatientOtherExpense] CHECK CONSTRAINT [FK_SmartRx_PatientOtherExpense_Security_PMSUser_CreatedById]
GO
ALTER TABLE [dbo].[SmartRx_PatientOtherExpense]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_PatientOtherExpense_Security_PMSUser_ModifiedById] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[SmartRx_PatientOtherExpense] CHECK CONSTRAINT [FK_SmartRx_PatientOtherExpense_Security_PMSUser_ModifiedById]
GO
ALTER TABLE [dbo].[SmartRx_PatientOtherExpense]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_PatientOtherExpense_SmartRx_Master_SmartRxMasterId] FOREIGN KEY([SmartRxMasterId])
REFERENCES [dbo].[SmartRx_Master] ([Id])
GO
ALTER TABLE [dbo].[SmartRx_PatientOtherExpense] CHECK CONSTRAINT [FK_SmartRx_PatientOtherExpense_SmartRx_Master_SmartRxMasterId]
GO
ALTER TABLE [dbo].[SmartRx_PatientProfile]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_PatientProfile_Configuration_City_CityId] FOREIGN KEY([CityId])
REFERENCES [dbo].[Configuration_City] ([Id])
GO
ALTER TABLE [dbo].[SmartRx_PatientProfile] CHECK CONSTRAINT [FK_SmartRx_PatientProfile_Configuration_City_CityId]
GO
ALTER TABLE [dbo].[SmartRx_PatientProfile]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_PatientProfile_Configuration_PoliceStation_PoliceStationId] FOREIGN KEY([PoliceStationId])
REFERENCES [dbo].[Configuration_PoliceStation] ([Id])
GO
ALTER TABLE [dbo].[SmartRx_PatientProfile] CHECK CONSTRAINT [FK_SmartRx_PatientProfile_Configuration_PoliceStation_PoliceStationId]
GO
ALTER TABLE [dbo].[SmartRx_PatientProfile]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_PatientProfile_Configuration_Unit_HeightMeasurementUnitId] FOREIGN KEY([HeightMeasurementUnitId])
REFERENCES [dbo].[Configuration_Unit] ([Id])
GO
ALTER TABLE [dbo].[SmartRx_PatientProfile] CHECK CONSTRAINT [FK_SmartRx_PatientProfile_Configuration_Unit_HeightMeasurementUnitId]
GO
ALTER TABLE [dbo].[SmartRx_PatientProfile]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_PatientProfile_Configuration_Unit_WeightMeasurementUnitId] FOREIGN KEY([WeightMeasurementUnitId])
REFERENCES [dbo].[Configuration_Unit] ([Id])
GO
ALTER TABLE [dbo].[SmartRx_PatientProfile] CHECK CONSTRAINT [FK_SmartRx_PatientProfile_Configuration_Unit_WeightMeasurementUnitId]
GO
ALTER TABLE [dbo].[SmartRx_PatientProfile]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_PatientProfile_Security_PMSUser_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[SmartRx_PatientProfile] CHECK CONSTRAINT [FK_SmartRx_PatientProfile_Security_PMSUser_CreatedById]
GO
ALTER TABLE [dbo].[SmartRx_PatientProfile]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_PatientProfile_Security_PMSUser_ModifiedById] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[SmartRx_PatientProfile] CHECK CONSTRAINT [FK_SmartRx_PatientProfile_Security_PMSUser_ModifiedById]
GO
ALTER TABLE [dbo].[SmartRx_PatientProfile]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_PatientProfile_Security_PMSUser_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Security_PMSUser] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SmartRx_PatientProfile] CHECK CONSTRAINT [FK_SmartRx_PatientProfile_Security_PMSUser_UserId]
GO
ALTER TABLE [dbo].[SmartRx_PatientProfile]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_PatientProfile_SmartRx_PatientProfile_RelatedToPatientId] FOREIGN KEY([RelatedToPatientId])
REFERENCES [dbo].[SmartRx_PatientProfile] ([Id])
GO
ALTER TABLE [dbo].[SmartRx_PatientProfile] CHECK CONSTRAINT [FK_SmartRx_PatientProfile_SmartRx_PatientProfile_RelatedToPatientId]
GO
ALTER TABLE [dbo].[SmartRx_PatientRelatives]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_PatientRelatives_Security_PMSUser_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[SmartRx_PatientRelatives] CHECK CONSTRAINT [FK_SmartRx_PatientRelatives_Security_PMSUser_CreatedById]
GO
ALTER TABLE [dbo].[SmartRx_PatientRelatives]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_PatientRelatives_Security_PMSUser_ModifiedById] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[SmartRx_PatientRelatives] CHECK CONSTRAINT [FK_SmartRx_PatientRelatives_Security_PMSUser_ModifiedById]
GO
ALTER TABLE [dbo].[SmartRx_PatientRelatives]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_PatientRelatives_SmartRx_Master_SmartRx_MasterId] FOREIGN KEY([SmartRx_MasterId])
REFERENCES [dbo].[SmartRx_Master] ([Id])
GO
ALTER TABLE [dbo].[SmartRx_PatientRelatives] CHECK CONSTRAINT [FK_SmartRx_PatientRelatives_SmartRx_Master_SmartRx_MasterId]
GO
ALTER TABLE [dbo].[SmartRx_PatientRelatives]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_PatientRelatives_SmartRx_PatientProfile_PatientId] FOREIGN KEY([PatientId])
REFERENCES [dbo].[SmartRx_PatientProfile] ([Id])
GO
ALTER TABLE [dbo].[SmartRx_PatientRelatives] CHECK CONSTRAINT [FK_SmartRx_PatientRelatives_SmartRx_PatientProfile_PatientId]
GO
ALTER TABLE [dbo].[SmartRx_PatientRelatives]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_PatientRelatives_SmartRx_PatientProfile_PatientRelativeId] FOREIGN KEY([PatientRelativeId])
REFERENCES [dbo].[SmartRx_PatientProfile] ([Id])
GO
ALTER TABLE [dbo].[SmartRx_PatientRelatives] CHECK CONSTRAINT [FK_SmartRx_PatientRelatives_SmartRx_PatientProfile_PatientRelativeId]
GO
ALTER TABLE [dbo].[Smartrx_PatientReward]  WITH CHECK ADD  CONSTRAINT [FK_Smartrx_PatientReward_Configuration_RewardBadge_BadgeId] FOREIGN KEY([BadgeId])
REFERENCES [dbo].[Configuration_RewardBadge] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Smartrx_PatientReward] CHECK CONSTRAINT [FK_Smartrx_PatientReward_Configuration_RewardBadge_BadgeId]
GO
ALTER TABLE [dbo].[Smartrx_PatientReward]  WITH CHECK ADD  CONSTRAINT [FK_Smartrx_PatientReward_Prescription_Upload_PrescriptionId] FOREIGN KEY([PrescriptionId])
REFERENCES [dbo].[Prescription_Upload] ([Id])
GO
ALTER TABLE [dbo].[Smartrx_PatientReward] CHECK CONSTRAINT [FK_Smartrx_PatientReward_Prescription_Upload_PrescriptionId]
GO
ALTER TABLE [dbo].[Smartrx_PatientReward]  WITH CHECK ADD  CONSTRAINT [FK_Smartrx_PatientReward_Security_PMSUser_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Smartrx_PatientReward] CHECK CONSTRAINT [FK_Smartrx_PatientReward_Security_PMSUser_CreatedById]
GO
ALTER TABLE [dbo].[Smartrx_PatientReward]  WITH CHECK ADD  CONSTRAINT [FK_Smartrx_PatientReward_Security_PMSUser_ModifiedById] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[Smartrx_PatientReward] CHECK CONSTRAINT [FK_Smartrx_PatientReward_Security_PMSUser_ModifiedById]
GO
ALTER TABLE [dbo].[Smartrx_PatientReward]  WITH CHECK ADD  CONSTRAINT [FK_Smartrx_PatientReward_SmartRx_Master_SmartRxMasterId] FOREIGN KEY([SmartRxMasterId])
REFERENCES [dbo].[SmartRx_Master] ([Id])
GO
ALTER TABLE [dbo].[Smartrx_PatientReward] CHECK CONSTRAINT [FK_Smartrx_PatientReward_SmartRx_Master_SmartRxMasterId]
GO
ALTER TABLE [dbo].[Smartrx_PatientReward]  WITH CHECK ADD  CONSTRAINT [FK_Smartrx_PatientReward_SmartRx_PatientProfile_PatientId] FOREIGN KEY([PatientId])
REFERENCES [dbo].[SmartRx_PatientProfile] ([Id])
GO
ALTER TABLE [dbo].[Smartrx_PatientReward] CHECK CONSTRAINT [FK_Smartrx_PatientReward_SmartRx_PatientProfile_PatientId]
GO
ALTER TABLE [dbo].[SmartRx_PatientVitals]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_PatientVitals_Configuration_Vital_VitalId] FOREIGN KEY([VitalId])
REFERENCES [dbo].[Configuration_Vital] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SmartRx_PatientVitals] CHECK CONSTRAINT [FK_SmartRx_PatientVitals_Configuration_Vital_VitalId]
GO
ALTER TABLE [dbo].[SmartRx_PatientVitals]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_PatientVitals_Prescription_Upload_PrescriptionId] FOREIGN KEY([PrescriptionId])
REFERENCES [dbo].[Prescription_Upload] ([Id])
GO
ALTER TABLE [dbo].[SmartRx_PatientVitals] CHECK CONSTRAINT [FK_SmartRx_PatientVitals_Prescription_Upload_PrescriptionId]
GO
ALTER TABLE [dbo].[SmartRx_PatientVitals]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_PatientVitals_Security_PMSUser_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[SmartRx_PatientVitals] CHECK CONSTRAINT [FK_SmartRx_PatientVitals_Security_PMSUser_CreatedById]
GO
ALTER TABLE [dbo].[SmartRx_PatientVitals]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_PatientVitals_Security_PMSUser_ModifiedById] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[SmartRx_PatientVitals] CHECK CONSTRAINT [FK_SmartRx_PatientVitals_Security_PMSUser_ModifiedById]
GO
ALTER TABLE [dbo].[SmartRx_PatientWishlist]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_PatientWishlist_Configuration_Hospital_PatientRecommendedTestCenterId] FOREIGN KEY([PatientRecommendedTestCenterId])
REFERENCES [dbo].[Configuration_Hospital] ([Id])
GO
ALTER TABLE [dbo].[SmartRx_PatientWishlist] CHECK CONSTRAINT [FK_SmartRx_PatientWishlist_Configuration_Hospital_PatientRecommendedTestCenterId]
GO
ALTER TABLE [dbo].[SmartRx_PatientWishlist]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_PatientWishlist_Configuration_Investigation_PatientTestId] FOREIGN KEY([PatientTestId])
REFERENCES [dbo].[Configuration_Investigation] ([Id])
GO
ALTER TABLE [dbo].[SmartRx_PatientWishlist] CHECK CONSTRAINT [FK_SmartRx_PatientWishlist_Configuration_Investigation_PatientTestId]
GO
ALTER TABLE [dbo].[SmartRx_PatientWishlist]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_PatientWishlist_Configuration_Medicine_PatientWishListMedicineId] FOREIGN KEY([PatientWishlistMedicineId])
REFERENCES [dbo].[Configuration_Medicine] ([Id])
GO
ALTER TABLE [dbo].[SmartRx_PatientWishlist] CHECK CONSTRAINT [FK_SmartRx_PatientWishlist_Configuration_Medicine_PatientWishListMedicineId]
GO
ALTER TABLE [dbo].[SmartRx_PatientWishlist]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_PatientWishlist_Prescription_Upload_PrescriptionId] FOREIGN KEY([PrescriptionId])
REFERENCES [dbo].[Prescription_Upload] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SmartRx_PatientWishlist] CHECK CONSTRAINT [FK_SmartRx_PatientWishlist_Prescription_Upload_PrescriptionId]
GO
ALTER TABLE [dbo].[SmartRx_PatientWishlist]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_PatientWishlist_Security_PMSUser_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[SmartRx_PatientWishlist] CHECK CONSTRAINT [FK_SmartRx_PatientWishlist_Security_PMSUser_CreatedById]
GO
ALTER TABLE [dbo].[SmartRx_PatientWishlist]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_PatientWishlist_Security_PMSUser_ModifiedById] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[SmartRx_PatientWishlist] CHECK CONSTRAINT [FK_SmartRx_PatientWishlist_Security_PMSUser_ModifiedById]
GO
ALTER TABLE [dbo].[SmartRx_PatientWishlist]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_PatientWishlist_SmartRx_Master_SmartRxMasterId] FOREIGN KEY([SmartRxMasterId])
REFERENCES [dbo].[SmartRx_Master] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SmartRx_PatientWishlist] CHECK CONSTRAINT [FK_SmartRx_PatientWishlist_SmartRx_Master_SmartRxMasterId]
GO
ALTER TABLE [dbo].[SmartRx_ReferredConsultant]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_ReferredConsultant_Security_PMSUser_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[SmartRx_ReferredConsultant] CHECK CONSTRAINT [FK_SmartRx_ReferredConsultant_Security_PMSUser_CreatedById]
GO
ALTER TABLE [dbo].[SmartRx_ReferredConsultant]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_ReferredConsultant_Security_PMSUser_ModifiedById] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[Security_PMSUser] ([Id])
GO
ALTER TABLE [dbo].[SmartRx_ReferredConsultant] CHECK CONSTRAINT [FK_SmartRx_ReferredConsultant_Security_PMSUser_ModifiedById]
GO
ALTER TABLE [dbo].[SmartRx_ReferredConsultant]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_ReferredConsultant_SmartRx_Master_SmartRxMasterId] FOREIGN KEY([SmartRxMasterId])
REFERENCES [dbo].[SmartRx_Master] ([Id])
GO
ALTER TABLE [dbo].[SmartRx_ReferredConsultant] CHECK CONSTRAINT [FK_SmartRx_ReferredConsultant_SmartRx_Master_SmartRxMasterId]
GO
ALTER TABLE [dbo].[SmartRx_ReferredConsultant]  WITH CHECK ADD  CONSTRAINT [FK_SmartRx_ReferredConsultant_SmartRx_PatientDoctor_ReferredConsultantId] FOREIGN KEY([ReferredConsultantId])
REFERENCES [dbo].[SmartRx_PatientDoctor] ([Id])
GO
ALTER TABLE [dbo].[SmartRx_ReferredConsultant] CHECK CONSTRAINT [FK_SmartRx_ReferredConsultant_SmartRx_PatientDoctor_ReferredConsultantId]
GO
USE [master]
GO
ALTER DATABASE [SmartRxDB3] SET  READ_WRITE 
GO
