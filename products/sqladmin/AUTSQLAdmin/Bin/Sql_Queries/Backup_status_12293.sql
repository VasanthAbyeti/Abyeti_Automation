/* Add 3 databases, add a table to the database to be backed up, get a full backup of only 1 of 3 */
DROP DATABASE BACKEDUP
GO

DROP DATABASE NOBACKUP1
GO

DROP DATABASE NOBACKUP2
GO

CREATE DATABASE BACKEDUP
GO

CREATE DATABASE NOBACKUP1
GO

CREATE DATABASE NOBACKUP2
GO

use BACKEDUP
GO

CREATE TABLE NEW (c1 int, c2 varchar(32))
insert into NEW values (1,'Alpha')
insert into NEW values(2,'Beta')
insert into NEW values(3,'Charlie')
insert into NEW values(4,'Delta')
insert into NEW values(5,'Echo')
insert into NEW values(6,'Foxtrot')

BACKUP DATABASE BACKEDUP
TO DISK = 'c:\BACKEDUP.bak'