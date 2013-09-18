--SQL Search Test Script to create a procedure in the master database and oine
-- The word Buffalo is in each object 
-- The word Margarita is the name of each object
DROP DATABASE SQLSearch_TestDB
GO

CREATE DATABASE SQLSearch_TestDB
GO

USE [SQLSearch_TestDB]
go

if exists (select * from sys.objects where object_id = object_id('ATS_SQLSearch_Test_Proc_Margarita') and type = 'P')
	drop procedure ATS_SQLSearch_Test_Proc_Margarita

if exists (select * from sys.objects where object_id = object_id('ATS_SQLSearch_Test_Function_Margarita') and type = 'FN')
	drop function ATS_SQLSearch_Test_Function_Margarita

if exists (select * from sys.objects where object_id = object_id('vw_SQLSearch_Test_View_Margarita') and type = 'V')
	drop view vw_SQLSearch_Test_View_Margarita

if exists (select * from sys.objects where object_id = object_id('ATS_SQLSearch_Trigger_Table_Margarita') and type = 'U')
	drop table ATS_SQLSearch_Trigger_Table_Margarita

if exists (select * from sys.objects where object_id = object_id('ATS_SQLSearch_DML_Trigger_Margarita') and type = 'TR')
	drop trigger ATS_SQLSearch_DML_Trigger_Margarita

if exists (select * from sys.triggers where name = 'ATS_SQLSearch_DDL_Trigger_Margarita' and type = 'TR')
	drop trigger ATS_SQLSearch_DDL_Trigger_Margarita on DATABASE
	
if exists (select * from master.sys.objects where name = 'ATS_SQLSearch_Logon_Trigger_Margarita' and type = 'TR')	
	drop trigger ATS_SQLSearch_Logon_Trigger_Margarita on ALL SERVER

go


-- Stored Procedure
Create procedure ATS_SQLSearch_Test_Proc_Margarita
AS
BEGIN
	/* SQLSearch Text to find in Proc
		Buffalo
		
	Try case Sensitive and non case Sensitive
		
	*/

	select 1 from sys.objects
END
GO





USE [master]
go

if exists (select * from sys.objects where object_id = object_id('ATS_SQLSearch_Test_Proc_Margarita') and type = 'P')
	drop procedure ATS_SQLSearch_Test_Proc_Margarita
GO
-- Stored Procedure
Create procedure ATS_SQLSearch_Test_Proc_Margarita
AS
BEGIN
	/* SQLSearch Text to find in Proc
		Buffalo
		
	Try case Sensitive and non case Sensitive
		
	*/

	select 1 from sys.objects
END
GO

