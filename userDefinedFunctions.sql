-- scalar functions

use [Bike Stores]

		create function sales.udfNetSale(
		@quantity int,
		@list_price dec(10,2),
		@discount	dec(4,2))
		returns dec(10,2)
		as 
		begin
			return  @quantity * @list_price * (1 - @discount);
		end;

	select sales.udfNetSale(10,100,0.1) as net_sale;



	-- The following example illustrates how to use the sales.udfNetSale function to get the net sales of the sales orders in the order_items table:

		select 
			order_id, 
			sum(sales.udfNetSale(quantity, list_price, discount)) net_amount
		from 
			sales.order_items
		group by 
			order_id
		order by
			net_amount desc;


	-- to drop a function 

	drop function sales.udfNetSale;

	-- table valued functions

		 create function udfProductInYear (
				@model_year int
			)
			returns table
			as
			return
				select 
					product_name,
					model_year,
					list_price
				from
					production.products
				where
					model_year = @model_year;

		select * from
			udfProductInYear(2018);

	-- alter table

		alter function udfProductInYear (
				@start_year int,
				@end_year int
			)
			returns table
			as
			return
				select 
					product_name,
					model_year,
					list_price
				from
					production.products
				where
					model_year between @start_year and @end_year;
		select * from
			udfProductInYear(2018,2020);


	-- multiple valued tabled functions

			create function udfContacts()
					returns @contacts TABLE (
						first_name VARCHAR(50),
						last_name VARCHAR(50),
						email VARCHAR(255),
						phone VARCHAR(25),
						contact_type VARCHAR(20)
					)
				as
				begin
					insert into @contacts
					select 
						first_name, 
						last_name, 
						email, 
						phone,
						'Staff'
					from
						sales.staffs;

					insert into @contacts
					select 
						first_name, 
						last_name, 
						email, 
						phone,
						'Customer'
					from
						sales.customers;
					return;
				END;

			select * from udfContacts()
					


		




