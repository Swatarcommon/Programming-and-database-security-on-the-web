--3.	����������������� ������������� ���� ��� ����� ��������� � ���� ������.
USE ForMigration;

CREATE LOGIN SwatarCommon with PASSWORD = 'SwatarCommon';
CREATE LOGIN Tide with PASSWORD = 'Tide';
CREATE USER SwatarCommon for LOGIN SwatarCommon;
CREATE USER Tide for LOGIN Tide;

USE ForMigration;
EXEC sp_addrolemember 'db_datareader', 'SwatarCommon';
EXEC sp_addrolemember 'db_ddladmin', 'SwatarCommon';
DENY SELECT on ForMigration.dbo.TableMigr TO Tide;

GO
CREATE PROCEDURE us_proc_GetTableMigr
WITH EXECUTE AS 'SwatarCommon'
AS
SELECT * FROM ForMigration.dbo.TableMigr;

ALTER AUTHORIZATION ON  us_proc_GetTableMigr
TO SwatarCommon;

GRANT EXECUTE ON us_proc_GetTableMigr to Tide;

SETUSER 'Tide';
SELECT * FROM ForMigration.dbo.TableMigr;
EXEC us_proc_GetTableMigr;

--(TASK) ������� ��� ���������� SQL Server ������ ������. --������ ��� ���������� ������ ����������� ������������.
--��������� ��������� �����, ������������������ ������ ������.

USE MASTER;

CREATE SERVER AUDIT TableMigrAudit
TO FILE
(
 FILEPATH = 'D:\Studying\Course_3\Second_2sem\Web-Database\Labs\Lab_10',
 MAXSIZE = 100 MB
)
WITH (QUEUE_DELAY = 1000, ON_FAILURE = CONTINUE);

alter server audit TableMigrAudit with ( state = on );

select * from fn_get_audit_file( 'D:\Studying\Course_3\Second_2sem\Web-Database\Labs\Lab_10\TableMigrAudit_DC448363-194D-4E74-A0CC-7EDBE3978F24_0_132352176949800000.sqlaudit', null, null ) order by event_time desc,sequence_number

--(7-9) ������� ����������� ������� ������.
-- ������ ��� ������ ����������� ������������.
-- ��������� ����� ��, ������������������ ������ ������

USE ForMigration  
GO    
CREATE DATABASE AUDIT SPECIFICATION Specification_TableMigrAudit
FOR SERVER AUDIT TableMigrAudit
add ( select on object::[dbo].[TableMigr] by [public]);

alter database AUDIT SPECIFICATION Specification_TableMigrAudit with (state = on);
GO
--10.	���������� ����� �� � �������
alter server audit TableMigrAudit with ( state = off );
alter database AUDIT SPECIFICATION Specification_TableMigrAudit with (state = off);

--11.	������� ��� ���������� SQL Server ������������� ���� ����������.
USE ForMigration
GO
CREATE ASYMMETRIC KEY Labakey   
    WITH ALGORITHM = RSA_2048   
    ENCRYPTION BY PASSWORD = 'Laba';   
GO  
--12.	����������� � ������������ ������ ��� ������ ����� �����.
GO
USE ForMigration

CREATE TABLE CryptoCard
(
	PersonID int PRIMARY KEY IDENTITY,
	CreditCardNumber varbinary(max)
)
GO

INSERT INTO CryptoCard(CreditCardNumber)
VALUES (ENCRYPTBYASYMKEY( AsymKey_ID('Labakey') , N'1111-2222-3333-4444'))
GO
SELECT * FROM CryptoCard
GO

SELECT PersonID, CONVERT(nvarchar(max),  DecryptByAsymKey( AsymKey_Id('Labakey'), CreditCardNumber, N'Lab10'))   
,DecryptByAsymKey( AsymKey_Id('Labakey'), CreditCardNumber, N'Lab10')
AS DecryptedData   
FROM CryptoCard
GO  

USE ForMigration
--13.	������� ��� ���������� SQL Server ����������.
create certificate SampleCert
encryption by password = N'123456789'
with subject = N'Creation Target',
Expiry_DATE = N'28/10/2022';

USE ForMigration
--14.	����������� � ������������ ������ ��� ������ ����� �����������.
INSERT INTO [dbo].[CryptoCard] values(EncryptByCert(Cert_ID('SampleCert'), N'��������� ������'));
GO
SELECT * FROM [dbo].[CryptoCard]
GO
SELECT (Convert(Nvarchar(100), DecryptByCert(Cert_ID('SampleCert'), CryptoCard.CreditCardNumber, N'123456789'))) FROM [dbo].[CryptoCard];
GO

--15.	������� ��� ���������� SQL Server ������������ ���� ���������� ������.
--drop Symmetric key SKey
USE ForMigration
create Symmetric key SKey
WITH ALGORITHM = AES_256  
ENCRYPTION BY PASSWORD = '123456789';

Open symmetric key SKey
Decryption by password = '123456789'
create Symmetric key SData
with Algorithm =  AES_256
encryption by symmetric key SKey;

Open symmetric key SData 
Decryption by symmetric key SKey;

create Master key encryption by password = N'StRoNgPa$$w0Rd';

-- 16.	����������� � ������������ ������ ��� ������ ����� �����.

USE ForMigration
INSERT INTO [dbo].[CryptoCard] VALUES (ENCRYPTBYKEY( Key_GUID('SData') , N'Secret Data'))
GO
SELECT * FROM [dbo].[CryptoCard]
GO
--������������� � ������� ������������ �����.
SELECT [PersonID], CONVERT(nvarchar(max),  DecryptByKey( [CreditCardNumber])) AS DecryptedData  FROM [dbo].[CryptoCard]
GO 

--17.	������������������ ���������� ���������� ���� ������.

USE master;  
GO  
CREATE MASTER KEY ENCRYPTION BY PASSWORD = '<UseStrongPasswordHere>';  
go
CREATE CERTIFICATE MyServerCert WITH SUBJECT = 'My DEK Certificate';  
go
  
USE ForMigration
GO  
CREATE DATABASE ENCRYPTION KEY  
WITH ALGORITHM = AES_128  
ENCRYPTION BY SERVER CERTIFICATE MyServerCert;  
GO  
ALTER DATABASE ForMigration  
SET ENCRYPTION ON;  
GO  

--18.	������������������ ���������� �����������.
select HASHBYTES('SHA1', 'Hesh example');

--19.	������������������ ���������� ����������� �������(���) ��� ������ �����������.
GO
select SignByCert(Cert_Id( 'SampleCert' ),'Secrect Info', N'123456789')

--20.	������� ��������� ����� ����������� ������ � ������������.
Backup certificate SampleCert
to File = N'D:\Studying\Course_3\Second_2sem\Web-Database\Labs\Lab_10\BackupSampleCert.cer'
with private key (
File = N'D:\Studying\Course_3\Second_2sem\Web-Database\Labs\Lab_10\BackupSampleCert.pvk',
Encryption by password = N'123456789',
Decryption by password = N'123456789');





