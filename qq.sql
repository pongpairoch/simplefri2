-- 2.3 ระบุหมายเลขคำสั่งซื้อและยอดรวมของยอดขายสำหรับคำสั่งซื้อทั้งหมด ตั้งชื่อคอลัมน์ยอดขายทั้งหมดเป็น "total_amount

select orderNumber, sum(quantityOrdered * priceEach) as total_amount
from orderdetails 
group by orderNumber ;


select orderNumber, sum(quantityOrdered * priceEach) as total_amount
from orderdetails 
group by orderNumber
having total_amount > 55000;


select c.customerName, count(o.orderNumber) as num_orders
from customers c join orders o on c.customerNumber = o.customerNumber
where customerName like 'D%'
group by customerName;


select c.customerName, count(o.orderNumber) as num_orders
from customers c join orders o on c.customerNumber = o.customerNumber
where country = 'USA' 
group by customerName
having num_orders > 10;

select p.productname,o.priceEach,o.quantityOrdered
from orderdetails o join products p on o.productCode = p.productCode
where orderNumber = '10124'
group by productname 
order by productName asc;


select productname,sum(quantityOrdered) as total
from products p, orderdetails od, orders o
where p.productCode = od.productCode and
      od.ordernumber = o.ordernumber and
      extract(month from o.orderdate) = 01
group by productname
having sum(quantityordered) > 100 order by 2 desc; ;



select productname, sum(quantityordered) as total_quantity_ordered
from products p, orderdetails od, orders o
where p.productcode = od.productcode
and od.ordernumber = o.ordernumber
and extract(month from o.orderdate) = 01
group by productname
having sum(quantityordered) > 100 order by 2 desc;


select customername
from customers
where country = ( select country from customers where customerName = 'Mini Classics' ) 
order by customername asc;

select customername
from customers
where country = ( select country from customers where customerName = 'Mini Classics' ) and
 customerName like "Mini%" -- ใช้ having ไม่ได้เพราะไม่มีพวกค่าcount sum
;

select productname,quantityInStock
from products
where quantityInStock = ( select max(quantityInStock) from products );


select ordernumber, sum(quantityOrdered*priceEach) as total_amount
from orderdetails
group by ordernumber
having total_amount > ( select sum(quantityOrdered*priceEach) from orderdetails where orderNumber = '10103')
;
select customername,lastname
from customers c join employees e on c.salesRepEmployeeNumber = e.employeeNumber
where officeCode in ( select officeCode from offices where city = 'London')
;

select customername
from customers c
where creditLimit > (select avg(creditLimit) 
						from customers 
						 where city = c.city 
                         group by city);
                         
                         
select productname
from products 
where productCode not in ( select productCode from orderdetails )
;

create table usa_customers as 
select customernumber,customername, city, country
from customers
where false ;

create or replace view mini_customer_view (cno, cname, city, country)as
select customernumber, customername, city, country 
from usa_customers
where customername like 'Mini%';  

create or replace view miniltd_customer_view as
select cno as custno, cname as custname, city as custcity, country as custcountry 
from mini_customer_view
 where cname like '%Ltd.' 
 WITH LOCAL CHECK OPTION;  