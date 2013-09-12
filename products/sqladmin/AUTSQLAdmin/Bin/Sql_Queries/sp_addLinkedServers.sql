USE [master]
GO
EXEC master.dbo.sp_addlinkedserver 
    @server = N'SQLEXPRESS', 
    @srvproduct=N'SQL Server' ;
GO