USE msdb

EXEC sp_add_job 
	@job_name = N'Test Job'; 
GO 

EXEC sp_add_jobstep 
	@job_name = N'Test Job', 
	@step_name = N'Step 1',
	@subsystem = N'TSQL',
	@command = N'DBCC checkDB (''msdb'')',
	@on_success_action = 1, 
	@on_fail_action = 2,
	@database_name = N'msdb',
	@retry_attempts = 5,
	@retry_interval = 5,
	@output_file_name = N'C:\DBCCResult.txt'; 
GO 
EXEC sp_add_schedule 
	@schedule_name = N'Job_Schedule',
	@freq_type = 4,
	@freq_interval = 1;
	
USE msdb 
EXEC sp_attach_schedule 
	@job_name = N'Test Job',
	@schedule_name = N'Job_Schedule';
GO
EXEC sp_add_jobserver 
	@job_name = N'Test Job';
GO