#Question1
DELIMITER //
CREATE PROCEDURE `GetCustomerLevel` (IN CUST INT)
BEGIN
    DECLARE lct_credtlimit INT;
    SELECT creditlimit INTO lct_credtlimit FROM Customers WHERE customernumber = CUST; 
    CASE 
        WHEN lct_credtlimit > 100000 THEN SET @result := 'Platinum';
        WHEN lct_credtlimit BETWEEN 25000 AND 100000 THEN SET @result := 'Gold';
        WHEN lct_credtlimit < 25000 THEN SET @result := 'Silver';
        ELSE SET @result := 'out of range';
    END CASE;
    SELECT @result AS result;
END //
DELIMITER ;

call classicmodels.GetCustomerLevel(1000);
select * from customers;
call classicmodels.GetCustomerLevel(475);
call classicmodels.GetCustomerLevel(496);
call classicmodels.GetCustomerLevel(103);

#Question2
DELIMITER //
CREATE PROCEDURE `Get_country_payments` (INOUT inout_year INT, IN input_country VARCHAR(255))
BEGIN
    SELECT 
        YEAR(paymentdate) AS year,
        country AS Country,
        CONCAT(FORMAT(SUM(amount) / 1000, 0), 'K') AS Totalamount
    FROM Payments 
    INNER JOIN customers ON Payments.customerNumber = customers.customerNumber
    WHERE YEAR(paymentdate) = @inout_year
        AND country = @input_country 
    GROUP BY year, Country;
END //
DELIMITER ;

call classicmodels.Get_country_payments(2003, 'France');