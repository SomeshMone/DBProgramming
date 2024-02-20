create database BasicsDb;

using BasicsDb;


-- Create

create table Persons(ID int primary key,FirstName varchar(25) not null,Lastname varchar(25) not null,Email varchar(100) unique,Age int check(Age>=18),
    City varchar(255) DEFAULT 'Kurnool');

 -- Retrieval
select * from Persons

INSERT INTO Persons (ID, FirstName, LastName, Email, Age, City) 
VALUES (1, 'Somsesh', 'Mone', 'somesh.mone06@gmail.com', 22, 'Kadapa'),
       (2, 'Siva', 'Venkata', 'siva1806@gmail.com', 25, DEFAULT);
insert into Persons values(3, 'Rajsekhar', 'Chenna', 'rajsekhar07@gmail.com',22,default);

select * from Persons

create table Orders(OrderId int primary key,OrderNumber int not null,PersonID int ,foreign key(PersonId) References Persons(ID));

insert into Orders values(1,3334,3),(2,7834,3),(3,5674,1),(4,3455,2)

select * from Orders

-- update table

update  Persons

set City='Anatapur'
 
where ID=3

-- Delete table 
delete from Persons
where City ='Kurnool' and ID=2



