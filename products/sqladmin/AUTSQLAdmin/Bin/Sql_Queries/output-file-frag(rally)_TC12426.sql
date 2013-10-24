/*this query creates a job that runs a system fragmentation analysis
of database "MSDB" and outputs the result in a .txt file located on you C: drive
When accessing the file, you should be able to see all the indexes of that database
listed from the highest fragmentation percentage to the lowest fragmentation % of an index */

use msdb

exec sp_add_job
	@job_name = N'Fragmentation analysis';
GO

exec sp_add_jobstep
	@job_name = N'Fragmentation analysis',
	@step_name = N'Detection',
	@command = N'select avg_fragmentation_in_percent, index_id, index_type_desc,
	index_level, avg_page_space_used_in_percent, page_count
	from sys.dm_db_index_physical_stats(DB_ID("MSDB"),NULL,NULL,NULL,"sampled")
	ORDER BY avg_fragmentation_in_percent DESC',
	@output_file_name = N'C:\frag-analysis.txt',
	@on_success_action = 1,
	@on_fail_action = 2;
GO

EXEC sp_add_schedule
	@schedule_name = N'FragSchedule',
    @freq_type = 4,
    @freq_interval = 1;
GO
      
use msdb

EXEC sp_attach_schedule
   @job_name = N'Fragmentation analysis',
   @schedule_name = N'FragSchedule';
GO


EXEC sp_add_jobserver
    @job_name = N'Fragmentation analysis';
GO