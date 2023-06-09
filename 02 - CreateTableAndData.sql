USE [PharmaLife]
GO
/****** Object:  Table [dbo].[Farmacia]    Script Date: 9/6/2023 08:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Farmacia](
	[IdUsuario] [int] NOT NULL,
	[DueñoFarmacia] [varchar](50) NULL,
	[Direccion] [varchar](50) NULL,
 CONSTRAINT [PK_Farmacia] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicamentos]    Script Date: 9/6/2023 08:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicamentos](
	[IdMedicamentos] [int] NOT NULL,
	[NombreMedicamento] [varchar](50) NULL,
 CONSTRAINT [PK_Medicamentos] PRIMARY KEY CLUSTERED 
(
	[IdMedicamentos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medico]    Script Date: 9/6/2023 08:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medico](
	[IdUsuario] [int] NOT NULL,
	[Matricula] [int] NULL,
	[Firma] [image] NULL,
 CONSTRAINT [PK_Medico] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 9/6/2023 08:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paciente](
	[IdUsuario] [int] NOT NULL,
	[Direccion] [varchar](50) NULL,
	[Dni] [int] NULL,
 CONSTRAINT [PK_Paciente] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receta]    Script Date: 9/6/2023 08:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receta](
	[IdReceta] [int] NOT NULL,
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
/****** Object:  Table [dbo].[Solicitudes]    Script Date: 9/6/2023 08:07:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solicitudes](
	[IdSolicitud] [int] NOT NULL,
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
/****** Object:  Table [dbo].[Usuario]    Script Date: 9/6/2023 08:07:21 ******/
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
INSERT [dbo].[Farmacia] ([IdUsuario], [DueñoFarmacia], [Direccion]) VALUES (1, N'pedro', N'rio')
INSERT [dbo].[Farmacia] ([IdUsuario], [DueñoFarmacia], [Direccion]) VALUES (2, N'pablo', N'yatay')
GO
INSERT [dbo].[Medicamentos] ([IdMedicamentos], [NombreMedicamento]) VALUES (1, N'ibu')
INSERT [dbo].[Medicamentos] ([IdMedicamentos], [NombreMedicamento]) VALUES (2, N'ssops')
GO
INSERT [dbo].[Medico] ([IdUsuario], [Matricula], [Firma]) VALUES (1, 1, NULL)
INSERT [dbo].[Medico] ([IdUsuario], [Matricula], [Firma]) VALUES (2, 2, NULL)
GO
INSERT [dbo].[Paciente] ([IdUsuario], [Direccion], [Dni]) VALUES (1, N'lswl', 1234567)
INSERT [dbo].[Paciente] ([IdUsuario], [Direccion], [Dni]) VALUES (2, N'xsccn', 1234356)
GO
INSERT [dbo].[Receta] ([IdReceta], [IdMedicamento], [IdMedico], [IdPaciente], [IdFarmacia], [FechaCreacion], [FechaVencimiento], [Estado], [Observaciones]) VALUES (1, 1, 1, 1, 1, CAST(N'2005-02-01' AS Date), CAST(N'2009-09-09' AS Date), 1, N'pepdleepld')
INSERT [dbo].[Receta] ([IdReceta], [IdMedicamento], [IdMedico], [IdPaciente], [IdFarmacia], [FechaCreacion], [FechaVencimiento], [Estado], [Observaciones]) VALUES (2, 2, 2, 2, 2, CAST(N'2010-10-10' AS Date), CAST(N'2007-07-07' AS Date), 0, N'dsccd')
GO
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (1, 1, 1, 1, 1, 34)
INSERT [dbo].[Solicitudes] ([IdSolicitud], [IdPaciente], [IdFarmacia], [IdRemedio], [IdReceta], [Precio]) VALUES (2, 2, 2, 2, 2, 44)
GO
INSERT [dbo].[Usuario] ([IdUsuario], [Apellido], [Telefono], [Mail], [Contraseña], [Nombre]) VALUES (1, N'pewodw', 111344, N'dwpdmojp', N'feiojf', N'pepe')
INSERT [dbo].[Usuario] ([IdUsuario], [Apellido], [Telefono], [Mail], [Contraseña], [Nombre]) VALUES (2, N'dndnw', 44789, N'dhsakd', N'wnkoi', N'bauti')
GO
ALTER TABLE [dbo].[Receta]  WITH CHECK ADD  CONSTRAINT [FK_Receta_Medicamentos] FOREIGN KEY([IdMedicamento])
REFERENCES [dbo].[Medicamentos] ([IdMedicamentos])
GO
ALTER TABLE [dbo].[Receta] CHECK CONSTRAINT [FK_Receta_Medicamentos]
GO
ALTER TABLE [dbo].[Receta]  WITH CHECK ADD  CONSTRAINT [FK_Receta_Medico] FOREIGN KEY([IdMedico])
REFERENCES [dbo].[Medico] ([IdUsuario])
GO
ALTER TABLE [dbo].[Receta] CHECK CONSTRAINT [FK_Receta_Medico]
GO
ALTER TABLE [dbo].[Receta]  WITH CHECK ADD  CONSTRAINT [FK_Receta_Paciente] FOREIGN KEY([IdPaciente])
REFERENCES [dbo].[Paciente] ([IdUsuario])
GO
ALTER TABLE [dbo].[Receta] CHECK CONSTRAINT [FK_Receta_Paciente]
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
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Farmacia] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Farmacia] ([IdUsuario])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Farmacia]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Medico] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Medico] ([IdUsuario])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Medico]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Paciente] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Paciente] ([IdUsuario])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Paciente]
GO