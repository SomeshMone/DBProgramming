create database someshdb;

use someshdb;

--Create table =>C
create table Department(DeptNo int,Dept_Name varchar(30),location varchar(20))

--Insertion 
insert into Department (DeptNo,Dept_Name,location) values(10,'DBA','HYD'),(20,'SAP','MUMBAI'),(30,'HR','HYD')

--Retrieve table =>R
select * from Department

--update table => U

update Department set location ='Bangalore' where DeptNo=30

-- Delte table
delete from Department where DeptNo =20

