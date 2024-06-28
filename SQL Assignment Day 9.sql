create table university(ID int primary key, Name varchar(255));
insert into university(id, Name)
VALUES (1, "       Pune          University     "), 
               (2, "  Mumbai          University     "),
              (3, "     Delhi   University     "),
              (4, "Madras University"),
              (5, "Nagpur University");
select * from university;
set sql_safe_updates = 0;
update university set name = trim(both " " from regexp_replace(Name, ' {1,}',' '))
where id is not null;