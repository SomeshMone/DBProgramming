create database practicedb;

use practicedb;

create schema sales

create table sales.customers(customer_id int,first_name varchar(40),last_name varchar(40),phone varchar(20),email varchar(50),street varchar(50),city varchar(50),state varchar(30),zip_code varchar(20));

insert into sales.customers (customer_id, first_name, last_name, phone, email, street, city, state, zip_code) VALUES
(1,'Debra','Burks',NULL,'debra.burks@yahoo.com','9273 Thome Ave','Orchard Park','NY','14127'),
(2,'Kasha','Todd',NULL,'kasha.todd@yahoo.com','910 Vine Street','Campbell','CA','95008'),
(3,'Daryl','Spence',NULL,'daryl.spence.com','769C Honey.Creek St','Redondo Beach','CA','90278'),
(4,'Tameka','Fisher',NULL,'tameka.fisher@aol.com','9688 Pearl Lane','Uniondale','NY','11553'),
(5,'Charolette','Rice','(916) 381-6003','charolette.rice@msn.com','988 15 Brown St','Sacramento','CA','95820'),
(6,'Lyndsey','Bean',NULL,'lyndsey.bean@hotmail.com','107 River Dr.','Fairport','NY','14450'),
(7,'Latasha','Hays','(716) 986-3359','latasha.hays@hotmail.com','769 West Road','Buffalo','NY','14215'),
(8,'Jacquline','Duncan',NULL,'jacquline.duncan@yahoo.com','7014 Manor Station Road','Jackson Heights','NY','11372'),
(9,'Genvoveva','Baldwin',NULL,'genoveva.baldwin@msn.com','8550 Spruce Drive','Port Washington','NY','11050'),
(10,'Pamelia','NewMan',NULL,'pamelia.newman@gmail.com','476 Chestnut Ave','Monroe','NY','10950');


/*  The following illustrates the most basic form of the SELECT statement:*/
 
select * from 

sales.customers

/* A) SQL Server SELECT – retrieve some columns of a table example
The following query finds the first name and last name of all customers:*/

select  first_name,last_name
from sales.customers;

/* The following statement returns the first names, last names, and emails of all customers:*/4

select first_name,last_name,email
from sales.customers;

/* B) SQL Server SELECT – retrieve all columns from a table example
To get data from all table columns, you can specify all the columns in the select list. You can also use SELECT * as a shorthand to save some typing:*/

select * 
from sales.customers;



/* C) SQL Server SELECT – sort the result set
To filter rows based on one or more conditions, you use a WHERE clause as shown in the following example:*/

select *
from sales.customers
where state='NY';

/* To sort the result set based on one or more columns, you use the ORDER BY clause as shown in the following example:*/

select *
from sales.customers
order by first_name;


/* D) SQL Server SELECT – group rows into groups example
To group rows into groups, you use the GROUP BY clause. For example, the following statement returns all the cities of customers located in California and the number of customers in each city.*/

select city,count(*) as no_of_customers
from sales.customers
where state='NY'
group by city
order by city;

/* E) SQL Server SELECT – filter groups example
To filter groups based on one or more conditions, you use the HAVING clause. The following example returns the city in California which has more than ten customers*/

select city,count(*) as no_of_customers
from sales.customers
where state='NY'
group by city
having count(*)>=1
order by city desc
