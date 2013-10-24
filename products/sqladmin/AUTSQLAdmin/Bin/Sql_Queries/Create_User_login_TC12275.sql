Drop DataBase CloneDB
Go

Create database CloneDB
GO

USE [master]
GO
drop user TempUser1
drop login TempUser1

drop user TempUser
drop login TempUser

----Step 1

USE [master]
GO
CREATE LOGIN [TempUser] WITH PASSWORD=N'tempuser' MUST_CHANGE, DEFAULT_DATABASE=[master], CHECK_EXPIRATION=ON, CHECK_POLICY=ON
GO
EXEC master..sp_addsrvrolemember @loginame = N'TempUser', @rolename = N'securityadmin'
GO
USE [master]
GO
CREATE USER [TempUser] FOR LOGIN [TempUser]
GO
USE [master]
GO
EXEC sp_addrolemember N'db_datawriter', N'TempUser'
GO
USE [master]
GO
EXEC sp_addrolemember N'db_ddladmin', N'TempUser'
GO
USE [master]
GO
EXEC sp_addrolemember N'db_owner', N'TempUser'
GO
USE [master]
GO
EXEC sp_addrolemember N'db_securityadmin', N'TempUser'
GO


----step2
---creating a temperory table

use [master]
GO
Drop table temp_table
CREATE TABLE temp_table (col1 varchar,col2 varchar, col3 varchar)
use [master]
GO
Drop table temp_table1
CREATE TABLE temp_table1 (col1 varchar,col2 varchar, col3 varchar)
use [master]
GO
Drop table temp_table2
CREATE TABLE temp_table2 (col1 varchar,col2 varchar, col3 varchar)
---for a Table

use [master]
GO
GRANT SELECT ON [dbo].[temp_table] TO [TempUser]
GO

---for View

use [master]
GO
GRANT SELECT ON [sys].[all_columns] TO [TempUser]
GO


---for SP

use [master]
GO
GRANT EXECUTE ON [dbo].[sp_MScleanupmergepublisher] TO [TempUser]
GO



----Step 3
--for a Table

use [master]
GO
GRANT SELECT ON [dbo].[temp_table1] TO [TempUser] WITH GRANT OPTION
GO


--for View

use [master]
GO
GRANT SELECT ON [sys].[all_columns] TO [TempUser] WITH GRANT OPTION
GO


--for SP

use [master]
GO
GRANT EXECUTE ON [dbo].[sp_MScleanupmergepublisher] TO [TempUser] WITH GRANT OPTION
GO

----Step4
--for a Table

use [master]
GO
DENY SELECT ON [dbo].[temp_table2] TO [TempUser] CASCADE
GO


--for View

use [master]
GO
DENY SELECT ON [sys].[all_columns] TO [TempUser]  CASCADE
GO


--SP
use [master]
GO
DENY EXECUTE ON [dbo].[sp_MScleanupmergepublisher] TO [TempUser] CASCADE
GO

