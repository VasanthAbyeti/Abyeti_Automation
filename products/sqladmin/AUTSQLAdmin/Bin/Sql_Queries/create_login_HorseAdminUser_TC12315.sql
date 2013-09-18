/*this script creates a login 'HorseAdminUser'
in the server role 'sysadmin'*/

use master
GO
Create login HorseAdminUser
with password = N'abcd',
check_policy = OFF,
check_expiration = OFF;
GO
exec sp_addsrvrolemember
	@loginame = N'HorseAdminUser',
	@rolename = N'sysadmin';
GO