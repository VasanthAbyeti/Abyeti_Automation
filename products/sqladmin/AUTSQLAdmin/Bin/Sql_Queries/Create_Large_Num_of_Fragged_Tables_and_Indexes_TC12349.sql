Drop DataBase DefragDB
Go

Create database DefragDB
GO

USE DefragDB
GO


set nocount on



declare @i int
declare @x int
declare @all_tables table (ID int IDENTITY, name sysname)
declare @drop_table_count int
declare @drop_table_name sysname
declare @num_tables int
declare @max_rows int
declare @sql nvarchar(4000)

-- Set number of new tables to be created
-- Existing tables will be dropped
set @num_tables = 20



-- Cleanup any existing tables

insert into @all_tables (name) select name 
								from sys.objects 
								where name like 'defrag_part_table_%' 
								and type = 'U'

set @i = 1
select @drop_table_count = count(*) from @all_tables

while (@i <= @drop_table_count)
begin

	select @drop_table_name = name from @all_tables where ID = @i


	set @sql = 'drop table '+cast(@drop_table_name as varchar(50))
	EXEC(@sql)
	
	set @i = @i + 1
end

--create the new tables and indexes 
set @i = 1


while (@i <= @num_tables)
begin
	set @sql = N'create table defrag_part_table_'+cast(@i as nvarchar(5))+' (col1 as cast(left(col2, 1) as char(1)) PERSISTED NOT NULL , col2 char(32), col2a char(32), col2b char(32),col3 char(1000), col4 char(1000))'
	EXEC(@sql)

	set @sql = 'create clustered index IDX_CL_defrag_1_'+cast(@i as nvarchar(5))+' on defrag_part_table_'+cast(@i as nvarchar(5))+' (col1, col2a)'
	EXEC(@sql)

	set @sql = 'create nonclustered index IDX_NCL_defrag_2_'+cast(@i as nvarchar(5))+' on defrag_part_table_'+cast(@i as nvarchar(5))+' (col1, col2b) INCLUDE (col3)'
	EXEC(@sql)
	
	set @sql = 'create nonclustered index IDX_NCL_defrag_3_'+cast(@i as nvarchar(5))+' on defrag_part_table_'+cast(@i as nvarchar(5))+' (col1, col2b, col2a) INCLUDE (col4)'
	EXEC(@sql)	
	
	set @sql = 'create nonclustered index IDX_NCL_defrag_4_'+cast(@i as nvarchar(5))+' on defrag_part_table_'+cast(@i as nvarchar(5))+' (col1, col2) INCLUDE (col3)'
	EXEC(@sql)

	set @sql = 'create nonclustered index IDX_NCL_defrag_5_'+cast(@i as nvarchar(5))+' on defrag_part_table_'+cast(@i as nvarchar(5))+' (col2, col1) INCLUDE (col4)'
	EXEC(@sql)			
	
	set @i = @i +1
end

-- Populate the tables

set @i = 1
set @x = 1
set @max_rows = 5000

While (@i <= @num_tables)
begin
	set @sql = 'insert into defrag_part_table_'+cast(@i as nvarchar(5))+' (col2, col2a, col2b, col3, col4) Values (replace(newid(),''-'',''''), replace(newid(),''-'',''''), replace(newid(),''-'',''''), replicate(''X'',1000), replicate(''X'',1000))'
	while (@x <= @max_rows)
	begin
		EXEC(@sql)
		set @x = @x + 1
	end
	
	set @x = 1
	set @i = @i + 1
end


--View table stats
select * from sys.dm_db_index_physical_stats (db_id(),object_id('defrag_part_table_2'),2, NULL, 'LIMITED')