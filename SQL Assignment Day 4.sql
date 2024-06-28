#Question1
select orderNumber,status,coalesce(comments, "-") as comments
from orders
where status='shipped';

#Question2
select * from employees;
select employeeNumber,firstName,jobTitle, case
when jobTitle = "President" then "P"
when jobTitle in ("Sales Manager","Sale Manager") then "SM"
when jobTitle = "Sales Rep" then "SR"
when jobTitle like "%VP%" then "VP"
else jobtitle
end as jobTitleAbbreviation from employees;