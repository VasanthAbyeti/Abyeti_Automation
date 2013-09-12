/* script to set show advanced options and clr enabled to on for Server configuration options */

EXEC sp_CONFIGURE 'show advanced options' , '1';
GO
RECONFIGURE;
GO
EXEC sp_CONFIGURE 'clr enabled' , '1'
GO
RECONFIGURE;
GO