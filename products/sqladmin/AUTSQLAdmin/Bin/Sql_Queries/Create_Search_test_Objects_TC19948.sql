--SQL Search Test Script to create objects for searching
-- The word Buffalo is in each object 
-- The word Margarita is the name of each object

if exists (select * from master.dbo.sysdatabases where name = 'SQLSearch_TestDB')
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

-- Create Function
Create function ATS_SQLSearch_Test_Function_Margarita (@junk INTEGER)
RETURNS int
Begin
	/* SQLSearch Text to find in Function
		Buffalo
		
	Try case Sensitive and non case Sensitive
		
	*/
	RETURN 1
End
GO

-- Create View
Create View vw_SQLSearch_Test_View_Margarita
AS select 'Buffalo' as SQLSearch_Test, name, object_id, type_desc from sys.objects
GO


-- DML Trigger
create table ATS_SQLSearch_Trigger_Table_Margarita (col1 int)
go

create index IDX_ATS_SQLSearch_Trigger_Table_Margarita on ATS_SQLSearch_Trigger_Table_Margarita (col1)
GO


create trigger ATS_SQLSearch_DML_Trigger_Margarita on ATS_SQLSearch_Trigger_Table_Margarita
FOR UPDATE
AS
BEGIN
	/* SQLSearch Text to find in Trigger
		Buffalo
		
	Try case Sensitive and non case Sensitive
		
	*/

	declare @i int
	set @i = 1
END
GO

--DDL Trigger
Create trigger ATS_SQLSearch_DDL_Trigger_Margarita
ON DATABASE
FOR CREATE_QUEUE
AS
Begin
	/* SQLSearch Text to find in DDL Trigger
		Buffalo
		
	Try case Sensitive and non case Sensitive
		
	*/

	declare @i int
	set @i = 1
End
GO