#Question1
select employeeNumber,
concat(firstname," ",lastname) as "sales person",
count(distinct customerNumber) as unique_customers
from employees
left join customers on employeeNumber = salesRepEmployeeNumber
group by employeeNumber, "sales person"
order by unique_customers desc;

#Question2
select customers.customerNumber, customers.customerName, products.productCode, products.productName,
sum(orderdetails.quantityOrdered) as "Order Quantity",
sum(products.quantityInStock) as "Total Inventory",
sum(products.quantityInStock - Orderdetails.QuantityOrdered) as 'Left Over Quantity'
from Customers 
inner join orders on customers.customerNumber = Orders.CustomerNumber
inner join orderdetails on Orders.OrderNumber = Orderdetails.OrderNumber 
inner join Products on Orderdetails.ProductCode = Products.ProductCode
Group by Customers.CustomerNumber, Products.ProductCode
order by Customers.CustomerNumber asc;

#Question3
create table Laptop(Laptop_Name varchar(30));
Insert into Laptop(Laptop_Name) values
('HP'),
('Acer'),
('Lenovo'),
('apple'),
('Samsung');
select * from laptop;
create table Colours(Colour_Name varchar(30));
Insert into Colours(Colour_Name) values
('Black'),
('Grey'),
('White'),
('Red'),
('Blue');
select * from colours;
select Laptop.Laptop_Name,Colours.Colour_Name
from Laptop
cross join Colours;

#Question4
create table Project(EmployeeID int primary key, FullName varchar(255), Gender varchar(10), ManagerID int);
insert into Project(EmployeeID, FullName, Gender, ManagerID) values
(1, 'Pranaya', 'Male', 3),
(2, 'Priyanka', 'Female', 1),
(3, 'Preety', 'Female', Null),
(4, 'Anurag', 'Male', 1),
(5, 'Sambit', 'Male', 1),
(6, 'Rajesh', 'Male', 1),
(7, 'Hina', 'Female', 3);
select * from project;
select p.FullName as "Manager name", e.FullName as "Employee name"
from project p
left join project e on p.employeeID = e.managerID
Order by 'Manager Name' , 'Employee Name';