select e.name, s.output_file_name from msdb.dbo.sysjobsteps as s inner join  msdb.dbo.sysjobs as e on e.job_id = s.job_id where e.name='fragmentation analysis'

