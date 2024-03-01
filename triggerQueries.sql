
create table production.product_audits(
    change_id INT IDENTITY PRIMARY KEY,
    product_id INT NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    brand_id INT NOT NULL,
    category_id INT NOT NULL,
    model_year SMALLINT NOT NULL,
    list_price DEC(10,2) NOT NULL,
    updated_at DATETIME NOT NULL,
    operation CHAR(3) NOT NULL,
    check(operation = 'INS' or operation='DEL')
);

CREATE TRIGGER production.trg_product_audit
ON production.products
AFTER INSERT, DELETE
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO production.product_audits(
        product_id, 
        product_name,
        brand_id,
        category_id,
        model_year,
        list_price, 
        updated_at, 
        operation
    )
    SELECT
        i.product_id,
        product_name,
        brand_id,
        category_id,
        model_year,
        i.list_price,
        GETDATE(),
        'INS'
    FROM
        inserted i
    UNION ALL
    SELECT
        d.product_id,
        product_name,
        brand_id,
        category_id,
        model_year,
        d.list_price,
        GETDATE(),
        'DEL'
    FROM
        deleted d;
END



-- testing the trigger

insert  into production.products
values (
    'Test product',
    1,
    1,
    2018,
    599
);

select * from production.product_audits;

-- The following statement deletes a row from the production.products table:

delete from 
	production.products
where 
    product_id = 322;

-- checking audit table
select * from production.product_audits;



-- DDL triggers

-- First, create a new table named index_logs to log the index changes

create table index_logs (
    log_id int identity(1,1) PRIMARY KEY,
    event_data XML NOT NULL,
    changed_by SYSNAME NOT NULL
);

	-- Next, create a DDL trigger to track index changes and insert events data into the index_logs table:

			create trigger trg_index_changes
			on  database
			for	
				CREATE_INDEX,
				ALTER_INDEX, 
				DROP_INDEX
			as
			begin
				set nocount on;

				insert into index_logs (
					event_data,
					changed_by
				)
				values (
					EVENTDATA(),
					USER
				);
			end;
			



		create nonclustered index nidx_fname
		on sales.customers(first_name);
		

		create nonclustered index nidx_lname
		on sales.customers(last_name);
		



	SELECT 
		*
	FROM
		index_logs;
