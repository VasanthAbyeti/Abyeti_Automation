/* Creates a database, which will create two files, then returns the information on the size of those files */
Use master
GO

DROP database DBSIZE
GO

CREATE database DBSIZE
GO

use DBSIZE
GO

select fileid,name,filename,(size)*8 as'KB Size'   from sysfiles
GO