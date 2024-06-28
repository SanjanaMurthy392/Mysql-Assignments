create table facility (facility_id int primary key, Name varchar(100), State varchar(100), Country varchar(100));
select * from facility;
alter table facility
modify facility_id int auto_increment;
alter table facility
add city varchar(100) not null;
desc facility;