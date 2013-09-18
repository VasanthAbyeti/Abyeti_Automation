use DefragDB
GO

DECLARE @db_id SMALLINT;
DECLARE @object_id INT;
SET @object_id = OBJECT_ID(N'defrag_part_table_1');
SET @db_id = DB_ID(N'DefragDB');

SELECT * from sys.dm_db_index_physical_stats(@db_id,@object_id,NULL,NULL,DEFAULT) 
order by index_id


