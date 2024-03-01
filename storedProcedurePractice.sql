

	select 
		product_name,
		list_price
	from production.products
	order by
		product_name;

	-- create a stored procedure 

	create  procedure uspProductList
	as
	begin 
		select 
			product_name,
			list_price
		from production.products
		order by
			product_name
	end;


	-- execute stored procedure

	execute  uspProductList;

	-- alter stored procedure

	alter  procedure uspProductList
	as
	begin 
		select 
			product_name,
			list_price
		from production.products
		order by
			list_price
	end;

	exec uspProductList;


	-- deleting a procedure
	drop proc uspProductList;

	
	select 
		product_name,
		list_price
	from 
		production.products
	order by 
		list_price;


	--creating  a procedure

	create procedure uspFindProducts
	as 
	begin
		select 
			product_name,
			list_price
		from 
			production.products
		order by 
			list_price
	end;

	--this time we can add a parameter to the stored procedure to find the products whose list prices are greater than an input price:

	-- creating a stored procedure with single parameter

	alter procedure uspFindProducts(@min_list_price as decimal)
	as 
	begin
		select 
			product_name,
			list_price
		from 
			production.products
		where 
			list_price>=@min_list_price
		order by 
			list_price;
	end;

	exec uspFindProducts 200;

	-- creating a stored procedure with multiple parameter

	alter procedure uspFindProducts(@min_list_price as decimal,@max_list_price as decimal)
	as 
	begin
		select 
			product_name,
			list_price
		from 
			production.products
		where 
			list_price>=@min_list_price
			and list_price<=@max_list_price
		order by 
			list_price;
	end;

	exec uspFindProducts 900,1000;

	-- using named parameters

	EXECUTE uspFindProducts 
    @min_list_price = 900, 
    @max_list_price = 1000;


	-- creating text parameters

	alter procedure uspFindProducts(@min_list_price as decimal,@max_list_price as decimal,@name as varchar(30))
	as 
	begin
		select 
			product_name,
			list_price
		from 
			production.products
		where 
			list_price>=@min_list_price
			and list_price<=@max_list_price
			and product_name like '%'+@name+'%'
		order by 
			list_price;
	end;



	EXECUTE uspFindProducts 
    @min_list_price = 900, 
    @max_list_price = 1000,
    @name = 'Trek';


	-- creating optional parameters

	alter procedure uspFindProducts(@min_list_price as decimal =0,@max_list_price as decimal =99999,@name as varchar(30))
	as 
	begin
		select 
			product_name,
			list_price
		from 
			production.products
		where 
			list_price>=@min_list_price
			and list_price<=@max_list_price
			and product_name like '%'+@name+'%'
		order by 
			list_price;
	end;

	EXECUTE uspFindProducts 
    @name = 'Trek';


	-- variables

	/* The following SELECT statement uses the @model_year variable in the WHERE clause to find the products of a specific model year:*/

		DECLARE @model_year SMALLINT;

		SET @model_year = 2018;

		select
			product_name,
			model_year,
			list_price 
		from 
			production.products
		where 
			model_year = @model_year
		order by
			product_name;


	 -- storing a query result in variable

	 --  First, declare a variable named @product_count with the integer data type:
	 -- Second, use the SET statement to assign the query’s result set to the variable:
	 -- Third, output the content of the @product_count variable:

	 declare @product_count int;

	   

	   set @product_count=(
							select 
								count(*)
							from 
								production.products
							);

		SELECT @product_count;

		
		PRINT @product_count;


		-- The following stored procedure takes one parameter and returns a list of products as a string:

		 CREATE  PROC uspGetProductList(
				@model_year SMALLINT
			) AS 
			BEGIN
				DECLARE @product_list VARCHAR(MAX);

				SET @product_list = '';

				SELECT
					@product_list = @product_list + product_name 
									+ CHAR(10)
				FROM 
					production.products
				WHERE
					model_year = @model_year
				ORDER BY 
					product_name;

				PRINT @product_list;
			END;


		EXEC uspGetProductList 2018;


		-- stored procedure with output parameters

			create procedure uspFindProductByModel (
					@model_year smallint,
					@product_count int output
				) as
				begin
					select 
						product_name,
						list_price
					from
						production.products
					where
						model_year = @model_year;

					select @product_count = @@ROWCOUNT;
				end;

		@product_count INT OUTPUT;

		-- execution

		DECLARE @count INT;

		EXEC uspFindProductByModel
			@model_year = 2018,
			@product_count = @count OUTPUT;

		SELECT @count AS 'Number of products found';







		
		