-- 64130500053
USE `classicmodels`;

-- 2.1 List the product name and quantity in stock of all products that classified in the “Classic Cars” product line (กลุ่มของสินค้า/ผลิตภัณฑ์) and their buy prices are more than 80.

select productname,quantityInStock
from products
where productline = 'Classic Cars'
and buyPrice >80;
-- 64130500053
-- 2.2 List the customer name, city and country of all customers who live in the country named: Japan, Germany or Canada. Sort the results in descending order by country and ascending order by customer name.
select customername,city,country
from customers
where country = 'Japan' or country = 'Germany' or country = 'Canada'
order by country desc, customername asc;
-- 64130500053
-- 2.3 List the order number and the total amount of sales for all orders. Name the total amount of sales column to “total_amount”.
select ordernumber,sum(quantityOrdered*priceEach) as total_amount
from orderdetails
group by ordernumber;

-- 64130500053
-- 64130500053
-- 2.4 List the order number and the total amount of sales of all orders that their total amount of sales is more than 55000. Name the total amount of sales column to “total_amount”.
select ordernumber,sum(quantityOrdered*priceEach) as total_amount
from orderdetails
group by ordernumber
having total_amount > 55000;
-- 64130500053
-- 2.5 List the customer name and the number of sales orders of all customers whose name start with the letter ‘D’. Name the number of sales orders column to “num_orders”.
select c.customername, count(o.ordernumber) as num_oders
from customers c, orders o
where c.customername like 'D%'
and c.customernumber = o.customernumber
group by c.customernumber;

-- 64130500053
-- 2.6 List the customer name, the sales rep employee last name, and the check number of all customers who made the payment in year 2005. Name the sales rep employee last name column to “salesempname”.
select c.customername , e.lastname as salesempname, p.checknumber
from customers c , employees e,payments p
where c.salesRepEmployeeNumber = e.employeeNumber
and c.customerNumber = p.customerNumber
and p.paymentdate like '%2005%';


-- 64130500053
-- 2.7 List the manager last name (the employee who were reported to) and the number of employees of all managers. Name the manager last name and the number of employees columns to “mgrname” and “num_emp”, respectively.
select lastname as mgrname , employeeNumber as num_emp
from employees 
where jobTitle like '%Manager%' and reportsTo is not null ;

-- 2.8 Create your own question and the answered SQL statement should have SELECT, 
      -- FROM, WHERE, GROUP BY and HAVING clauses.
       -- Please write your question in English or Thai.
-- 64130500053
-- orderslist ชื่อสินค้าทั้งหมดที่มี ราคา50 - 60
select productName,buyPrice
from products
group by productName 
having buyPrice >= 50 and buyPrice <=60;

-- 64130500053
-- list customerName และ  creditLimit โดย creditLimit ต้องมีค่ามากกว่า 30000 และเรียงจากน้อยไปมาก
select customerName,creditLimit
from customers
where creditLimit > 30000
order by creditLimit asc;

-- 64130500053
-- list ชื่อสินค้า และ ราคาสินค้า ทั้งหมด ที่มีราคามากกว่า 60 เรียงจากมากไปน้อย
Select productName, buyPrice from products     
Group by productName, buyPrice     
Having sum(buyPrice)  > 60    
order by buyPrice desc ;





-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--  64130500053
-- 3.1 List the customer name of all customers who live in the same country of customer named “Mini Classics”. Sort the results in ascending order by customer name.
select customerName
from customers
where country in ( select country from customers 
where customerName = "Mini Classics")
order by customerName;

-- 64130500053
-- 3.2 List the customer name of all customers who live in the same country of customer named “Mini Classics” and their customer names start with “Mini”.
select customerName
from customers
where country in 
( select country from customers 
where customerName = ("Mini Classics") ) 
and upper( customerName )like 'Mini%'
;
-- 64130500053
-- 3.3 List the product name and quantity in stock of the product that has the maximum quantities in stock.
select productname,quantityInStock
from products 
where quantityInStock in ( select max(quantityInStock) from products)
;
-- 64130500053
-- 3.4 List the order number and the total amount of sales of all orders that their total amount of sales is more than the total amount of sales order number 10103. Name the total amount of sales column to “total_amount”.
select orderNumber, sum(quantityOrdered * priceEach) as total_amount
from orderdetails
group by orderNumber
having sum(quantityOrdered * priceEach) > (select sum(quantityOrdered * priceEach)
											from orderdetails
											where orderNumber = 10103 );
                                        
-- 64130500053
-- 3.5 List the customer name and the employee last name of all customers that their sales rep employee worked in the office located in London city. [Write two SQL statements using each type of subquery => Type I: Nested Subquery and Type II: Correlated Subquery subquery]
-- type 1
select c.customerName ,e.lastname
from customers c join employees e
on c.salesRepEmployeeNumber = e.employeeNumber
where e.officeCode IN ( select officeCode
						from offices
						where city = 'London');
