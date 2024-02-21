-- set operators

 create table sales.staff (
    staff_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20),
    active bit,
    store_id INT,
    manager_id INT);

  insert into sales.staff (staff_id, first_name, last_name, email, phone, active, store_id, manager_id)
values
(1, 'John', 'Doe', 'john.doe@example.com', '123-456-7890', 1, 1, null),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '987-654-3210', 1, 1, 1),
(3, 'Michael', 'Johnson', 'michael.johnson@example.com', '555-123-4567', 0, 2, 2);

 INSERT INTO sales.staff (staff_id, first_name, last_name, email, phone, active, store_id, manager_id)
VALUES
(4, 'Emily', 'Davis', 'emily.davis@example.com', '111-222-3333', 1, 2, 2),
(5, 'David', 'Brown', 'david.brown@example.com', '444-555-6666', 1, 2, 2),
(6, 'Sarah', 'Wilson', 'sarah.wilson@example.com', '777-888-9999', 1, 3, 6),
(7, 'Matthew', 'Martinez', 'matthew.martinez@example.com', '123-456-7890', 1, 3, 6);
INSERT INTO sales.staff (staff_id, first_name, last_name, email, phone, active, store_id, manager_id)
VALUES
(8, 'Somesh', 'Mone', 'somesh.mone@example.com', '111-222-3333', 1, 2, 2);



	select * from sales.staff;
	-- to remove duplicates rows we use union
	SELECT first_name, last_name
	FROM sales.customers
	UNION
	SELECT first_name, last_name
	FROM sales.staff;

	-- to include duplicate rows we use union all
	SELECT first_name, last_name
	FROM sales.customers
	UNION  ALL
	SELECT first_name, last_name
	FROM sales.staff;

	-- to sort the first names and last names of customers and staff, you use the following query:
	SELECT first_name, last_name
	FROM sales.customers
	UNION  ALL
	SELECT first_name, last_name
	FROM sales.staff
	ORDER BY first_name,last_name;

	-- Except

	-- Create table for session A
		CREATE TABLE session_A (
			employee_id INT,
			employee_name VARCHAR(50)
		);

		-- Create table for session B
		CREATE TABLE session_B (
			employee_id INT,
			employee_name VARCHAR(50)
		);

		-- Insert sample data into session A
		INSERT INTO session_A (employee_id, employee_name) VALUES
		(1, 'John'),
		(2, 'Jane'),
		(3, 'Michael'),
		(4, 'Emily');

		-- Insert sample data into session B
		INSERT INTO session_B (employee_id, employee_name) VALUES
		(2, 'Jane'),
		(3, 'Michael'),
		(5, 'David');

		SELECT employee_id, employee_name
		FROM session_A
		EXCEPT
		SELECT employee_id, employee_name
		FROM session_B;


		-- intersection

		 --Intersect

		CREATE TABLE STUDENTS(
		   ID INT NOT NULL, 
		   NAME VARCHAR(20) NOT NULL, 
		   SUBJECT VARCHAR(20) NOT NULL, 
		   AGE INT NOT NULL, 
		   HOBBY VARCHAR(20) NOT NULL, 
		   PRIMARY KEY(ID));

		   INSERT INTO STUDENTS VALUES
		(1, 'Naina', 'Maths', 24, 'Cricket'),
		(2, 'Varun', 'Physics', 26, 'Football'),
		(3, 'Dev', 'Maths', 23, 'Cricket'),
		(4, 'Priya', 'Physics', 25, 'Cricket'),
		(5, 'Aditya', 'Chemistry', 21, 'Cricket'),
		(6, 'Kalyan', 'Maths', 30, 'Football');

		CREATE TABLE STUDENTS_HOBBY(
		   ID INT NOT NULL, 
		   NAME VARCHAR(20) NOT NULL, 
		   HOBBY VARCHAR(20) NOT NULL, 
		   AGE INT NOT NULL, 
		   PRIMARY KEY(ID)
		);

		INSERT INTO STUDENTS_HOBBY VALUES
		(1, 'Vijay', 'Cricket', 18),
		(2, 'Varun', 'Football', 26),
		(3, 'Surya', 'Cricket', 19),
		(4, 'Karthik', 'Cricket', 25),
		(5, 'Sunny', 'Football', 26),
		(6, 'Dev', 'Cricket', 23);

		select *
		from STUDENTS;

		select *
		from STUDENTS_HOBBY;

		--WAQD intersect of above two tables:
		SELECT NAME, AGE, HOBBY FROM STUDENTS_HOBBY
		INTERSECT 
		SELECT NAME, AGE, HOBBY FROM STUDENTS;

		-- Except

		SELECT NAME, HOBBY, AGE FROM STUDENTS
		EXCEPT 	
		SELECT NAME, HOBBY, AGE FROM STUDENTS_HOBBY;