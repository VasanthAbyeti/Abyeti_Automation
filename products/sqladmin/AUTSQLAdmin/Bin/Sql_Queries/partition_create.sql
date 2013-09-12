/* Uses Northwind, 
  creates three filegroups,
  creates a table and adds data, 
  creates a partition function, 
  creates a partition scheme using the new filegroups, 
  creates a clustered index on the new table using the new partition scheme */

Drop DataBase [Northwind]
GO

Create Database [Northwind]
GO

use Northwind
GO

ALTER DATABASE Northwind ADD FILEGROUP FG1
GO

ALTER DATABASE Northwind ADD FILEGROUP FG2
GO

ALTER DATABASE Northwind ADD FILEGROUP FG3
GO

create table part (c1 int, c2 varchar(64))
GO

insert into part values(1,'Alpha')
insert into part values(1,'Beta')
insert into part values(1,'Charlie')
insert into part values(1,'Delta')
insert into part values(1,'Echo')
insert into part values(1,'Foxtrot')
GO

CREATE PARTITION FUNCTION myPart1 (int)
AS RANGE LEFT FOR VALUES (1,100,1000)
GO

CREATE PARTITION SCHEME myscheme1 AS PARTITION [myPart1] TO ([PRIMARY],[FG1],[FG2],[FG3])
GO

CREATE CLUSTERED INDEX cluster_part ON part
(
	c1 ASC
	) ON myscheme1(c1)

GO