-- type 2
select c.customername ,e.lastname
from customers c join employees e
on c.salesRepEmployeeNumber = e.employeeNumber
where exists ( select officecode
				from offices
				where city = 'London'
                and e.officecode = officecode);
-- 64130500053
-- 3.6 List all cities that are both an office location and a customer location. Remove the duplicate answer.    [Write two SQL statements using each type of subquery => Type I: Nested Subquery and Type II: Correlated Subquery subquery]   
-- type1
select distinct c.city
from customers c inner join employees e on c.salesRepEmployeeNumber = e.employeeNumber
where c.city in (select city from offices);
-- type2
select distinct c.city
from customers c inner join employees e on c.salesRepEmployeeNumber = e.employeeNumber
where exists (select city from offices where c.city = city);

-- 64130500053
-- 3.7 List all cities where customers who do not live in the same city of their sales rep employee’s office city.   Remove the duplicate answer.
-- type1
select distinct c.city
from customers c inner join employees e on c.salesRepEmployeeNumber = e.employeeNumber
where c.city not in (select city from offices);
-- type2
select distinct c.city
from customers c inner join employees e on c.salesRepEmployeeNumber = e.employeeNumber
where not exists (select city from offices where c.city = city);

-- 64130500053
-- 3.8 List the customer name of all customers who have a credit limit greater than all average credit limits of customers in each city.
select customername
from customers
where creditlimit >all (select avg(creditlimit) 
                        from customers
                        group by city);
                        
-- 64130500053
-- 3.9 List the customer name of all customers who have a credit limit greater than their average credit limits of customers in their cities.             
select customername
from customers c
where c.creditlimit > (select avg(creditlimit) 
                        from customers
                        where city = c.city);

-- 64130500053
-- 3.10 List the products that were never ordered by any customers. 
select productcode, productname
from products
where productcode not in (select productCode
                            from orderdetails);




-- 64130500053
-- 1. Create a view named "mini_customer_view" to display the customer name of all customers whose names start with the word “Mini”. Please verify by querying data from this view.
create or replace view mini_customer_view 
as select customerName
from customers
where customerName like 'Mini%';

-- 64130500053
-- 2
create or replace view prod_minstock_view as 
select productname,quantityInStock
from products
where quantityInStock = ( select min(quantityInStock) from products);

-- 64130500053
-- 3
create or replace view totalamount_orders_view(orderno,orderdate,total_amount)
as select ot.orderNumber,o.orderDate,sum(ot.quantityOrdered*ot.priceEach)
from orderdetails ot, orders o
where ot.orderNumber = o.orderNumber
group by ot.orderNumber ,o.orderDate
order by 3 desc ;

select * from totalamount_orders_view;

-- 64130500053
-- 4
create or replace view customer_samecity_view(cust_name,cust_city)
as select c.customername , c.city
from customers c
where c.city in (select o.city 
						from  offices o
                        where c.city = o.city);
  
-- 64130500053  
-- 5
create or replace view maxcredit_city_view
as select city, max(creditlimit) as max_creditlimit
   from customers
   group by city;


-- 64130500053
-- 6
create or replace view  maxcredit_london as select city,max_creditlimit
from maxcredit_city_view
where city like  'london%';

-- 64130500053
-- 7
create table offices_copy
		as select * from offices;   

create or replace view usa_office_view as select officecode,city,state
from offices_copy 
where country like 'USA%';





-- 64130500053
-- 8
insert into usa_office_view (officeCode,city,state) value('4', 'thai', 'TH');


-- 64130500053
-- 9

ALTER TABLE offices_copy
DROP primary key (officeCode);


SET SESSION SQL_SAFE_UPDATES = 0;
SET FOREIGN_KEY_CHECKS = 0;
ALTER TABLE offices_copy
  DROP FOREIGN KEY officeCode;

ALTER TABLE offices_copy
DROP PRIMARY KEY,
DROP FOREIGN KEY fk_1,
DROP COLUMN Format;

ALTER TABLE offices_copy
DROP PRIMARY KEY;

ALTER TABLE offices_copy
ADD PRIMARY KEY (officeCode);

SHOW CREATE TABLE offices_copy;
ALTER TABLE offices_copy MODIFY officeCode INTEGER NOT NULL AUTO_INCREMENT;

-- 64130500053
-- 10
DROP TABLE offices_copy;
SELECT * FROM classicmodels.usa_office_view;

ALTER TABLE offices_copy AUTO_INCREMENT = 1






SET SQL_SAFE_UPDATES = 0;
SET GLOBAL sql_mode='';
insert into usa_office_view (officeCode,city,state) value("4","sss","THAI");


