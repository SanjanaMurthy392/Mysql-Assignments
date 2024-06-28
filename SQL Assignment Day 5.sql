#Question1
select year(paymentDate) as paymentyear, min(amount) as minpayment
from payments 
group by paymentyear
order by paymentyear;

#Question2
select * from orders;
select concat("Q", Quarter(orderdate)) as Quarter, year(orderdate) as Year,
count(distinct customerNumber) as "unique customers",
count(*) as totalorders from orders group by year, quarter
order by year, quarter;

#Question3
select 
date_format(paymentDate,'%b') as Month,
concat(format(sum(amount)/1000,0),'K') as formattedamount
from payments group by month
having sum(amount) between 500000 and 1000000
order by sum(amount) desc;
