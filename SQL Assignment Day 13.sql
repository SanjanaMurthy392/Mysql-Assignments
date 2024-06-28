#Question1
select 
customerNumber, customerName
from Customers
where customerNumber not in (
select customerNumber
from orders);

#Question2
SELECT c.customerNumber, c.customerName, COUNT(o.ordernumber) as 'Total Orders'
FROM Customers c
LEFT JOIN Orders o ON c.customerNumber = o.customerNumber
GROUP BY c.customerNumber, c.customerName

UNION
SELECT c.customerNumber, c.customerName, 0 AS 'Total Orders'
FROM Customers c
WHERE c.customerNumber NOT IN (SELECT DISTINCT customerNumber FROM Orders)

UNION 
SELECT o.customerNumber, NULL AS customerName, COUNT(o.ordernumber) AS 'Total Orders'
FROM Orders o
WHERE o.customerNumber NOT IN (SELECT DISTINCT customerNumber FROM Customers)
GROUP BY o.customerNumber;

#Question3
select ordernumber, max(quantityOrdered) as quantityOrdered
from orderdetails o
where quantityOrdered < 
(select max(quantityOrdered)
from orderdetails od
where od.ordernumber = o.ordernumber)
group by ordernumber;

#Question4
SELECT 
OrderNumber,
COUNT(OrderNumber) AS TotalProduct
FROM Orderdetails
GROUP BY OrderNumber 
HAVING COUNT(OrderNumber) > 0;
SELECT 
MAX(TotalProduct) AS 'Max(Total)',
MIN(TotalProduct) AS 'Min(Total)'
FROM (
SELECT OrderNumber,
COUNT(OrderNumber) AS TotalProduct 
FROM Orderdetails
GROUP BY OrderNumber
HAVING COUNT(OrderNumber) > 0)
AS ProductCounts;

#Question5
select productLine, count(*) as total
from products where buyprice > (select avg(buyprice)
from products)
group by productline;
