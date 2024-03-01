use someshdb;

create table EmployeeDetails(id int,Name varchar(30),Salary int ,Gender varchar(30),DeptId int);

create table tr_EmployeeDetails(id int identity(1,1),Name varchar(30),updated_at date,operation varchar(30));



 
-- create trigger

create trigger tr_EmpployeeDetails
on EmployeeDetails
after insert
as 
begin
    insert into tr_EmployeeDetails (Name, updated_at, operation)
    select
        Name,
        GETDATE(),
        'insert'
    from inserted;
end;

insert into EmployeeDetails values(2,'Siva',30000,'Male',2);

select * from EmployeeDetails;
select * from tr_EmployeeDetails

create trigger tr_EmployeeDetails_ForDelete
on EmployeeDetails
after delete
as
begin
	insert into tr_EmployeeDetails (Name, updated_at, operation)
	select
		Name,
		GETDATE(),
		'delete'
	from deleted;
end;

delete from EmployeeDetails
where id=1
	
select * from EmployeeDetails
select * from tr_EmployeeDetails;

-- for updated triggert

create trigger tr_EmployeeDetails_ForUpdate
on EmployeeDetails
after update
as
begin
	insert into tr_EmployeeDetails (Name, updated_at, operation)
	select
		Name,
		GETDATE(),
		'update'
	from inserted;
end;

update EmployeeDetails
set Name='Somesh' where id=2;

	
	--instead of inserted triggers;
select * from EmployeeDetails;
select * from tr_EmployeeDetails;


select * from EmployeeDept;
select * from tblDepartment;

create view vEmployeeDept
as 
select Id,Name,Gender,DeptName
from EmployeeDept e inner join tblDepartment d on e.DeptId=d.DeptId

select * from vEmployeeDept;

-- it is not possible to insert values into a view 
insert into vEmployeeDept values (11,'Arun','Male','Finance')

create trigger tr_vEmployeeDept_InsteadOFInsert
on vEmployeeDept
instead of insert
as
begin
	declare @DeptId int
	select @DeptId=DeptId
	from tblDepartment inner join inserted on inserted.DeptName=tblDepartment.DeptName
	if(@DeptId is null)
	begin
		RAISERROR('Invalid Department Name',16,1)
		return 
	end
	insert into EmployeeDept(Id,Name,Gender,DeptId)
	select Id,Name,Gender,@DeptId
	from inserted
end;

select * from EmployeeDept;

--


update  vEmployeeDept set Name='Jay' where Id=5;

select * from vEmployeeDept;

create trigger tr_vEmployeeDept_InsteadOfUpdate
on vEmployeeDept
instead of update
as
begin
    -- Check if Id is being updated
    if(update(Id))
    begin
        RAISERROR('Id cannot be changed',16,1)
        return
    end

    -- Check if DeptName is being updated
    if(update(DeptName))
    begin    
        declare @DeptId int
        select @DeptId = DeptId
        from tblDepartment
        join inserted
        on inserted.DeptName = tblDepartment.DeptName

        if(@DeptId is null)
        begin
            RAISERROR('Invalid Department Name',16,1)
            return
        end
    end

    -- Update Gender if it's being updated
    if(update(Gender))
    begin
        update EmployeeDept 
        set Gender = inserted.Gender
        from inserted
        join EmployeeDept on EmployeeDept.Id = inserted.Id
    end

    -- Update Name if it's being updated
    if(update(Name))
    begin
        update EmployeeDept 
        set Name = inserted.Name
        from inserted
        join tblEmployee on tblEmployee.Id = inserted.Id
    end
end

select * from vEmployeeDept;

select * from EmployeeDept;
select * from tblDepartment;

update vEmployeeDept set DeptName='HR' where Id=5;
