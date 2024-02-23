use someshdb;

create table [tblEmployee]
(
	[Id] int primary key,
	[Name] nvarchar(50),
	[Salary] int ,
	[Gender] nvarchar(10),
	[City] nvarchar(50)
)

Execute sp_helpindex tblEmployee

insert into tblEmployee values(3,'John',4500,'Male','New York')
insert into tblEmployee values(1,'Sam',2500,'Male','London')
insert into tblEmployee values(4,'Sara',5500,'Female','Tokyo')
insert into tblEmployee values(5,'Todd',3100,'Male','Tormoto')
insert into tblEmployee values(2,'Pam',6500,'Female','Sydney')

select * from tblEmployee

-- create cluster indexs on columns Gender and Salary

create clustered index IX_tblEmployee_Gender_Salary
ON tblEmployee(Gender desc,Salary asc);

-- create non cluster index
create nonclustered index	IX_tblEmployee_Name
on tblEmployee(Name)

 -- unique
  insert into tblEmployee values(2,'Pavan',12500,'Male','Sydney')
  select * from tblEmployee


  -- create unique constraint

  alter table tblEmployee
  add constraint City
  unique clustered(City)