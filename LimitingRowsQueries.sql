use practicedb;

	insert into sales.customers values(12,'Siva','Venkata','91-8074338423','sivavenkata6@gmail.com','Kadapa','Buffalo','NY','12647');
	select * 
	from sales.customers;



	--The following query returns all the city and their zipcode

	select city,zip_code
	from sales.customers
	order by city,zip_code;

	--To skip the first 5 rows and return the rest, you use the OFFSET clause as shown in the following statement:

	select city,zip_code
	from sales.customers
	order by city,zip_code
	offset 5 rows;


	-- To skip the first 5 products and select the next 5 cities, you use both OFFSET and FETCH clauses as follows:
	select city,zip_code
	from sales.customers
	order by city,zip_code
	offset 5 rows
	fetch next 5 rows only;

	-- select first 4 largest numbers zip code and their city using both offset and fetch

	select city,zip_code
	from sales.customers
	order by zip_code desc,city
	offset 0 rows
	fetch next 4 rows only;


	-- select top 5 largest zip code
	select top 5  city,zip_code
	from sales.customers
	order by zip_code desc

	-- get 50 percent of rows from table here total 13 rows in customers table , 50% means 6 rows retrieved

	insert into sales.customers values(13,'Rajsekhar','Chenna','91-6281218798','rajsekahrvenkata6@gmail.com','Kadapa','Campvell','NY','90278');

	select top 50 percent 
	city,zip_code
	from sales.customers
	order by zip_code desc

	-- The following statement returns the top three largest zipcodes:

	select top 3 with ties
	city,zip_code
	from sales.customers
	order by zip_code desc

