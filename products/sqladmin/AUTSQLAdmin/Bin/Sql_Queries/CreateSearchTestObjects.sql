--SQL Search Test Script to create objects for searching
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

--LOGON Trigger
Create Trigger ATS_SQLSearch_Logon_Trigger_Margarita
ON ALL SERVER
FOR LOGON
AS
Begin
	/* SQLSearch Text to find in LOGON Trigger
		Buffalo
		
	Try case Sensitive and non case Sensitive
		
	*/

	declare @i int
	set @i = 1
End
go


/****** Object:  Job [Test Job Margarita]    Script Date: 06/29/2012 13:02:02 ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 06/29/2012 13:02:03 ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
select @jobId = job_id from msdb.dbo.sysjobs where (name = N'Test Job Margarita')
if (@jobId is NULL)
BEGIN
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Test Job Margarita', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END
/****** Object:  Step [Test Job Step Margarita]    Script Date: 06/29/2012 13:02:04 ******/
IF NOT EXISTS (SELECT * FROM msdb.dbo.sysjobsteps WHERE job_id = @jobId and step_id = 1)
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Test Job Step Margarita', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'select ''Buffalo''', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO