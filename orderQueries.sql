use practicedb;

select * from
sales.customers

/* A) Sort a result set by one column in ascending order
The following statement sorts the customer list by the first name in ascending order:*/

select first_name,last_name
from sales.customers
order by first_name;

/*B) Sort a result set by one column in descending order
The following statement sorts the customer list by the first name in descending order.*/

select first_name,last_name
from sales.customers
order by first_name desc;

/* C) Sort a result set by multiple columns
The following statement retrieves the first name, last name, and city of the customers. It sorts the customer list by the city first and then by the first name.*/
insert into sales.customers values(11,'Somesh','Mone','91-6281218798','somesh.mone06@gmail.com','Yemmiganur','Buffalo','NY','11372')
select city,first_name,last_name
from sales.customers
order by city,first_name;

/* D) Sort a result set by multiple columns and different orders
The following statement sorts the customers by the city in descending order and then sorts the sorted result set by the first name in ascending order.*/4

select city,first_name,last_name
from sales.customers
order by city asc,first_name desc;

/* E) Sort a result set by a column that is not in the select list
It is possible to sort the result set by a column that does not appear on the select list. For example, the following statement sorts the customer by the state even though the state column does not appear on the select list.  */

select city,first_name,last_name
from sales.customers
order by state;
-- Here we are sorting by sate but we are not selecting state

/* F) Sort a result set by an expression
The LEN() function returns the number of characters in a string. The following statement uses the LEN() function in the ORDER BY clause to retrieve a customer list sorted by the length of the first name:*/

select first_name,last_name,len(first_name) as first_name_length
from sales.customers
order by len(first_name) desc;

/* G) Sort by ordinal positions of columns
SQL Server allows you to sort the result set based on the ordinal positions of columns that appear in the select list.

The following statement sorts the customers by first name and last name. But instead of specifying the column names explicitly, it uses the ordinal positions of the columns:*/

select first_name,last_name
from sales.customers
order by 1,2;

select first_name,last_name
from sales.customers
order by 2,1;