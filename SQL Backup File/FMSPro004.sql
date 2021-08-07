


--------------------------------Role Table
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblRole](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

Insert into tblRole values('Admin')
Insert into tblRole values('Faculty')
------------------------------------

---------------------------- Admin table for Login process 
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblAdmin](
	[UserName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Pass] [nvarchar](50) NULL,
	[RoleID] [int] NULL
) ON [PRIMARY]

GO
---------------------------------

-------------------------tblUser 

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblUser](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[user_name] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[city] [nvarchar](50) NULL,
	[Dist] [nvarchar](50) NULL,
	[status] [nvarchar](50) NULL,
	[question] [nvarchar](500) NULL,
	[Ans] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-------------------------------------------
--------------------ContactMe table
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblcontactme](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[messagetxt] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
---------

--------------------- Designation
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblDesignation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Designation] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
---------------------




-----------------------stored procedure for Login

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[usp_UsersCheckLoginDetails]
(
@UserName	nvarchar(50),
@Password	nvarchar(50)
)
AS
BEGIN
   SET NOCOUNT ON
   Select a.UserName,a.Email,a.Pass,b.RoleName from tblAdmin a with(nolock)
   inner join tblRole b on a.RoleID=b.RoleID 
    WHERE [Email]=@UserName AND [Pass] = @Password   
   
END
GO

------------------------------------------

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spSignup]
(
@Name nvarchar(50),
@Email nvarchar(50),
@Pass nvarchar(50),
@city nvarchar(50),
@dist nvarchar(50),
@status nvarchar(50),
@que nvarchar(50),
@ans nvarchar(50)

)
as
begin
Insert into tblUser(User_name,email,password,city,Dist,status,question,Ans) values(UPPER(@Name),@Email,@Pass,@city,@dist,@status,@que,@ans)
end
go
------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[CheckUserAvailabilityForAdmin]
      @Email VARCHAR(50)
AS
BEGIN
      SET NOCOUNT ON;
      IF NOT EXISTS(SELECT Email FROM tblAdmin
                    WHERE Email = @Email)
      BEGIN
            SELECT 'TRUE'
      END
      ELSE
      BEGIN
            SELECT 'FALSE'
      END
END
go
-------------------
---------------------------for faculty
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
create PROCEDURE [dbo].[CheckUserAvailability]
      @Email VARCHAR(50)
AS
BEGIN
      SET NOCOUNT ON;
      IF NOT EXISTS(SELECT Email FROM tblUser
                    WHERE Email = @Email)
      BEGIN
            SELECT 'TRUE'
      END
      ELSE
      BEGIN
            SELECT 'FALSE'
      END
END
GO
----------------------------------------------
--------------------Insert Signup

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spInserAdmin]
(
@UserName nvarchar(50),
@Email nvarchar(50),
@Pass nvarchar(50),
@RoleID int
)
as
begin

Insert into tblAdmin (UserName,Email,Pass,RoleID) values(@UserName,@Email,@Pass,@RoleID)
end
go
------------------
--------------

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spGetUserByUser]
(
@Email nvarchar(50)
)
as
begin
set nocount on;
select t1.[user_id],
	   t1.[user_name],
	   t1.email,
		t1.password,
		t1.city,
		t1.Dist,
		t1.status,
		t1.question,
		t1.Ans from tblUser as t1
		where t1.email=@Email
end
go
------------------------------------

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spUpdateUser]
(
@user_id int,
@Name nvarchar(50),
@Email nvarchar(50),
@Pass nvarchar(50),
@city nvarchar(50),
@dist nvarchar(50),
@status nvarchar(50),
@que nvarchar(50),
@ans nvarchar(50)

)
as
begin
update tblUser set [user_name]=UPPER(@Name),email=UPPER(@Email),password=(@Pass),city=(@city),Dist=(@dist),status=(@status),question=(@que),Ans=(@ans)
where user_id=@user_id
end
GO

