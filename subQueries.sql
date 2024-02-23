
-- BikeStoredb;
/* The following statement shows how to use a subquery in the WHERE clause of a SELECT statement to find the sales orders of the customers located in New York:*/
 
  select * from sales.orders;

  -- Query

  select 
		order_id,
		order_date,
		customer_id
  from sales.orders
  where customer_id in (select customer_id from sales.customers where city='New York')
  order by order_date desc;

  -- nesting subquery

			select
			product_name,
			list_price
		from
			production.products
		where
			list_price > (
				select
					AVG (list_price)
				from
					production.products
				where
					brand_id IN (
						select
							brand_id
						from
							production.brands
						where
							brand_name = 'Strider'
						OR brand_name = 'Trek'
					)
			)
		order by
			list_price;



			---In operator


			-- The following query finds the names of all mountain bikes and road bikes products that the Bike Stores sell.

			select 
				product_id,
				product_name
			from 
				production.products
			where 
				category_id in ( select
					category_id
					from
						production.categories
					where
						category_name = 'Mountain Bikes'
					OR category_name = 'Road Bikes'
				);


		-- any operator

		-- , the following query finds the products whose list prices are greater than or equal to the average list price of any product brand

			select
				product_name,
				list_price
			from
				production.products
			where
				list_price >= any (
					select
						avg (list_price)
					from
						production.products
					group by
						brand_id
				);

		-- all operator

		-- The following query finds the products whose list price is greater than or equal to the average list price returned by the subquery:
			


			select
				product_name,
				list_price
			from
				production.products
			where
				list_price >= all (
					select
						avg (list_price)
					from
						production.products
					group by
						brand_id
				);


				-- Exists

				-- The following query finds the customers who bought products in 2017:

				select
					customer_id,
					first_name,
					last_name,
					city
				from
					sales.customers c
				where
					exists (
						select
							customer_id
						from
							sales.orders o
						where
							o.customer_id = c.customer_id
						and year (order_date) = 2017
					)
				order by
					first_name,
					last_name;


	 -- NOT EXISTS instead of EXISTS, you can find the customers who did not buy any products in 2017.
	     
			select
				customer_id,
				first_name,
				last_name,
				city
			from
				sales.customers c
			where
				not exists (
					select
						customer_id
					from
						sales.orders o
					where
						o.customer_id = c.customer_id
					and year (order_date) = 2017
				)
			order by
				first_name,
				last_name;



		-- from clause

			select
			   avg(order_count) average_order_count_by_staff
			from
			(
				select 
				staff_id, 
					count(order_id) order_count
				from 
				sales.orders
				group by 
				staff_id
			)t;


			-- correlated subquery

			-- The following example finds the products whose list price is equal to the highest list price of the products within the same category:


				select
					product_name,
					list_price,
					category_id
				from
					production.products p1
				where
					list_price IN (
						select
							max (p2.list_price)
						from
							production.products p2
						where
							p2.category_id = p1.category_id
						group by
							p2.category_id
					)
				order by
					category_id,
					product_name;


		-- exists
	  -- The following example finds all customers who have placed more than two orders:


				select
					customer_id,
					first_name,
					last_name
				from
					sales.customers c
				where
					exists (
						select
							count (*)
						from
							sales.orders o
						where
							customer_id = c.customer_id
						group by
							customer_id
						having
							count (*) > 2
					)
				order by
					first_name,
					last_name;


			-- any 

			-- The following example finds the products that were sold with more than two units in a sales order:

				select
					product_name,
					list_price
				from
					production.products
				where
					product_id = ANY (
						select
							product_id
						from
							sales.order_items
						where
							quantity >= 2
					)
				order by
					product_name;

			-- all
			-- the following query finds the products whose list prices are bigger than the average list price of products of all brands:
			 
				select
					product_name,
					list_price
				from
					production.products
				where
					list_price > all (
						select
							avg (list_price) avg_list_price
						from
							production.products
						group by
							brand_id
					)
				order by
					list_price;




