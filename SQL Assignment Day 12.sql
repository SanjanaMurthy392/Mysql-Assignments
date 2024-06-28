#Question1
WITH x AS (
    SELECT 
        YEAR(orderdate) AS year,
        MONTHNAME(orderdate) AS month,
        COUNT(orderdate) AS total_orders
    FROM
        orders
    GROUP BY
        year, month
)
SELECT 
    year,
    month,
    total_orders AS 'Total Orders',
    CONCAT(ROUND(100 * ((total_orders - LAG(total_orders) OVER (ORDER BY year)) / LAG(total_orders) OVER (ORDER BY year)), 0), '%') AS "% YOY Changes"
FROM 
    x;
    
#Question2
Create table emp_udf (
Emp_ID INT AUTO_INCREMENT PRIMARY KEY,
Name VARCHAR(255),
DOB DATE);

INSERT INTO Emp_UDF(Name, DOB)
VALUES ("Piyush", "1990-03-30"), 
       ("Aman", "1992-08-15"), 
       ("Meena", "1998-07-28"), 
       ("Ketan", "2000-11-21"), 
       ("Sanjay", "1995-05-21");
       
select * from emp_udf;

DELIMITER //
CREATE FUNCTION calculate_age(date_of_birth DATE) RETURNS VARCHAR(50)
DETERMINISTIC 
BEGIN
DECLARE years int;
DECLARE months int;
DECLARE age varchar(50);

SET years = TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE());
SET months = TIMESTAMPDIFF(MONTH, date_of_birth, CURDATE()) % 12;

SET age = CONCAT(years, 'years', months, 'months');

RETURN age;
END //
DELIMITER ;

select 
emp_id,
name,
dob,
calculate_age(dob) as age
from emp_udf;
    