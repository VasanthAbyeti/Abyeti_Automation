/* This script creates a database SQLSearch with a table*/
use master 
go

if exists (select * from sys.sysdatabases where name='SQLSearch')
			drop database SQLSearch
			
create database SQLSearch
GO
		
use SQLSearch
GO

create table objectlist (names varchar(32), size int)

insert into objectlist values ('Alpha',1)
insert into objectlist values ('Beta',2)
insert into objectlist values ('Charlie',3)
insert into objectlist values ('Delta',4)
insert into objectlist values ('Echo',5)