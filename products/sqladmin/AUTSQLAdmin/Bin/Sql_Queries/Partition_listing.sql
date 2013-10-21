/* Returns the table, index and partition_scheme that was used */

select object_schema_name(i.object_id) as [schema],
    object_name(i.object_id) as [object],
    i.name as [index],
    s.name as [partition_scheme]
    from sys.indexes i
    join sys.partition_schemes s on i.data_space_id = s.data_space_id