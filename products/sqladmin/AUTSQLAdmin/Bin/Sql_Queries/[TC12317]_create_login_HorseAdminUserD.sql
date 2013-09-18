/*this script creates a login 'HorseAdminUserD'
in the server role 'sysadmin'
HorseAdminUserD login is disabled*/

use master
GO
Create login HorseAdminUserD
with password = N'abcd',
check_policy = OFF,
check_expiration = OFF;
GO
exec sp_addsrvrolemember
	@loginame = N'HorseAdminUserD',
	@rolename = N'sysadmin';
GO

ALTER LOGIN HorseAdminUserD disable;
