/* Get the recovery model value for the SQLSearch_TestDB */
SELECT name, 
       DATABASEPROPERTYEX(name, 'Recovery'),
       DATABASEPROPERTYEX(name, 'Status')
FROM   master.dbo.sysdatabases
WHERE name ='SQLSearch_TestDB'