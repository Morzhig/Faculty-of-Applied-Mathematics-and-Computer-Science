Create database Ucheb_0
On primary(Filename = 'D:\Programming\Microsoft SQL Server\MSSQL15.SQLEXPRESS1\MSSQL\DATA\Ucheb_4.mdf')
For attach;

use master 
EXEC SP_HELPDB Lab4

use master 
EXEC SP_RENAMEDB Ucheb_0, Ucheb_5;