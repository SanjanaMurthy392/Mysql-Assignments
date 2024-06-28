Create table Emp_BIT(
Name varchar(255),
Occupation varchar(255),
Working_date date,
Working_hours INT);

INSERT INTO Emp_BIT VALUES
('Robin', 'Scientist', '2020-10-04', 12),  
('Warner', 'Engineer', '2020-10-04', 10),  
('Peter', 'Actor', '2020-10-04', 13),  
('Marco', 'Doctor', '2020-10-04', 14),  
('Brayden', 'Teacher', '2020-10-04', 12),  
('Antonio', 'Business', '2020-10-04', 11);

select * from Emp_BIT; 

Delimiter //
create trigger `Emp_BIT_before_insert`
before insert
on 
`Emp_BIT`
for each row begin
if new.working_hours < 0 then 
set new.working_hours = - new.working_hours;
end if;
end //
Delimiter ;

select * from emp_bit;