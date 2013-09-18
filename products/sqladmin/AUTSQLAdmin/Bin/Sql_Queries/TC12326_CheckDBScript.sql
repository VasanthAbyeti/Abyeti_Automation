
/*This query creates a SQL job that runns a DBCC
to check the logical and physical integrity of all 
the objects in msdb and the output is saved into a 
file located in your C: drive file name is DBCCResult.txt*/


USE msdb
GO
EXEC sp_add_category
    @class=N'JOB',
    @type= N'LOCAL',
    @name=N'CheckDB-Category' ;
GO

USE msdb
GO
EXEC sp_add_operator
    @name = N'DBAs',
    @enabled = 1,
    @email_address = N'dba',
    @pager_address = N'pager',
    @netsend_address = N'netsender',
    @weekday_pager_start_time = 080000,
    @weekday_pager_end_time = 170000,
    @pager_days = 6;
GO

use msdb
EXEC sp_add_job
		@job_name = N'CheckDB';
GO

EXEC sp_add_jobstep
		@job_name = N'CheckDB',
		@step_name = N'Run DBCC CheckDB on MSDB',
		@subsystem = N'TSQL',
		@command = N'DBCC checkDB (''msdb'')',
		@output_file_name = N'C:\DBCCResult.txt',
		@on_success_action = 1,
		@on_fail_action = 2;
GO


USE msdb
GO

EXEC sp_add_schedule
	@schedule_name = N'RunOnce',
    @freq_type = 4,
    @freq_interval = 1;

USE msdb

EXEC sp_attach_schedule
   @job_name = N'CheckDB',
   @schedule_name = N'RunOnce';
GO

EXEC sp_add_jobserver
    @job_name = N'CheckDB';
GO