----------------------------------------

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spDeleteUser]
(
@ID int
)
as
begin
delete from tblUser where user_id=@ID
end

go
-----------------------------------------

select * from tblAdmin
select * from tblUser
select * from tblRole
----------------
create table tblProfile
(
ID int identity(1,1) primary key,
FullName nvarchar(50),
Email nvarchar(50),
Mobile nvarchar(50)null,
Dept nvarchar(50)null,
Position nvarchar(50)null,
Addr nvarchar(500)null,
ImgName nvarchar(MAX)null,
ContentType nvarchar(50)null,
ProfileImage varbinary(max)null,
CreatedBy nvarchar(50)null,
ProfileStatus nvarchar(50)null
)
-------

------
create table tblEduQualification
(
EduID int identity(1,1) primary key,
ClassName nvarchar(50),
CollegeName nvarchar(200)null,
PassYear nvarchar(50)null,
Email nvarchar(50)null
)
----

---
create table tblExperience
(
ExpID int identity(1,1) primary key,
OrgName nvarchar(50),
Position nvarchar(200)null,
joinDate nvarchar(50)null,
TotExp nvarchar(50)null,
Email nvarchar(50)null
)

select ExpID,OrgName,Position,joinDate,TotExp from tblExperience 

select * from tblEduQualification

-------------------------------------

create table tblWorkshop
(
ID int identity(1,1)primary key,
NameOfFaculty nvarchar(50),
TitleOfWorkshop nvarchar(50),
OrganizedBy nvarchar(50),
WSDate nvarchar(50),
NoOfDays nvarchar(50),
WSLevel nvarchar(50),
WSType nvarchar(50),
CreatedBy nvarchar(50)

)
select * from tblWorkshop

create table tblClass
(
ID int identity(1,1) primary key,
Class Nvarchar(50)
)
select * from tblClass

create table tblDepartment
(
ID int identity(1,1),
Department nvarchar(50)
)
------------------------------------------


create table tblMember
(
ID int identity(1,1) primary key,
Membername nvarchar(50),
DepartmentID int,
Position nvarchar(50),
Salary nvarchar(50),
Email nvarchar(50),
Address1 nvarchar(500),
CreatedBy nvarchar(50)

)

select t1.ID,t1.Membername,t1.DepartmentID,t2.Department,t1.Position,t1.Salary,t1.Email,t1.Address1,t1.CreatedBy from tblMember as t1
left join tblDepartment as t2 on t1.DepartmentID=t2.ID

------------------
create table tblStudent
(
ID int identity(1,1) primary key,
StudentName nvarchar(50),
ClassID int,
Email nvarchar(50),
Addresss nvarchar(50),
CreatedBy nvarchar(50)

)


select t1.ID,t1.StudentName,t1.ClassID,t1.Email,t1.Addresss,t1.CreatedBy from tblStudent as t1
left join tblClass as t2 on t1.ClassID=t2.ID where t1.CreatedBy=@C

--------------------------
create procedure spGetClass

as
begin
set nocount on;
select ID ,Class from tblClass
end
go

----------------------

create table tblPayroll
(
ID int identity(1,1) primary key,
MemberID int,
MonthofPay nvarchar(50),
YearofPay nvarchar(50),
Salary decimal(18,2),
Deduction decimal(18,2),
TotSalary decimal(18,2),
PaymentDate datetime,
SalSatatus nvarchar(50),
createdBy nvarchar(50),

)


----------------
create procedure spgetMemberIDname

as
begin
select distinct ID,Membername from tblMember
end
go
-------------

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spGetUserByAllUser]

as
begin
set nocount on;
select t1.[user_id],
	   t1.[user_name],
	   t1.email,
		t1.password,
		t1.city,
		t1.Dist,
		t1.status,
		t1.question,
		t1.Ans from tblUser as t1
		
end

go

-------------------------------------------
create procedure spGetDepartment
as
begin
set nocount on;
select distinct ID,Department from tblDepartment
end
go

