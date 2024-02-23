-- JOINS



create table Student(ROLL_NO int primary key,NAME varchar(30),ADDRESS varchar(30),PHONE varchar(25),Age int);
insert into Student values(1,'HARSH','DELHI','91-6281218798',18),
						  (2,'PRATIK','BIHAR','91-8074338423',19),
						  (3,'RIYANKA','SILIGURI','91-8688442684',20),
						  (4,'DEEP','RAMANAHAR','91-9985403186',18),
						  (5,'SAPTARHI','KOLKATA','91-9573661793',19),
						  (6,'DHANRAJ','BARABAJAR','91-6300685886',20),
						  (7,'ROHIT','BALURGHAT','91-7569951696',18),
						  (8,'DHANRAJ','ALIPUR','91-7569937831',19);
select * from Student;
create table StudentCourse(COURSE_ID INT,ROLL_NO int);
insert into StudentCourse values(1,1),
								(2,2),
								(2,3),
								(3,4),
								(1,5),
								(4,9),
								(5,10),
								(4,11);
	select * from StudentCourse

	-- Inner join

	select StudentCourse.COURSE_ID,Student.NAME,Student.Age
	from Student inner join StudentCourse on Student.ROLL_NO = StudentCourse.ROLL_NO;

	-- Left join

	select Student.NAME ,StudentCourse.COURSE_ID
	from Student left join StudentCourse on Student.ROLL_NO = StudentCourse.ROLL_NO;

	--Right Join

	select Student.NAME ,StudentCourse.COURSE_ID
	from Student right join StudentCourse on Student.ROLL_NO = StudentCourse.ROLL_NO;

	

	--Full join

	select Student.NAME ,StudentCourse.COURSE_ID
	from Student full join StudentCourse on Student.ROLL_NO = StudentCourse.ROLL_NO;

	--self join
	select distinct e.name ,s.age
	from Student e inner join Student s on e.Age=s.Age;
