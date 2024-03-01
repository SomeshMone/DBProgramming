create table EmployeeDept(Id int,Name varchar(30),Gender varchar(30),DeptId int);

insert into EmployeeDept values(1,'Sam','Male',1),
								(2,'Ram','Male',1),
								(3,'Sara','Female',3),
								(4,'Todd','Male',2),
								(5,'John','Male',3),
								(6,'Sana','Female',2),
								(7,'James','Male',1),
								(8,'Rob','Male',2),
								(9,'Steve','Male',1),
								(10,'Pam','Female',2);

select * from EmployeeDept;

create procedure spGetEmployees
as 
begin
	select Name,Gender from EmployeeDept
end

sp_helptext spGetEmployees

spGetEmployees

-- get Employees by alphabetic order
alter procedure spGetEmployees
as begin 
	select Name,Gender from EmployeeDept order by Name
end;

-- to delete a sp
drop proc spGetEmployees

spGetEmployeesByGenderAndDepartment @Gender='Male',@DeptId=1

create Proc spGetEmployeesByGenderAndDepartment
@Gender nvarchar(20),
@DeptId int
as
Begin
select Name,Gender,DeptId from EmployeeDept
End

sp_helptext spGetEmployeesByGenderAndDepartment


--Stored Procedure with output parameters

	create procedure spGetEmployeeCountByGender
	@Gender varchar(20),
	@EmployeeCount int output
	as
	Begin
		select @Employeecount=count(Id) from EmployeeDept where Gender=@Gender
	End

	Declare @TotalCount int
	Execute spGetEmployeeCountByGender 'Male',@TotalCount out
	if(@TotalCount is null)
		Print '@TotalCount is null'
	else
		print '@TotalCount is not null'
	Print @TotalCount

	-- sp_help prcoedure_name => view the information about the stored procedure

	-- sp_helptext procedure_name  => view the text of the stored procedure

	-- sp_depends procedure_name =>view the dependencies of the stored procedure


