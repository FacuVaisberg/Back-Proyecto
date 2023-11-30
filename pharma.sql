USE [db_aa05c4_pharmalife]
GO
/****** Object:  User [alumno]    Script Date: 11/30/2023 7:21:58 PM ******/
CREATE USER [alumno] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Pharmalife]    Script Date: 11/30/2023 7:21:58 PM ******/
CREATE USER [Pharmalife] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [Pharmalife]
GO
/****** Object:  Table [dbo].[Farmacia]    Script Date: 11/30/2023 7:21:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Farmacia](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[DueñoFarmacia] [varchar](50) NULL,
	[Direccion] [varchar](50) NULL,
 CONSTRAINT [PK_Farmacia] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicamentos]    Script Date: 11/30/2023 7:22:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicamentos](
	[IdMedicamentos] [int] IDENTITY(1,1) NOT NULL,
	[NombreMedicamento] [varchar](50) NULL,
 CONSTRAINT [PK_Medicamentos] PRIMARY KEY CLUSTERED 
(
	[IdMedicamentos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medico]    Script Date: 11/30/2023 7:22:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medico](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Matricula] [int] NULL,
	[Firma] [image] NULL,
 CONSTRAINT [PK_Medico] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 11/30/2023 7:22:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paciente](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Direccion] [varchar](50) NULL,
	[Dni] [int] NULL,
 CONSTRAINT [PK_Paciente] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receta]    Script Date: 11/30/2023 7:22:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receta](
	[IdReceta] [int] IDENTITY(1,1) NOT NULL,
	[IdMedicamento] [int] NULL,
	[IdMedico] [int] NULL,
	[IdPaciente] [int] NULL,
	[IdFarmacia] [int] NULL,
	[FechaCreacion] [date] NULL,
	[FechaVencimiento] [date] NULL,
	[Estado] [bit] NULL,
	[Observaciones] [varchar](50) NULL,
 CONSTRAINT [PK_Receta] PRIMARY KEY CLUSTERED 
(
	[IdReceta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solicitudes]    Script Date: 11/30/2023 7:22:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solicitudes](
	[IdSolicitud] [int] IDENTITY(1,1) NOT NULL,
	[IdPaciente] [int] NULL,
	[IdFarmacia] [int] NULL,
	[IdRemedio] [int] NULL,
	[IdReceta] [int] NULL,
	[Precio] [int] NULL,
 CONSTRAINT [PK_Solicitudes] PRIMARY KEY CLUSTERED 
(
	[IdSolicitud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 11/30/2023 7:22:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] NOT NULL,
	[Apellido] [varchar](50) NULL,
	[Telefono] [int] NULL,
	[Mail] [varchar](50) NULL,
	[Contraseña] [varchar](50) NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Farmacia] ON 

INSERT [dbo].[Farmacia] ([IdUsuario], [DueñoFarmacia], [Direccion]) VALUES (1, N'Damian', N'rio')
INSERT [dbo].[Farmacia] ([IdUsuario], [DueñoFarmacia], [Direccion]) VALUES (2, N'pablo', N'yatay')
SET IDENTITY_INSERT [dbo].[Farmacia] OFF
GO
SET IDENTITY_INSERT [dbo].[Medicamentos] ON 

INSERT [dbo].[Medicamentos] ([IdMedicamentos], [NombreMedicamento]) VALUES (1, N'ibu')
INSERT [dbo].[Medicamentos] ([IdMedicamentos], [NombreMedicamento]) VALUES (2, N'ssops')
INSERT [dbo].[Medicamentos] ([IdMedicamentos], [NombreMedicamento]) VALUES (3, N'coco')
INSERT [dbo].[Medicamentos] ([IdMedicamentos], [NombreMedicamento]) VALUES (4, N'messi')
SET IDENTITY_INSERT [dbo].[Medicamentos] OFF
GO
SET IDENTITY_INSERT [dbo].[Medico] ON 

INSERT [dbo].[Medico] ([IdUsuario], [Matricula], [Firma]) VALUES (3, 1, NULL)
INSERT [dbo].[Medico] ([IdUsuario], [Matricula], [Firma]) VALUES (4, 2, NULL)
SET IDENTITY_INSERT [dbo].[Medico] OFF
GO
SET IDENTITY_INSERT [dbo].[Paciente] ON 

INSERT [dbo].[Paciente] ([IdUsuario], [Direccion], [Dni]) VALUES (5, N'yatay', 1234567)
INSERT [dbo].[Paciente] ([IdUsuario], [Direccion], [Dni]) VALUES (6, N'yatay', 123456)
SET IDENTITY_INSERT [dbo].[Paciente] OFF
GO
SET IDENTITY_INSERT [dbo].[Receta] ON 

INSERT [dbo].[Receta] ([IdReceta], [IdMedicamento], [IdMedico], [IdPaciente], [IdFarmacia], [FechaCreacion], [FechaVencimiento], [Estado], [Observaciones]) VALUES (1, 1, 3, 6, 1, CAST(N'2005-02-01' AS Date), CAST(N'2009-09-09' AS Date), 1, N'pepdleepld')
INSERT [dbo].[Receta] ([IdReceta], [IdMedicamento], [IdMedico], [IdPaciente], [IdFarmacia], [FechaCreacion], [FechaVencimiento], [Estado], [Observaciones]) VALUES (2, 2, 3, 5, 1, CAST(N'2010-10-10' AS Date), CAST(N'2007-07-07' AS Date), 0, N'dsccd')
INSERT [dbo].[Receta] ([IdReceta], [IdMedicamento], [IdMedico], [IdPaciente], [IdFarmacia], [FechaCreacion], [FechaVencimiento], [Estado], [Observaciones]) VALUES (3, 1, 4, 6, 2, CAST(N'2018-10-10' AS Date), NULL, 0, N'uenche feo')
INSERT [dbo].[Receta] ([IdReceta], [IdMedicamento], [IdMedico], [IdPaciente], [IdFarmacia], [FechaCreacion], [FechaVencimiento], [Estado], [Observaciones]) VALUES (4, 2, NULL, 1728371, NULL, CAST(N'2023-10-27' AS Date), NULL, 1, N'puto')
INSERT [dbo].[Receta] ([IdReceta], [IdMedicamento], [IdMedico], [IdPaciente], [IdFarmacia], [FechaCreacion], [FechaVencimiento], [Estado], [Observaciones]) VALUES (5, 2, NULL, 1728371, NULL, CAST(N'2023-10-27' AS Date), NULL, 1, N'pavdfsdf')
INSERT [dbo].[Receta] ([IdReceta], [IdMedicamento], [IdMedico], [IdPaciente], [IdFarmacia], [FechaCreacion], [FechaVencimiento], [Estado], [Observaciones]) VALUES (6, 2, NULL, 2, NULL, CAST(N'2023-11-03' AS Date), NULL, 1, N'Ejeje')
INSERT [dbo].[Receta] ([IdReceta], [IdMedicamento], [IdMedico], [IdPaciente], [IdFarmacia], [FechaCreacion], [FechaVencimiento], [Estado], [Observaciones]) VALUES (7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Receta] ([IdReceta], [IdMedicamento], [IdMedico], [IdPaciente], [IdFarmacia], [FechaCreacion], [FechaVencimiento], [Estado], [Observaciones]) VALUES (8, 1, NULL, 2, NULL, CAST(N'2023-11-10' AS Date), NULL, 1, N'Abc')
INSERT [dbo].[Receta] ([IdReceta], [IdMedicamento], [IdMedico], [IdPaciente], [IdFarmacia], [FechaCreacion], [FechaVencimiento], [Estado], [Observaciones]) VALUES (9, 2, NULL, 2, NULL, CAST(N'2023-11-10' AS Date), NULL, 1, N'Abc')
INSERT [dbo].[Receta] ([IdReceta], [IdMedicamento], [IdMedico], [IdPaciente], [IdFarmacia], [FechaCreacion], [FechaVencimiento], [Estado], [Observaciones]) VALUES (10, 2, NULL, 2, NULL, CAST(N'2023-11-10' AS Date), NULL, 1, N'Pawin')
INSERT [dbo].[Receta] ([IdReceta], [IdMedicamento], [IdMedico], [IdPaciente], [IdFarmacia], [FechaCreacion], [FechaVencimiento], [Estado], [Observaciones]) VALUES (11, 2, 2, 2, 2, CAST(N'2018-10-10' AS Date), NULL, 0, N'es la nueva')
INSERT [dbo].[Receta] ([IdReceta], [IdMedicamento], [IdMedico], [IdPaciente], [IdFarmacia], [FechaCreacion], [FechaVencimiento], [Estado], [Observaciones]) VALUES (12, 2, 2, 2, 2, CAST(N'2018-10-10' AS Date), NULL, 1, N'es la nueva')
INSERT [dbo].[Receta] ([IdReceta], [IdMedicamento], [IdMedico], [IdPaciente], [IdFarmacia], [FechaCreacion], [FechaVencimiento], [Estado], [Observaciones]) VALUES (13, 2, 2, 2, 2, CAST(N'2018-10-10' AS Date), NULL, 0, N'es la nueva')
INSERT [dbo].[Receta] ([IdReceta], [IdMedicamento], [IdMedico], [IdPaciente], [IdFarmacia], [FechaCreacion], [FechaVencimiento], [Estado], [Observaciones]) VALUES (14, 2, 2, 2, 2, CAST(N'2018-10-10' AS Date), NULL, 0, N'es la nueva')
INSERT [dbo].[Receta] ([IdReceta], [IdMedicamento], [IdMedico], [IdPaciente], [IdFarmacia], [FechaCreacion], [FechaVencimiento], [Estado], [Observaciones]) VALUES (16, 2, 2, 2, 2, CAST(N'2018-10-10' AS Date), NULL, 0, N'es la nueva')
INSERT [dbo].[Receta] ([IdReceta], [IdMedicamento], [IdMedico], [IdPaciente], [IdFarmacia], [FechaCreacion], [FechaVencimiento], [Estado], [Observaciones]) VALUES (17, 2, 2, 2, 2, CAST(N'2018-10-10' AS Date), NULL, 0, N'es la nueva')
INSERT [dbo].[Receta] ([IdReceta], [IdMedicamento], [IdMedico], [IdPaciente], [IdFarmacia], [FechaCreacion], [FechaVencimiento], [Estado], [Observaciones]) VALUES (18, 2, 2, 2, 2, CAST(N'2018-10-10' AS Date), NULL, 0, N'es la nueva')
INSERT [dbo].[Receta] ([IdReceta], [IdMedicamento], [IdMedico], [IdPaciente], [IdFarmacia], [FechaCreacion], [FechaVencimiento], [Estado], [Observaciones]) VALUES (19, 2, 2, 2, 2, CAST(N'2018-10-10' AS Date), NULL, 0, N'es la nueva')
INSERT [dbo].[Receta] ([IdReceta], [IdMedicamento], [IdMedico], [IdPaciente], [IdFarmacia], [FechaCreacion], [FechaVencimiento], [Estado], [Observaciones]) VALUES (20, 2, 2, 2, 2, CAST(N'2018-10-10' AS Date), NULL, 0, N'es la nueva')
INSERT [dbo].[Receta] ([IdReceta], [IdMedicamento], [IdMedico], [IdPaciente], [IdFarmacia], [FechaCreacion], [FechaVencimiento], [Estado], [Observaciones]) VALUES (21, 2, 2, 2, 2, CAST(N'2018-10-10' AS Date), NULL, 0, N'es la nueva')
INSERT [dbo].[Receta] ([IdReceta], [IdMedicamento], [IdMedico], [IdPaciente], [IdFarmacia], [FechaCreacion], [FechaVencimiento], [Estado], [Observaciones]) VALUES (22, 2, 2, 2, 2, CAST(N'2018-10-10' AS Date), NULL, 0, N'es la nueva')
INSERT [dbo].[Receta] ([IdReceta], [IdMedicamento], [IdMedico], [IdPaciente], [IdFarmacia], [FechaCreacion], [FechaVencimiento], [Estado], [Observaciones]) VALUES (23, 2, 2, 2, 2, CAST(N'2018-10-10' AS Date), NULL, 0, N'es la nueva')
INSERT [dbo].[Receta] ([IdReceta], [IdMedicamento], [IdMedico], [IdPaciente], [IdFarmacia], [FechaCreacion], [FechaVencimiento], [Estado], [Observaciones]) VALUES (24, 2, 2, 2, 2, CAST(N'2018-10-10' AS Date), NULL, 0, N'es la nueva')
INSERT [dbo].[Receta] ([IdReceta], [IdMedicamento], [IdMedico], [IdPaciente], [IdFarmacia], [FechaCreacion], [FechaVencimiento], [Estado], [Observaciones]) VALUES (25, 2, 2, 2, 2, CAST(N'2018-10-10' AS Date), NULL, 0, N'es la nueva')
INSERT [dbo].[Receta] ([IdReceta], [IdMedicamento], [IdMedico], [IdPaciente], [IdFarmacia], [FechaCreacion], [FechaVencimiento], [Estado], [Observaciones]) VALUES (26, 2, 2, 2, 2, CAST(N'2018-10-10' AS Date), NULL, 0, N'es la nueva')
INSERT [dbo].[Receta] ([IdReceta], [IdMedicamento], [IdMedico], [IdPaciente], [IdFarmacia], [FechaCreacion], [FechaVencimiento], [Estado], [Observaciones]) VALUES (27, 2, 2, 2, 2, CAST(N'2018-10-10' AS Date), NULL, 0, N'forni')
INSERT [dbo].[Receta] ([IdReceta], [IdMedicamento], [IdMedico], [IdPaciente], [IdFarmacia], [FechaCreacion], [FechaVencimiento], [Estado], [Observaciones]) VALUES (28, 2, 2, 2, 2, CAST(N'2018-10-10' AS Date), NULL, 0, N'forni')
INSERT [dbo].[Receta] ([IdReceta], [IdMedicamento], [IdMedico], [IdPaciente], [IdFarmacia], [FechaCreacion], [FechaVencimiento], [Estado], [Observaciones]) VALUES (29, 2, NULL, 47343179, NULL, CAST(N'2023-11-17' AS Date), NULL, 1, N'2')
INSERT [dbo].[Receta] ([IdReceta], [IdMedicamento], [IdMedico], [IdPaciente], [IdFarmacia], [FechaCreacion], [FechaVencimiento], [Estado], [Observaciones]) VALUES (30, 2, 4, 5, 2, CAST(N'2018-10-10' AS Date), NULL, 0, N'forni')
INSERT [dbo].[Receta] ([IdReceta], [IdMedicamento], [IdMedico], [IdPaciente], [IdFarmacia], [FechaCreacion], [FechaVencimiento], [Estado], [Observaciones]) VALUES (31, 2, NULL, 47343179, NULL, CAST(N'2023-11-17' AS Date), NULL, 1, N'Hhhgg')
INSERT [dbo].[Receta] ([IdReceta], [IdMedicamento], [IdMedico], [IdPaciente], [IdFarmacia], [FechaCreacion], [FechaVencimiento], [Estado], [Observaciones]) VALUES (32, 2, NULL, 47343179, NULL, CAST(N'2023-11-17' AS Date), NULL, 1, N'Hhhgg')
INSERT [dbo].[Receta] ([IdReceta], [IdMedicamento], [IdMedico], [IdPaciente], [IdFarmacia], [FechaCreacion], [FechaVencimiento], [Estado], [Observaciones]) VALUES (33, 2, NULL, 4, NULL, CAST(N'2023-11-17' AS Date), NULL, 1, N'Hhhgg')
INSERT [dbo].[Receta] ([IdReceta], [IdMedicamento], [IdMedico], [IdPaciente], [IdFarmacia], [FechaCreacion], [FechaVencimiento], [Estado], [Observaciones]) VALUES (34, 2, NULL, 2, NULL, CAST(N'2023-11-17' AS Date), NULL, 1, N'Hhhgg')
INSERT [dbo].[Receta] ([IdReceta], [IdMedicamento], [IdMedico], [IdPaciente], [IdFarmacia], [FechaCreacion], [FechaVencimiento], [Estado], [Observaciones]) VALUES (35, 2, 4, 5, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Receta] ([IdReceta], [IdMedicamento], [IdMedico], [IdPaciente], [IdFarmacia], [FechaCreacion], [FechaVencimiento], [Estado], [Observaciones]) VALUES (36, 2, 4, 6, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Receta] ([IdReceta], [IdMedicamento], [IdMedico], [IdPaciente], [IdFarmacia], [FechaCreacion], [FechaVencimiento], [Estado], [Observaciones]) VALUES (37, 2, 4, 6, NULL, CAST(N'2023-11-17' AS Date), NULL, 1, N'')
INSERT [dbo].[Receta] ([IdReceta], [IdMedicamento], [IdMedico], [IdPaciente], [IdFarmacia], [FechaCreacion], [FechaVencimiento], [Estado], [Observaciones]) VALUES (38, 1, 3, 5, NULL, CAST(N'2023-11-17' AS Date), NULL, 1, N'')
INSERT [dbo].[Receta] ([IdReceta], [IdMedicamento], [IdMedico], [IdPaciente], [IdFarmacia], [FechaCreacion], [FechaVencimiento], [Estado], [Observaciones]) VALUES (39, 2, 2, 2, 2, CAST(N'2018-10-10' AS Date), NULL, 0, N'forni')
INSERT [dbo].[Receta] ([IdReceta], [IdMedicamento], [IdMedico], [IdPaciente], [IdFarmacia], [FechaCreacion], [FechaVencimiento], [Estado], [Observaciones]) VALUES (40, 1, 3, 5, NULL, CAST(N'2023-11-24' AS Date), NULL, 1, N'')
INSERT [dbo].[Receta] ([IdReceta], [IdMedicamento], [IdMedico], [IdPaciente], [IdFarmacia], [FechaCreacion], [FechaVencimiento], [Estado], [Observaciones]) VALUES (41, 2, 2, 2, 2, CAST(N'2018-10-10' AS Date), NULL, 0, N'forni')
INSERT [dbo].[Receta] ([IdReceta], [IdMedicamento], [IdMedico], [IdPaciente], [IdFarmacia], [FechaCreacion], [FechaVencimiento], [Estado], [Observaciones]) VALUES (42, 2, 2, 2, 2, CAST(N'2018-10-10' AS Date), NULL, 0, N'forni')
INSERT [dbo].[Receta] ([IdReceta], [IdMedicamento], [IdMedico], [IdPaciente], [IdFarmacia], [FechaCreacion], [FechaVencimiento], [Estado], [Observaciones]) VALUES (43, 1, 2, 2, 2, CAST(N'2018-10-10' AS Date), NULL, 0, N'forni')
INSERT [dbo].[Receta] ([IdReceta], [IdMedicamento], [IdMedico], [IdPaciente], [IdFarmacia], [FechaCreacion], [FechaVencimiento], [Estado], [Observaciones]) VALUES (44, 1, 2, 2, 2, CAST(N'2018-10-10' AS Date), NULL, 0, N'forni')
INSERT [dbo].[Receta] ([IdReceta], [IdMedicamento], [IdMedico], [IdPaciente], [IdFarmacia], [FechaCreacion], [FechaVencimiento], [Estado], [Observaciones]) VALUES (45, 2, 2, 2, 2, CAST(N'2018-10-10' AS Date), NULL, 0, N'forni')
INSERT [dbo].[Receta] ([IdReceta], [IdMedicamento], [IdMedico], [IdPaciente], [IdFarmacia], [FechaCreacion], [FechaVencimiento], [Estado], [Observaciones]) VALUES (46, 2, 2, 2, 1, CAST(N'2018-10-10' AS Date), NULL, 0, N'forni')
INSERT [dbo].[Receta] ([IdReceta], [IdMedicamento], [IdMedico], [IdPaciente], [IdFarmacia], [FechaCreacion], [FechaVencimiento], [Estado], [Observaciones]) VALUES (47, 2, 2, 2, 1, CAST(N'2018-10-10' AS Date), NULL, 0, N'forni')
INSERT [dbo].[Receta] ([IdReceta], [IdMedicamento], [IdMedico], [IdPaciente], [IdFarmacia], [FechaCreacion], [FechaVencimiento], [Estado], [Observaciones]) VALUES (48, 1, 3, 5, NULL, CAST(N'2023-11-28' AS Date), NULL, 1, N'')
INSERT [dbo].[Receta] ([IdReceta], [IdMedicamento], [IdMedico], [IdPaciente], [IdFarmacia], [FechaCreacion], [FechaVencimiento], [Estado], [Observaciones]) VALUES (49, 1, 3, 4, NULL, CAST(N'2023-11-28' AS Date), NULL, 1, N'')
INSERT [dbo].[Receta] ([IdReceta], [IdMedicamento], [IdMedico], [IdPaciente], [IdFarmacia], [FechaCreacion], [FechaVencimiento], [Estado], [Observaciones]) VALUES (50, 2, 4, 5, NULL, CAST(N'2023-11-30' AS Date), NULL, 1, N'')
SET IDENTITY_INSERT [dbo].[Receta] OFF
GO
SET IDENTITY_INSERT [dbo].[Solicitudes] ON 

INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (26, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (38, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (39, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (40, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (44, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (45, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (46, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (47, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (48, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (49, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (51, 2, NULL, 2, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (52, 2, NULL, 2, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (53, 2, NULL, 2, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (54, 2, NULL, 2, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (77, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (78, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (79, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (80, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (81, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (82, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (83, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (84, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (85, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (86, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (87, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (89, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (91, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (92, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (93, 2, NULL, 2, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (94, 2, NULL, 2, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (95, 2, NULL, 2, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (96, 2, NULL, 2, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (97, 2, NULL, 2, 41, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (98, 2, NULL, 2, 41, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (116, 2, NULL, 2, 41, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (117, 2, NULL, 2, 41, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (118, 2, NULL, 2, 41, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (119, 2, NULL, 2, 41, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (120, 2, NULL, 2, 41, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (121, 2, NULL, 2, 41, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (122, 2, NULL, 2, 41, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (123, 2, NULL, 2, 41, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (125, 2, 2, 1, 43, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (126, 2, NULL, 2, 41, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (129, 2, NULL, 2, 41, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (130, 2, NULL, 2, 41, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (131, 2, NULL, 2, 41, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (136, 2, NULL, 2, 41, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (137, 2, NULL, 2, 41, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (138, 2, NULL, 2, 41, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (139, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (140, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (141, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (142, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (143, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (144, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (145, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (146, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (147, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (148, 2, NULL, 2, 41, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (149, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (150, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (151, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (152, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (153, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (154, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (155, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (156, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (157, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (158, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (167, 2, NULL, 2, 41, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (168, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (169, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (173, 2, 1, 2, 41, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (174, 2, NULL, 2, 41, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (175, 2, NULL, 2, 41, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (176, 2, NULL, 2, 41, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (181, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (182, 2, NULL, 2, 41, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (183, 2, NULL, 2, 41, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (184, 2, NULL, 2, 41, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (185, 2, NULL, 2, 41, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (187, 2, NULL, 2, 41, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (189, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (196, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (197, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (198, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (199, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (200, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (201, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (202, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (203, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (204, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (205, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (206, 5, NULL, 1, 48, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (207, 5, NULL, 1, 48, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (208, 4, NULL, 1, 49, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (209, 5, NULL, 1, 48, NULL)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (210, 5, NULL, 2, 50, NULL)
GO
SET IDENTITY_INSERT [dbo].[Solicitudes] OFF
GO
INSERT [dbo].[Usuario] ([IdUsuario], [Apellido], [Telefono], [Mail], [Contraseña], [Nombre]) VALUES (1, N'Naiman', 11234567, N'naiman@gmail.com', N'melman123', N'Farmacity Almagro')
INSERT [dbo].[Usuario] ([IdUsuario], [Apellido], [Telefono], [Mail], [Contraseña], [Nombre]) VALUES (2, N'Vaisberg', 11234567, N'vaisberg@gmail.com', N'facu06', N'Central Oeste')
INSERT [dbo].[Usuario] ([IdUsuario], [Apellido], [Telefono], [Mail], [Contraseña], [Nombre]) VALUES (3, N'Golonbek', 11234567, N'golonbek@gmail.com', N'golo06', N'Dr. Matias')
INSERT [dbo].[Usuario] ([IdUsuario], [Apellido], [Telefono], [Mail], [Contraseña], [Nombre]) VALUES (4, N'Lazzari', 11234567, N'lazzari@gmail.com', N'uenche123', N'Dr. Santino')
INSERT [dbo].[Usuario] ([IdUsuario], [Apellido], [Telefono], [Mail], [Contraseña], [Nombre]) VALUES (5, N'Avola', 11234567, N'avola@gmail.com', N'tone06', N'Tomas')
INSERT [dbo].[Usuario] ([IdUsuario], [Apellido], [Telefono], [Mail], [Contraseña], [Nombre]) VALUES (6, N'Israel', 11234567, N'israel@gmail.com', N'isra05', N'Martin')
GO
ALTER TABLE [dbo].[Receta]  WITH CHECK ADD  CONSTRAINT [FK_Receta_Medicamentos] FOREIGN KEY([IdMedicamento])
REFERENCES [dbo].[Medicamentos] ([IdMedicamentos])
GO
ALTER TABLE [dbo].[Receta] CHECK CONSTRAINT [FK_Receta_Medicamentos]
GO
ALTER TABLE [dbo].[Solicitudes]  WITH CHECK ADD  CONSTRAINT [FK_Solicitudes_Farmacia] FOREIGN KEY([IdFarmacia])
REFERENCES [dbo].[Farmacia] ([IdUsuario])
GO
ALTER TABLE [dbo].[Solicitudes] CHECK CONSTRAINT [FK_Solicitudes_Farmacia]
GO
ALTER TABLE [dbo].[Solicitudes]  WITH CHECK ADD  CONSTRAINT [FK_Solicitudes_Receta] FOREIGN KEY([IdReceta])
REFERENCES [dbo].[Receta] ([IdReceta])
GO
ALTER TABLE [dbo].[Solicitudes] CHECK CONSTRAINT [FK_Solicitudes_Receta]
GO
