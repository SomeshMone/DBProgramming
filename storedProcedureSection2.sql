
-- begin and end

		begin
			select
				product_id,
				product_name
			from
				production.products
			where
				list_price > 100000;

			IF @@ROWCOUNT = 0
				print 'No product with price greater than 100000 found';
		end


		-- nested begin and end

			begin
				declare @name varchar(MAX);

				select top 1
					@name = product_name
				from
					production.products
				order by
					list_price desc;
    
				if @@ROWCOUNT <> 0
				begin
					print 'The most expensive product is ' + @name
				end
				else
				begin
					print 'No product found';
				end;
			end



			-- IF ELSE


			/* The following example first gets the sales amount from the sales.order_items table in the sample database and then prints out a message if the sales amount is greater than 1 million.*/

			-- using only if
			begin	
				declare @sales int;
				select 
					@sales=(list_price*quantity)
				from 
					sales.order_items i
					inner join sales.orders o on o.order_id=i.order_id
				where
					year(order_date)=2018
				select @sales;
				if @sales<1000000
				begin 
					print 'Great! The sales amount in 2018 is greater than 1,000,000';
				end
			end;

			-- using if and else

			begin	
				declare @sales int;
				select 
					@sales=(list_price*quantity)
				from 
					sales.order_items i
					inner join sales.orders o on o.order_id=i.order_id
				where
					year(order_date)=2017
				select @sales;
				if @sales>1000000
				begin 
					print 'Great! The sales amount in 2018 is greater than 1,000,000';
				end
				else
				begin
					print 'Sales amount in 2017 did not reach 10,000,000';
				end
			end;


			-- nested if and else

			begin
				declare @x int=10,
						@y int =20;
				if(@x>0)
				begin 
					if(@x>@y)
						print 'x > 0 and x < y';
					else
						print 'x > 0 and x >= y';
				end
			end;
				

			-- while example

		-- The following example illustrates how to use the WHILE statement to print out numbers from 1 to 5:

		declare @counter int=1;

		while @counter<=10
		begin
			print @counter
			set @counter=@counter+2;
		end;



		-- break 

		-- print only upto 5 numbers
		declare @counter1 int =0;
		while @counter1<=10
		begin
			if @counter1=6
				break;
			print @counter1;
			set @counter1=@counter1+1;

		end

		-- continue
		

		-- skip 4 th number in 1 to 10 numbers

		declare @counter1 int =0;
		while @counter1<=10
		begin
			set @counter1=@counter1+1;
			if @counter1=3
				continue;
			print @counter1;
		end

		-- try catch block

		create procedure usp_divide( @a decimal,@b decimal,@c decimal output) as 
			begin
				begin try
					set @c=@a/@b
				end try
				begin catch
					select 
						error_number() as ErrorNumber,
						ERROR_SEVERITY() as ErrorSeverity,
						ERROR_STATE() as ErrorState,
						ERROR_PROCEDURE() AS ErrorProcedure  
						,ERROR_LINE() AS ErrorLine  
						,ERROR_MESSAGE() AS ErrorMessage;  
				end  catch
			end;


			declare @r decimal;
			exec usp_divide 10,5,@r out;
			print @r

			declare @r1 decimal;
			exec usp_divide 10,0,@r1 out;
			print @r1


			-- try catch transactions example

			-- First, set up two new tables sales.persons and sales.deals for demonstration:

			--here use [Bike Stores] db
			use [Bike Stores];

				 CREATE TABLE sales.persons
					(
						person_id  INT
						PRIMARY KEY IDENTITY, 
						first_name NVARCHAR(100) NOT NULL, 
						last_name  NVARCHAR(100) NOT NULL
					);

					CREATE TABLE sales.deals
					(
						deal_id   INT
						PRIMARY KEY IDENTITY, 
						person_id INT NOT NULL, 
						deal_note NVARCHAR(100), 
						FOREIGN KEY(person_id) REFERENCES sales.persons(
						person_id)
					);

					insert into 
						sales.persons(first_name, last_name)
					values
						('John','Doe'),
						('Jane','Doe');

					insert into 
						sales.deals(person_id, deal_note)
					values
						(1,'Deal for John Doe');



			-- Next, create a new stored procedure named usp_report_error that will be used in a CATCH block to report the detailed information of an error:


				create  proc usp_report_error
						as
							select   
								ERROR_NUMBER() AS ErrorNumber  
								,ERROR_SEVERITY() AS ErrorSeverity  
								,ERROR_STATE() AS ErrorState  
								,ERROR_LINE () AS ErrorLine  
								,ERROR_PROCEDURE() AS ErrorProcedure  
								,ERROR_MESSAGE() AS ErrorMessage;  
						GO



		 create proc usp_delete_person(
				@person_id int
			) as
			begin
				begin try
					begin transaction;
					-- delete the person
					delete from sales.persons 
					where person_id = @person_id;
					-- if DELETE succeeds, commit the transaction
					commit transaction;  
				end try
				begin catch
					-- report exception
					exec usp_report_error;
        
					-- Test if the transaction is uncommittable.  
					if (XACT_STATE()) = -1  
					begin  
						print  N'The transaction is in an uncommittable state.' +  
								'Rolling back transaction.'  
						rollback transaction;  
					end;  
        
					-- Test if the transaction is committable.  
					IF (XACT_STATE()) = 1  
					BEGIN  
						PRINT N'The transaction is committable.' +  
							'Committing transaction.'  
						COMMIT TRANSACTION;     
					end;  
				end catch
			end;
		exec usp_delete_person 2;

		exec usp_delete_person 1;


		-- raise error

		--The following statement adds a custom error message to the sys.messages view:

		exec sp_addmessage
			@msgnum = 50005, 
			@severity = 1, 
			@msgtext = 'A custom error message';
		
		select    
			*
		from    
			sys.messages
		where 
			message_id = 50005;


		RAISERROR ( 50005,1,1)


	-- to drop a message
	EXEC sp_dropmessage 
		 @msgnum = 50005; 

	-- message error

	RAISERROR ( 'Whoops, an error occurred.',1,1);


	--  we use the RAISERROR inside a TRY block to cause execution to jump to the associated CATCH block. Inside the CATCH block, we use the RAISERROR to return the error information that invoked the CATCH block.

				declare 
					@ErrorMessage  NVARCHAR(4000), 
					@ErrorSeverity INT, 
					@ErrorState    INT;

				begin try
					RAISERROR('Error occurred in the TRY block.', 17, 1);
				end try
				begin catch
					select 
						@ErrorMessage = ERROR_MESSAGE(), 
						@ErrorSeverity = ERROR_SEVERITY(), 
						@ErrorState = ERROR_STATE();

					-- return the error inside the CATCH block
					raiserror(@ErrorMessage, @ErrorSeverity, @ErrorState);
				end catch;


		-- throw


		 --Using THROW statement to raise an exception

		 THROW 50005, N'An error occurred', 1;


		 -- Using THROW statement to rethrow an exception

		 create table t1(
				id int primary key
				);


			begin try
				insert into t1(id) values(1);
				--  cause error
				insert into t1(id) values(1);
			end try
			begin catch
				print('Raise the caught error again');
				throw;
			end catch










		






