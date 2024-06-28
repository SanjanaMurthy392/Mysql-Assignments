create view products_status as 
select year(O.ORDERDATE) as year,
concat(round(count(od.quantityordered * od.priceEach)), ' (',
round((sum(od.quantityOrdered * od.priceEach) / sum(sum(od.quantityOrdered * od.priceEach)) over ()) * 100), "%)") as "Total Values"
from orders O join orderdetails od
on o.ordernumber = od.ordernumber
group by year(O.ORDERDATE);
select * from products_status;