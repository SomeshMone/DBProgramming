

-- Inner join 

  select * from production.products;
  select * from production.brands;
  select * from production.categories;

  -- inner join example

		select
			product_name,
			category_name,
			list_price
		from
			production.products p
		inner join production.categories c 
			on c.category_id = p.category_id
		order by
			product_name desc;


	  -- The following statement uses two INNER JOIN clauses to query data from the three tables:

		select
			product_name,
			category_name,
			brand_name,
			list_price
		from
			production.products p
		inner join production.categories c on c.category_id = p.category_id
		inner join production.brands b on b.brand_id = p.brand_id
		order by
			product_name desc;


	 -- Left Join

		select
			product_name,
			order_id
		from
			production.products p
		left join sales.order_items o on o.product_id = p.product_id
		order by
			order_id;

	-- It is possible to use the WHERE clause to limit the result set. The following query returns the products that do not appear in any sales order:

		 select
			product_name,
			order_id
		from
			production.products p
		left join sales.order_items o on o.product_id = p.product_id
		where order_id is null;


		-- right join

		select
			product_name,
			order_id
		from
			sales.order_items o
			right join production.products p 
				on o.product_id = p.product_id
		order by
			order_id;


		-- to find only null values

		select
			product_name,
			order_id
		from
			sales.order_items o
			right join production.products p 
				on o.product_id = p.product_id
		where 
			order_id is null
		order by
			order_id;


		-- full join

		select
			product_name,
			order_id
		from
			sales.order_items o
			full join production.products p 
				on o.product_id = p.product_id
		order by
			order_id;



		-- cross join

		select
			product_id,
			product_name,
			store_id,
			0 as quantity
		from
			production.products
		cross join sales.stores
		order by
			product_name,
			store_id;

	--self join

		select
			e.first_name + ' ' + e.last_name employee,
			m.first_name + ' ' + m.last_name manager
		from
			sales.staffs e
		inner join sales.staffs m on m.staff_id = e.manager_id
		order by
			manager;




