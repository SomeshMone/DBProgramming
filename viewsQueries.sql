use someshdb;


create table tblDepartment(DeptId int,DeptName varchar(30));

insert into tblDepartment values(1,'IT'),
								(2,'Payroll'),
								(3,'HR'),
								(4,'Admin');
select * from tblDepartment;

--creating a view


create view vEmployeeByDeptName
as
select Id,Name,Salary,Gender,DeptName
from tblEmployee
inner join tblDepartment on tblEmployee.Id=tblDepartment.DeptId;

-- retrieving a records from view table or virtual table

select * from vEmployeeByDeptName;

-- create view IT Employee views
		create view vEmployeeITDept
		as
		select Id,Name,Salary,Gender,DeptName
		from tblEmployee
		inner join tblDepartment on tblEmployee.Id=tblDepartment.DeptId
		where tblDepartment.DeptName='IT';

	select * from  vEmployeeITDept;

	-- apply aggregate function on view let'see example
	create view vWSummarizedData
	as
	select DeptName,count(Id) as TotalEmployees
	from tblEmployee
	inner join tblDepartment on tblEmployee.Id=tblDepartment.DeptId
	group by DeptName

	select * from  vWSummarizedData;


	-- update

	update vEmployeeByDeptName
	set DeptName='HR' where Name='Pavan';

	select * from vEmployeeByDeptName;

	select * from tblEmployee;
	select * from tblDepartment;