USE [master]
GO
--
-- 
--

IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE [name] = N'Pharmalife')
BEGIN
	PRINT 'Creando Login'
	CREATE LOGIN [Pharmalife] WITH 
		PASSWORD=N'paton123', 
		DEFAULT_DATABASE=[PharmaLife], 
		CHECK_EXPIRATION=OFF, 
		CHECK_POLICY=OFF
END
GO

USE [PharmaLife]
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE [name] = N'Pharmalife')
BEGIN
	PRINT 'Creando User'
	CREATE USER [Pharmalife] FOR LOGIN [Pharmalife]
	ALTER ROLE [db_owner] ADD MEMBER [pharmalife]
END 
GO
