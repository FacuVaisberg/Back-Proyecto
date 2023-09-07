USE [PharmaLife]
GO
/****** Object:  User [Pharmalife]    Script Date: 9/7/2023 8:50:16 PM ******/
CREATE USER [Pharmalife] FOR LOGIN [Pharmalife] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [Pharmalife]
GO
/****** Object:  Table [dbo].[Farmacia]    Script Date: 9/7/2023 8:50:16 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicamentos]    Script Date: 9/7/2023 8:50:16 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medico]    Script Date: 9/7/2023 8:50:16 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 9/7/2023 8:50:16 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receta]    Script Date: 9/7/2023 8:50:16 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solicitudes]    Script Date: 9/7/2023 8:50:16 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 9/7/2023 8:50:16 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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

INSERT [dbo].[Receta] ([IdReceta], [IdMedicamento], [IdMedico], [IdPaciente], [IdFarmacia], [FechaCreacion], [FechaVencimiento], [Estado], [Observaciones]) VALUES (1, 1, 1, 1, 1, CAST(N'2005-02-01' AS Date), CAST(N'2009-09-09' AS Date), 1, N'pepdleepld')
INSERT [dbo].[Receta] ([IdReceta], [IdMedicamento], [IdMedico], [IdPaciente], [IdFarmacia], [FechaCreacion], [FechaVencimiento], [Estado], [Observaciones]) VALUES (2, 2, 2, 2, 2, CAST(N'2010-10-10' AS Date), CAST(N'2007-07-07' AS Date), 0, N'dsccd')
INSERT [dbo].[Receta] ([IdReceta], [IdMedicamento], [IdMedico], [IdPaciente], [IdFarmacia], [FechaCreacion], [FechaVencimiento], [Estado], [Observaciones]) VALUES (3, 1, 1, 2, 2, CAST(N'2018-10-10' AS Date), NULL, 0, N'uenche feo')
SET IDENTITY_INSERT [dbo].[Receta] OFF
GO
SET IDENTITY_INSERT [dbo].[Solicitudes] ON 

INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (1, 1, 1, 1, 1, 34)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (2, 2, 2, 2, 2, 44)
SET IDENTITY_INSERT [dbo].[Solicitudes] OFF
GO
INSERT [dbo].[Usuario] ([IdUsuario], [Apellido], [Telefono], [Mail], [Contraseña], [Nombre]) VALUES (1, N'Naiman', 11234567, N'naiman@gmail.com', N'melman123', N'Matias')
INSERT [dbo].[Usuario] ([IdUsuario], [Apellido], [Telefono], [Mail], [Contraseña], [Nombre]) VALUES (2, N'Vaisberg', 11234567, N'vaisberg@gmail.com', N'facu06', N'Facundo')
INSERT [dbo].[Usuario] ([IdUsuario], [Apellido], [Telefono], [Mail], [Contraseña], [Nombre]) VALUES (3, N'Golonbek', 11234567, N'golonbek@gmail.com', N'golo06', N'Matias')
INSERT [dbo].[Usuario] ([IdUsuario], [Apellido], [Telefono], [Mail], [Contraseña], [Nombre]) VALUES (4, N'Lazzari', 11234567, N'lazzari@gmail.com', N'uenche123', N'Santino')
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
