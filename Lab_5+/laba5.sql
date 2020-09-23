go
use LNZ;

CREATE TABLE laba5(
  hid hierarchyid NOT NULL,
  userId int NOT NULL,
  userName nvarchar(50) NOT NULL,
CONSTRAINT PK_laba5 PRIMARY KEY CLUSTERED 
(
  [hid] ASC
));



insert into laba5 values(hierarchyid::GetRoot(), 1, 'Worker1'); 
select * from laba5;

go
declare @Id hierarchyid  
select @Id = MAX(hid) from laba5 where hid.GetAncestor(1) = hierarchyid::GetRoot() ; 
insert into laba5 values(hierarchyid::GetRoot().GetDescendant(@id, null), 2, 'Worker2');

go
declare @Id hierarchyid
select @Id = MAX(hid) from laba5 where hid.GetAncestor(1) = hierarchyid::GetRoot() ;
insert into laba5 values(hierarchyid::GetRoot().GetDescendant(@id, null), 3, 'Worker3');
 
go
declare @phId hierarchyid
select @phId = (SELECT hid FROM laba5 WHERE userId = 2);
declare @Id hierarchyid
select @Id = MAX(hid) from laba5 where hid.GetAncestor(1) = @phId;
insert into laba5 values( @phId.GetDescendant(@id, null), 4, 'Worker4');

select hid.ToString(), hid.GetLevel(), * from laba5; 

--2------------------------------------------
GO  
CREATE PROCEDURE SelectRoot(@level int)    
AS   
BEGIN  
   select hid.ToString(), * from laba5 where hid.GetLevel() = @level;
END;

  drop procedure SelectRoot;

GO  
exec SelectRoot 1;

--3---------------------------------------------
GO  
CREATE PROCEDURE AddDocherRoot(@UserId int,@UserName nvarchar(50))   
AS   
BEGIN  
declare @Id hierarchyid
declare @phId hierarchyid
select @phId = (SELECT hid FROM laba5 WHERE UserId = @UserId);

select @Id = MAX(hid) from laba5 where hid.GetAncestor(1) = @phId

insert into laba5 values( @phId.GetDescendant(@id, null),@UserId,@UserName);
END;  

  drop procedure AddDocherRoot;

GO  
exec AddDocherRoot 3, 'Us4';
select * from laba5; 
-------
go
CREATE PROCEDURE MovRoot(@old_uzel int, @new_uzel int )
AS  
BEGIN  
DECLARE @nold hierarchyid, @nnew hierarchyid  
SELECT @nold = hid FROM laba5 WHERE UserId = @old_uzel ;  
  
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE  
BEGIN TRANSACTION  
SELECT @nnew = hid FROM laba5 WHERE UserId = @new_uzel ; 
  
SELECT @nnew = @nnew.GetDescendant(max(hid), NULL)   
FROM laba5 WHERE hid.GetAncestor(1)=@nnew ; 
UPDATE laba5   
SET hid = hid.GetReparentedValue(@nold, @nnew)   
WHERE hid.IsDescendantOf(@nold) = 1 ;   
 commit;
  END ;  

    drop procedure MovRoot;
GO  

----
exec MovRoot 2,3
select hid.ToString(), hid.GetLevel(), * from laba5;

truncate table laba5