


select e.name, s.step_name,s.subsystem,s.command, s.on_success_action,s.on_fail_action,
s.retry_attempts, s.retry_interval,s.output_file_name,s.last_run_date
from msdb.dbo.sysjobsteps as s 
inner join  msdb.dbo.sysjobs as e on e.job_id = s.job_id where e.name='Test Job'

