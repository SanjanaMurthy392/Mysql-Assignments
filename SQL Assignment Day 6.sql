#Question1
create table journey
(Bus_ID int not null,
Bus_Name varchar(100) not null,
source_station varchar(100) not null,
destination varchar(100) not null,
Email varchar(100) unique);
select * from journey;

#Question2
create table vendor
(Vendor_ID int primary key, 
Name varchar(255) not null,
email varchar(255) unique,
Country varchar(255) default 'N/A');
desc table vendor;

#Question3
create table movies
(Movie_ID int primary key,
Name varchar(255) not null,
release_year varchar(10) default '-',
Cast varchar(255) not null,
Gender enum('Male','Female'),
No_of_shows int check(No_of_shows >= 0));
desc table movies;

#Question4
#a.Product
create table Product
(product_id int auto_increment primary key,
product_name varchar(255) not null unique,
description text,
supplier_id int,
foreign key(supplier_id) references suppliers(supplier_id));

#b.Suppliers
create table suppliers
(supplier_id int auto_increment primary key,
supplier_name varchar(255),
location varchar(255));

#c.Stock
create table stock
(id int auto_increment primary key,
product_id int,
balance_stock int,
foreign key (product_id) references Product(product_id));