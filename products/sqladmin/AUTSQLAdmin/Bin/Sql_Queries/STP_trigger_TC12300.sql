DROP DATABASE Northwind
GO

CREATE DATABASE Northwind
GO

use Northwind
GO


Create table genius (ID int NOT NULL, Name varchar(32))

insert into genius values (1, 'Person One')
insert into genius values (2, 'Person Two')
insert into genius values (3, 'Person Three')
insert into genius values (4, 'Person Four')

create table colleges (ID int NOT NULL, Name varchar(32))

insert into colleges values (1, 'University of Houston')
insert into colleges values (2, 'University of Texas')
insert into colleges values (3, 'University of Florida')
insert into colleges values (4, 'University of California')


/* This adds a new column on the genius table called college */
alter table genius add  college int


/* This adds a unique index on the genius table for the ID column*/
create unique index genius_byid on genius(ID)

/* This adds a clustered primary key to genius and colleges, primary key is a special index */
alter table colleges add constraint PK_colleges PRIMARY KEY CLUSTERED ([ID] ASC)
alter table genius add constraint PK_genius PRIMARY KEY CLUSTERED ([ID] ASC)

/* This adds a Foreign Key Constraint to genius.  You will not be able to enter a value for college that does not exist in the colleges table */
alter table genius add constraint FK_colleges FOREIGN KEY (college) references Colleges(ID)
GO


/* Adds a stored procedure to call when you add a new genius */
CREATE PROCEDURE [dbo].[add_genius] @name varchar(32), @college varchar(32)
AS

DECLARE 
@college_id int,
@genius_id int,
@IDC int,
@IDG int

select @college_id = ID from colleges where Name = @college

if @college_id is NULL
 BEGIN
 set @IDC = (select MAX(ID) from colleges) + 1
 INSERT into colleges values (@IDC,@college)
 select @college_id = ID from colleges where Name = @college
 END
 
else
 BEGIN
 select @college_id = ID from colleges where Name = @college
 END

select @genius_id = ID  from genius where Name = @name

if @genius_id is NULL
 BEGIN
 set @IDG = (select MAX(ID) from genius) + 1
 INSERT into genius(ID,Name,college) values (@IDG,@name, @college_id)
 END
else 
 print 'Thie genius already exists , man!'
RETURN
GO



/* create a table to store geniuses that have been removed from the genius table */
create table ex_genius (ID int IDENTITY(1,1), name varchar(32))
GO


/* Create a trigger on the delete action that adds the user to the ex_genius table when removed from the genius table */
create trigger remove_genius
ON genius
AFTER DELETE
AS
BEGIN
SET NOCOUNT ON

Declare
@oldname varchar(32)

select @oldname = name from deleted

insert into ex_genius (Name) values (@oldname)

END
GO