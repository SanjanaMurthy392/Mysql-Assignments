use classicmodels;

#Question1
select * from customers;
select customerNumber,customerName,state,creditLimit 
from customers
where state is not null and 
creditlimit between 50000 and 100000
order by creditlimit desc;

#Question2
select distinct productLine
from products
where productline like '%cars';