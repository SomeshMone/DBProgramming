use practiceDb;

select * from sales.customers;

  -- Distinct one column example

  select distinct state
  from sales.customers;

  --Distinct multiple column examples

  select distinct 
  city,state
  from sales.customers

  --Distinct with null values examples  
   select distinct
   phone
   from sales.customers;

   -- Where

   create schema production;

	create table production.products(product_id int, product_name text, category_id int, model_year int, list_price money);

	insert into production.products values 
	(280, 'bike', 1, 2012, 11120.54),
	(265, 'cycle', 1, 2010, 2000.54),
	(290, 'car', 1, 2016, 56120.54),
	(277, 'boat', 2, 2011, 45120.54),
	(269, 'ship', 2, 2016, 56120.54),
	(211, 'flight', 3, 2018, 99120.54),
	(214, 'helicopter', 1, 2018, 120.54);

	select product_id,product_name,category_id
	from production.products
	where category_id=1
	order by list_price desc

   
   -- Finding rows that meet two conditions :

   select product_id,product_name,category_id
   from production.products
   where category_id=1 and model_year=2016
   order by list_price desc;

   --Finding rows by using a comparision operator
   select
    product_id,
    product_name,
    category_id,
    model_year,
    list_price
	from
		production.products
	where
		list_price > 300 AND model_year = 2018
	order by
		list_price desc;

  
  -- Finding rows that meet any of two conditions

   select
    product_id,
    product_name,
    category_id,
    model_year,
    list_price
	from
		production.products
	where
		list_price > 300 or model_year = 2018
	order by
		list_price desc;


  -- Finding rows with the value between two values

    select
    product_id,
    product_name,
    category_id,
    model_year,
    list_price
	from
		production.products
	where
		list_price between 1000 and  15000
	order by
		list_price desc;


	-- Finding rows that have a value in a list of values

	select 
		product_id,
		product_name,
		category_id,
		model_year,
		list_price
	FROM
    production.products
	where list_price in  (11120.54, 56120.54, 489.99)
	order by list_price  desc;
 

  --Finding rows whose values contain a string
  -- the following example uses the LIKE operator to find products whose name contains the string Cruiser:

  select
		product_id,
		product_name,
		category_id,
		model_year,
		list_price
	from production.products
	where product_name like '%heli%'
	order by list_price;

	-- And

	--The following example finds the products where the category identification number is one and the list price is greater than 400:
	  
	  select * 
	  from production.products
	  where category_id=1 and list_price>400
	  order by list_price desc;

	  -- The following statement finds the products that meet all the following conditions: category id is 1, the list price is greater than 400, and the brand id is 1:
	  select *
	  from production.products
	  where category_id=1 and list_price>400 and model_year=2012;

	  -- Using the AND operator with other logical operators

	  select * 
	  from production.products
	  where category_id=1 or category_id=2 and list_price>400

	  -- To get the product whose brand id is one or two and list price is larger than 1,000, you use parentheses as follows:
	  select *
	  from production.products
	  where (category_id=1 or category_id=2) and list_price>1000
	  order by product_id

	  -- OR

	  -- The following example finds the products whose list price is less than 1000 or greater than 5000:
	  select *
	  from production.products
	  where list_price<1000 or list_price>5000
	  order by list_price;

	  --The following statement finds the products whose produc id is differnt:
	  select *
	  from production.products
	  where product_id=214 or product_id=280 or product_id=269

	  -- In operator

	  -- The following statement finds the products whose list price is one of the following values:
	  select * 
	  from production.products
	  where product_id in(214,280,269);

	   --The following statement finds the products whose list price is not in the following values:

	  select * 
	  from production.products
	  where product_id not in(214,280,269);

	  -- Between
	  -- The following query finds the products whose list prices are between 1000 and 5000:
	  select *
	  from production.products
	  where list_price between 1000 and 5000
	  order by list_price;

	  -- To get the products whose list prices are not in the range of 1000 and 5000, you use the NOT BETWEEN operator as follows:

	  select *
	  from production.products
	  where list_price not between 1000 and 5000
	  order by list_price;

	  --LIKE

	  -- The following example finds the products whose product name starts with the letter b:
	  select *
	  from production.products
	  where product_name like 'b%';

	  -- -- The following example finds the products whose product name ends with the letter b:
	  select *
	  from production.products
	  where product_name like '%t';

	  -- the following example finds prodcts starts with b and ends with t:
	  select *
	  from production.products
	  where product_name like 'b%t';

	  --  The _ (underscore) wildcard example

	  -- The underscore represents a single character. For example, the following statement returns the customers where the second character is the letter u:
select *
from sales.customers;
	select
    customer_id,
    first_name,
    last_name
	from
		sales.customers
	where
		last_name LIKE '_u%'
	order by
		first_name; 



	--  For example, the following query returns the customers where the first character in the last name is Y or Z:
	select *
	from sales.customers
	where last_name like '[BM]%'
	order by first_name;


	-- The [character-character] wildcard example
	-- The square brackets with a character range e.g., [A-C] represent a single character that must be within a specified range.

	select *
	from sales.customers
	where last_name like '[A-M]%'
	order by first_name;

	-- The [^Character List or Range] wildcard example
	-- For example, the following query returns the customers where the first character in the last name is not the letter in the range A through X

	 select *
	from sales.customers
	where last_name like '[^C-X]%'
	order by first_name;


	-- Alias

	-- combiing first_name and second name into one column 
	select first_name+' '+last_name as 'Full Name'
	from sales.customers;

	-- assigning alis name to column name
	select *
	from production.products;

	select product_name as 'Product Category'
	from production.products;



