-- 2.1 List the product name and quantity in stock of all 
-- products that classified in the “Classic Cars” product line
--  (กลุ่มของสินค้า/ผลิตภัณฑ์) and their buy prices are more than 80.

select productName,quantityInStock
from products 
where productLine = 'Classic Cars' and buyPrice > 80;


-- 2.2 List the customer name, city and country of all customers
-- who live in the country named: Japan, Germany or Canada. 
-- Sort the results in descending order by country and ascending order by customer name.

select customername, city, country
from customers where country IN ('Japan','Germany','Canada')
order by country DESC, customername ;