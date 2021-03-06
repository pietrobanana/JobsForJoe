IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OpenPositions_Positions]') AND parent_object_id = OBJECT_ID(N'[dbo].[OpenPositions]'))
ALTER TABLE [dbo].[OpenPositions] DROP CONSTRAINT [FK_OpenPositions_Positions]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OpenPositions_Locations]') AND parent_object_id = OBJECT_ID(N'[dbo].[OpenPositions]'))
ALTER TABLE [dbo].[OpenPositions] DROP CONSTRAINT [FK_OpenPositions_Locations]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Applications_OpenPositions]') AND parent_object_id = OBJECT_ID(N'[dbo].[Applications]'))
ALTER TABLE [dbo].[Applications] DROP CONSTRAINT [FK_Applications_OpenPositions]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 3/27/2019 8:52:36 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserDetails]') AND type in (N'U'))
DROP TABLE [dbo].[UserDetails]
GO
/****** Object:  Table [dbo].[Positions]    Script Date: 3/27/2019 8:52:36 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Positions]') AND type in (N'U'))
DROP TABLE [dbo].[Positions]
GO
/****** Object:  Table [dbo].[OpenPositions]    Script Date: 3/27/2019 8:52:36 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OpenPositions]') AND type in (N'U'))
DROP TABLE [dbo].[OpenPositions]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 3/27/2019 8:52:36 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Locations]') AND type in (N'U'))
DROP TABLE [dbo].[Locations]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 3/27/2019 8:52:36 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 3/27/2019 8:52:36 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 3/27/2019 8:52:36 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 3/27/2019 8:52:36 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 3/27/2019 8:52:36 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[Applications]    Script Date: 3/27/2019 8:52:36 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Applications]') AND type in (N'U'))
DROP TABLE [dbo].[Applications]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 3/27/2019 8:52:36 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
DROP TABLE [dbo].[__MigrationHistory]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 3/27/2019 8:52:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Applications]    Script Date: 3/27/2019 8:52:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Applications]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Applications](
	[ApplicationsID] [int] IDENTITY(1,1) NOT NULL,
	[OpenPositionID] [int] NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[ApplicationDate] [date] NOT NULL,
	[ManagerNotes] [varchar](2000) NULL,
	[IsDeclined] [bit] NOT NULL,
	[ResumeFilename] [varchar](75) NULL,
 CONSTRAINT [PK_Applications] PRIMARY KEY CLUSTERED 
(
	[ApplicationsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 3/27/2019 8:52:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 3/27/2019 8:52:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 3/27/2019 8:52:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 3/27/2019 8:52:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 3/27/2019 8:52:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 3/27/2019 8:52:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Locations]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Locations](
	[LocationID] [int] IDENTITY(1,1) NOT NULL,
	[StoreName] [varchar](50) NOT NULL,
	[StoreNumber] [varchar](10) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[State] [char](2) NOT NULL,
	[ManagerID] [nvarchar](128) NOT NULL,
	[StoreImage] [varchar](100) NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OpenPositions]    Script Date: 3/27/2019 8:52:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OpenPositions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OpenPositions](
	[OpenPositionID] [int] IDENTITY(1,1) NOT NULL,
	[PositionID] [int] NOT NULL,
	[LocationID] [int] NOT NULL,
 CONSTRAINT [PK_OpenPositions] PRIMARY KEY CLUSTERED 
(
	[OpenPositionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Positions]    Script Date: 3/27/2019 8:52:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Positions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Positions](
	[PositionID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[JobDescription] [varchar](max) NULL,
 CONSTRAINT [PK_Positions] PRIMARY KEY CLUSTERED 
(
	[PositionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 3/27/2019 8:52:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserDetails](
	[UserID] [nvarchar](128) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[ResumeFileName] [varchar](75) NULL,
	[BaristaImage] [varchar](100) NULL,
	[IsEmployed] [bit] NOT NULL,
	[Bio] [varchar](max) NULL,
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201903181816362_InitialCreate', N'JobsForJoe.UI.MVC.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5C5B6FE3B6127E3F40FF83A0A7F6206BE5D25DEC09EC2D52276ED36E2E58278BBE2D68897684954855A2D204457F591FCE4F3A7FE10C75172FBAD88AED140B2C2272F8CD70382487C3A1FFF7F77FC73F3CF99EF188C3C8A564621E8D0E4D03139B3A2E594DCC982DDFBC377FF8F0CDBFC6178EFF647CCEE94E381DB424D1C47C602C38B5ACC87EC03E8A46BE6B8734A24B36B2A96F21875AC78787FFB18E8E2C0C10266019C6F8534C98EBE3E4033EA794D8386031F2AEA883BD282B879A79826A5C231F4701B2F1C4FC852EA2190D7FA178747F39BAFA3C1DA56D4CE3CC7311C833C7DED2341021942106D29EDE4778CE424A56F3000A9077F71C60A05B222FC2592F4E4BF2AE1D3A3CE61DB2CA8639941D478CFA3D018F4E320D5962F3B5F46C161A041D5E80AED933EF75A2C78979E9E0A4E813F5400122C3D3A91772E2897955B0388B826BCC4679C3510A390B01EE0F1A7E1D55110F8CCEED0E0A8B3A1E1DF27F07C634F6581CE209C1310B917760DCC60BCFB57FC5CF77F42B269393A3C5F2E4FDDB77C83979F73D3E795BED29F415E86A0550741BD20087201B5E16FD370DABDECE121B16CD2A6D52AD802DC1E4308D2BF4F41193157B806973FCDE3466EE1376F292CCB8EE890B73091AB13086CFEBD8F3D0C2C345BDD5C893FFDFC0F5F8EDBB41B85EA34777950CBDC01F264E08F3EA13F692DAE8C10DD2E9551BEF2F19D92CA43EFFAEDB575AFB654EE3D0E69DA15A923B14AE30AB4B37B64AE3ED64D21C6A78B3CE51F7DFB4B9A4B2792B497987D69909398B6DCF865CDE97E5DBD9E2CE8200062F312DAE912683D36D592301E3C090284B333AEA6A4604BAF74F5E152F7CE47A032C8B1DB8805FB274431F17BDFC91821122D25BE65B1445B02A383FA3E8A14174F87300D1E7D88E4330D639437EF0E2DC6E1F28C1D7B1BFE073607BBC061B9ABB3FE80CD98C861784B7DA18EF23B5BFD2985D10E71C317CCFEC1C907FDEB97E778041C439B36D1C45333066EC4C29B8DD39E0256127C7BDE1F832B56BB764EA21D757FB25C282FA25272D7D133585E49F68C8543E4A93A81FE9CA25DD44CD49F5A2A614ADA266647D45E560DD24CD28F5822604AD72A65483797DC9080DEFF625B0FBEFF76DB679EBD6828A1AE7B042E29F30C1212C63CE2D620C87A41C812EEBC62E9C8564F838D317DF9B124E9F91170FCD6AADD9902C02C3CF860476FF67432226143FBA0EF74A3A1C86726280EF44AF3E67B5CF3941B26D4F875A37B7CD7C3B6B806EBA9C4511B5DD641628C2605910A32E3FF870467B4423ED8D1815818E81A1BB7CCB8312E89B291AD50D39C71E66D838B3D330E114453672643542879C1E82E53BAA42B0323A5217EEDF124FB0741CF246881F822298A92E61F2B47089ED06C86BD592D0B2E316C6FB5EF0106BCE71800967D8AA892ECCD5C1102E40C1471894360D8DAD8AC5351BA2C66BD58D799B0B5B8EBB14A3D88A4DB6F8CE1ABBCCFCB71731CC668D6DC1389B55D245006D606F17069A9D55BA1A807870D93703154E4C1A03CD5CAAAD18685D633B30D0BA4A5E9D81A647D4AEE32F9C57F7CD3CEB07E5ED6FEB8DEADA816DD6F4B167A699FA9ED086410B1CCAE679BEE095F889290E672067763E8B32575734110E3EC7AC1EB229FD5DA51F6A35838846D404581A5A0B68762528014913AA8770792CAF51BACC8BE8019BC7DD1A61B3B55F80ADD8808C5DBD1AAD10EA2F5045E3EC74FA287A56588364E49D0E0B151C8541888B57BDE31D94A28BCBCA8AE9E20BF7F1862B1DCB06A341412D9EAB4649796706D7526E9AED5A5239647D5CB28DB424B84F1A2DE59D195C4B998DB62B49E114F4700B3652517D0B1F68B2E5918E62B729EAC6569A3795158C2D4D82D5F80A05814B569584ABACC498A7D956D337F3FE09487E8A61D991220FA990B6E0C468885658A805D620E9CC0D23768E185A201EE7993ABE44A6DC5B35CB7FCEB2BA7DCA8398EF033935FF3B6DA1BDC8AFEDB8B24B9221CDA09F3EF76B9260BAC20AD4CD0D9E06873C142AE2F753EAC53ED1BB59FAD6E92D5EB57D5A22238C2D417EC98D92742639BBF501E8343CF2D41874A80A5F66FDE1D243E8949E7BA255B5EBBC533D4A1EACAAA2E802583B1B3E9D53B3C690895E63FF116B4578993996A5AA5401B2A29E18956C0709AC52D71DB59E9052C5ACD7744714B24EAA9042550F29ABB9253521AB156BE16934AAA6E8CE41CE26A9A2CBB5DD91157925556845F51AD80A99C5BAEEA88AD4932AB0A2BA3B769987222EA57BBC8B69CF321B6E63E9A177B37D4C83F132EBE230DB60E56EBF0A5429EE8995DDDE4B6059F95EDA94F6E4B7A14DA5118FCD6C4A83A15F856A77E3F545A8F1425F8F59BBF0AE2DF44D17FE7ABC7E96FBA2F6211DFF4492827B710C148E7BE3ECE8D5FEE8463A8BA524A691AB1136F9E788617FC40946F3DFBDA9E762BEA4E7045788B84B1CB134C9C33C3E3C3A165EECECCFEB192B8A1C4F7174D53DA1A98FD916F2B5C8230AED0714CAD9131BBC302941A5C0F42571F0D3C4FC3369759AC438F85F49F1817119DD13F7F7182AEEC2181B7FC9D9A0C364DC371FBBF6F47D4477AD5EFEF6256D7A60DC8430634E8D434197EB8C70FDD5442F69D2A61B48B3F65B8AD73BA16A8F1394A8C28458FF2DC2C26583BC43C8A5FCD6474FDFF5154DF9D6602344C57B82A1F00651A1EEBDC03A58DAB7020E7CB2E4AD40BFCEAADF0EAC239AF6DD804BFA8389AF06BA2F4379CB1D6E358A93D13696A444CFAD59D71BA560EE7A6F9292B3379AE87202760FB80D92ACD7B08C57969F3CD8EEA8483F1E0C7B97A6FDE239C7FB92665C2680EC36BB789B09C50D1745FFA83CE23DC87C5364F2EC3E5B78DBB6A68BE6EE79CA65BF9CE03D33B62CBF6BF799BFDB36365D9877CF8DAD577EEF9ED9DAAEF6CF1D5B5AE72D74E7D9BA72E291E65646150B6ECBC64D03E770C25F503082D4A34C1F51AAD3BF9A52575B1896247AA6FABC3391B1347124BE124533DB7E7DCD36FCC6CE6634CD6C35D99A4DBCB3F5BF917746D3CC5B9303B98B3C626516A22AB7BB651D6B4A8B7A4D79C3B59EB4A4A9B7F9AC8D57ECAF294D7810A5D4668FE68EF8F564050FA29221A74E8F2C60F9BA17F6CECA2F31C2FE1DB9AB1282FF2E23C1766DD72C682EC992E69BB720514E224468AE30430E6CA967217397C86650CD63CCC92BF0246EC76F3A16D8B92437310B62065DC6FEC2AB05BCB813D0C43F4975AECB3CBE09921F3419A20B20A6CB63F337E4C7D8F59C42EE992226A481E0DE4516D1E563C9786477F55C205D53D21128535FE114DD613FF0002CBA2173F488D7910DCCEF235E21FBB98C00EA40DA07A2AEF6F1B98B5621F2A30CA36C0F9F60C38EFFF4E1FF9CAEC23790540000, N'6.1.3-40302')
SET IDENTITY_INSERT [dbo].[Applications] ON 

INSERT [dbo].[Applications] ([ApplicationsID], [OpenPositionID], [UserID], [ApplicationDate], [ManagerNotes], [IsDeclined], [ResumeFilename]) VALUES (2, 2, N'0e55f66e-ff43-4923-9070-59f919001fa0', CAST(0x00000000 AS Date), NULL, 0, NULL)
INSERT [dbo].[Applications] ([ApplicationsID], [OpenPositionID], [UserID], [ApplicationDate], [ManagerNotes], [IsDeclined], [ResumeFilename]) VALUES (1005, 9, N'7074f4a7-2868-416f-bb41-803da115fb2b', CAST(0x773F0B00 AS Date), NULL, 0, N'Barista-Resume.pdf')
SET IDENTITY_INSERT [dbo].[Applications] OFF
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'5d4d40e9-5118-4817-bc31-c1c1605ecbde', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'e9d3b73f-4152-4f31-a6da-81b9baa475bb', N'Employee')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'52135fa2-3c96-4562-af11-5c4742af7d1a', N'Store Manager')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0e55f66e-ff43-4923-9070-59f919001fa0', N'52135fa2-3c96-4562-af11-5c4742af7d1a')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'5f174b24-0afb-4190-8532-edfa4f231849', N'52135fa2-3c96-4562-af11-5c4742af7d1a')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'41aba84f-3f5f-41eb-8c00-c7ca495707f7', N'5d4d40e9-5118-4817-bc31-c1c1605ecbde')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'7074f4a7-2868-416f-bb41-803da115fb2b', N'e9d3b73f-4152-4f31-a6da-81b9baa475bb')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'0e55f66e-ff43-4923-9070-59f919001fa0', N'mr@email.com', 0, N'AIZWAXAPMiKmoOmjwnhx6412nGQsFGdaQa0PPzA9fOHiizRAG+2gNWuHwg7xyQxrTw==', N'6fd1e87f-1775-4fd8-95e9-65497031076a', NULL, 0, 0, NULL, 1, 0, N'mr@email.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'41aba84f-3f5f-41eb-8c00-c7ca495707f7', N'pietro@email.com', 0, N'AHoQ9jjZKmP59N9/NmW4X6R5szBcdzoUmZsTxdC2yzCfsKCTW9TcovkRMfz9DqJfNg==', N'457147bd-7da2-40a1-964b-c2915053e20c', NULL, 0, 0, NULL, 1, 0, N'pietro@email.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'5f174b24-0afb-4190-8532-edfa4f231849', N'kr@email.com', 0, N'AA+/OKN6rvQPRyAus8krZpj6N5uAhv7JN+V5tXxzKpoesAqVpq+CpBaiCsPHJIwFGw==', N'6121d7b6-8017-4c12-a46e-21e158e49b3f', NULL, 0, 0, NULL, 1, 0, N'kr@email.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'7074f4a7-2868-416f-bb41-803da115fb2b', N'ac@email.com', 0, N'ABCxgN+JplDUEGtUgtz//K/b4zBi7YB0ov02CLVMqJQiF/YJGq0ysf9c+rPxQcc/NA==', N'46418825-da2f-4a61-a903-f044c4dad97f', NULL, 0, 0, NULL, 1, 0, N'ac@email.com')
SET IDENTITY_INSERT [dbo].[Locations] ON 

INSERT [dbo].[Locations] ([LocationID], [StoreName], [StoreNumber], [City], [State], [ManagerID], [StoreImage]) VALUES (1, N'Filling Station - Westport', N'1010', N'Kansas City', N'MO', N'5f174b24-0afb-4190-8532-edfa4f231849', NULL)
INSERT [dbo].[Locations] ([LocationID], [StoreName], [StoreNumber], [City], [State], [ManagerID], [StoreImage]) VALUES (2, N'Filling Station - Midtown', N'2980', N'Kansas City', N'MO', N'5f174b24-0afb-4190-8532-edfa4f231849', NULL)
INSERT [dbo].[Locations] ([LocationID], [StoreName], [StoreNumber], [City], [State], [ManagerID], [StoreImage]) VALUES (3, N'Filling Station - Overland Park', N'7420', N'Mission', N'KS', N'0e55f66e-ff43-4923-9070-59f919001fa0', NULL)
INSERT [dbo].[Locations] ([LocationID], [StoreName], [StoreNumber], [City], [State], [ManagerID], [StoreImage]) VALUES (4, N'Filling Station -  South Kansas City', N'987', N'Grandview', N'MO', N'0e55f66e-ff43-4923-9070-59f919001fa0', NULL)
INSERT [dbo].[Locations] ([LocationID], [StoreName], [StoreNumber], [City], [State], [ManagerID], [StoreImage]) VALUES (5, N'Messenger Coffee Co', N'1624', N'Kansas City', N'MO', N'5f174b24-0afb-4190-8532-edfa4f231849', NULL)
SET IDENTITY_INSERT [dbo].[Locations] OFF
SET IDENTITY_INSERT [dbo].[OpenPositions] ON 

INSERT [dbo].[OpenPositions] ([OpenPositionID], [PositionID], [LocationID]) VALUES (1, 1, 3)
INSERT [dbo].[OpenPositions] ([OpenPositionID], [PositionID], [LocationID]) VALUES (2, 3, 2)
INSERT [dbo].[OpenPositions] ([OpenPositionID], [PositionID], [LocationID]) VALUES (3, 3, 2)
INSERT [dbo].[OpenPositions] ([OpenPositionID], [PositionID], [LocationID]) VALUES (4, 4, 2)
INSERT [dbo].[OpenPositions] ([OpenPositionID], [PositionID], [LocationID]) VALUES (5, 1, 1)
INSERT [dbo].[OpenPositions] ([OpenPositionID], [PositionID], [LocationID]) VALUES (6, 2, 3)
INSERT [dbo].[OpenPositions] ([OpenPositionID], [PositionID], [LocationID]) VALUES (7, 5, 3)
INSERT [dbo].[OpenPositions] ([OpenPositionID], [PositionID], [LocationID]) VALUES (9, 4, 3)
INSERT [dbo].[OpenPositions] ([OpenPositionID], [PositionID], [LocationID]) VALUES (10, 1, 1)
SET IDENTITY_INSERT [dbo].[OpenPositions] OFF
SET IDENTITY_INSERT [dbo].[Positions] ON 

INSERT [dbo].[Positions] ([PositionID], [Title], [JobDescription]) VALUES (1, N'Barista', N'Professional individual who can make anything from a latte to a espresso tonic. ')
INSERT [dbo].[Positions] ([PositionID], [Title], [JobDescription]) VALUES (2, N'Manager', N'Someone who can manage the store from opening or closing. ')
INSERT [dbo].[Positions] ([PositionID], [Title], [JobDescription]) VALUES (3, N'Roaster', N'Someone who can roast the coffee beans in the way we need it.')
INSERT [dbo].[Positions] ([PositionID], [Title], [JobDescription]) VALUES (4, N'Food Prep Specialist', N'Some one who can prepare the food for juices, sandwiches etc.')
INSERT [dbo].[Positions] ([PositionID], [Title], [JobDescription]) VALUES (5, N'Service Rep', N'Someone who can take orders, handle money, and provide excellent customer service.')
SET IDENTITY_INSERT [dbo].[Positions] OFF
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName], [ResumeFileName], [BaristaImage], [IsEmployed], [Bio]) VALUES (N'0e55f66e-ff43-4923-9070-59f919001fa0', N'Montana', N'Rex', NULL, N'96698b90-92c7-490e-bc9c-fcef37a747d5.jpg', 1, N'My first Barista gig was at a Starbucks cafe. I spent two years there before relocating to northern Illinois/Chicago area where I intended to pursue work in the coffee industry. In March of 2012, I started working in specialty coffee at an independent coffee shop in Evanston, IL called The Brothers K Coffeehouse. I spent roughly a year at Bros K before moving back to Kansas City, where I immediately started looking for barista work. It took some time but eventually I found my coffee family here at Messenger Coffee in February of 2014.')
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName], [ResumeFileName], [BaristaImage], [IsEmployed], [Bio]) VALUES (N'41aba84f-3f5f-41eb-8c00-c7ca495707f7', N'Jorge', N'Pietrogiovanna', NULL, N'226c25c0-43b4-4b6c-bf19-0565620a8fa6.jpg', 1, N'Hello, my name is Jorge and I live in Kansas City. I love rock climbing with friends and trying out the best coffee around. But what I really enjoy is solving problems to build relationships. Over time I have learned that there is a lack of communication in our society and I have identified myself as a liaison through branding and user-interfaces to help people communicate their passions to the world through creative art and technology. Please reach out to me through email or other social networks listed below, I would love to get to know you!')
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName], [ResumeFileName], [BaristaImage], [IsEmployed], [Bio]) VALUES (N'5f174b24-0afb-4190-8532-edfa4f231849', N'Kirsten', N'Rex', NULL, N'772d8bea-9421-414a-a3e4-f219769e5649.jpg', 1, N'I have only ever worked in the coffee industry, going on seven years now. I used to work for JP''s Coffee and Espresso bar in Holland, MI, and have done some side coffee consulting and training through what was the Midwest Barista School. I''ve also competed in latte art championships and helped JP''s take third in America''s Best Coffeehouse 2013')
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName], [ResumeFileName], [BaristaImage], [IsEmployed], [Bio]) VALUES (N'7074f4a7-2868-416f-bb41-803da115fb2b', N'Andy', N'Cardona', NULL, N'5900edb9-4a67-4fe1-9913-a0ad3d45fb64.jpg', 1, N'I have been a barista for 5 years, and it has been a valuable part of my journey at the Midtown location. I enjoyed music, cooking, and spending time with my family.')
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Applications_OpenPositions]') AND parent_object_id = OBJECT_ID(N'[dbo].[Applications]'))
ALTER TABLE [dbo].[Applications]  WITH CHECK ADD  CONSTRAINT [FK_Applications_OpenPositions] FOREIGN KEY([OpenPositionID])
REFERENCES [dbo].[OpenPositions] ([OpenPositionID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Applications_OpenPositions]') AND parent_object_id = OBJECT_ID(N'[dbo].[Applications]'))
ALTER TABLE [dbo].[Applications] CHECK CONSTRAINT [FK_Applications_OpenPositions]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OpenPositions_Locations]') AND parent_object_id = OBJECT_ID(N'[dbo].[OpenPositions]'))
ALTER TABLE [dbo].[OpenPositions]  WITH CHECK ADD  CONSTRAINT [FK_OpenPositions_Locations] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Locations] ([LocationID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OpenPositions_Locations]') AND parent_object_id = OBJECT_ID(N'[dbo].[OpenPositions]'))
ALTER TABLE [dbo].[OpenPositions] CHECK CONSTRAINT [FK_OpenPositions_Locations]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OpenPositions_Positions]') AND parent_object_id = OBJECT_ID(N'[dbo].[OpenPositions]'))
ALTER TABLE [dbo].[OpenPositions]  WITH CHECK ADD  CONSTRAINT [FK_OpenPositions_Positions] FOREIGN KEY([PositionID])
REFERENCES [dbo].[Positions] ([PositionID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OpenPositions_Positions]') AND parent_object_id = OBJECT_ID(N'[dbo].[OpenPositions]'))
ALTER TABLE [dbo].[OpenPositions] CHECK CONSTRAINT [FK_OpenPositions_Positions]
GO
