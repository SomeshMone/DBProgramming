select * from tblEmployee;

create table Employee(Id int,Name varchar(30),Salary int,Gender char(30),City varchar(30));
insert into Employee values(1,'Sam',2500,'Male','Kurnool'),
							(2,'Todd',3100,'Male','Chennai'),
							(3,'John',4500,'Male','Adoni'),
							(4,'Pavan',6000,'Male','Kurnool'),
							(5,'Sara',1000,'Female','Kadapa'),
							(6,'Pam',3000,'Female','Yemmiganur');
select * from Employee;

-- Retrieve the names of employees in alphabetical order.

	select Name
	from Employee
	order by Name;

	-- Retrieve the names and salaries of the first 5 highest-paid employees.

	select top 5 Name,Salary
	from Employee
	order by Salary desc;

	-- Retrieve the names of employees whose names start with the letter 'A'.
	insert into Employee values(6,'Amar',3700,'Male','Anatapur'),(7,'Anjali',4000,'Female','Bangalore');

	-- starts with A 

	select Name,Salary
	from Employee
	where Name like 'A%';

	--Skip first 2 data and retrieve next data from table.

	select Name,Salary ,Gender
	from Employee
	order by Salary desc
	offset 2 rows fetch next 1 row only;

	--Inner join

	select * from Student;
	select * from StudentCourse;

	-- inner join
	select s.ROLL_NO,s.NAME,sc.COURSE_ID 
	from Student s
	inner join StudentCourse sc
	on s.ROLL_NO=sc.ROLL_NO;

	--left join
	select s.ROLL_NO,s.NAME,sc.COURSE_ID 
	from Student s
	left join StudentCourse sc
	on s.ROLL_NO=sc.ROLL_NO;



	
	