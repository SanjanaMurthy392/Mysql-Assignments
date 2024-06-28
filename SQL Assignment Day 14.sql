CREATE TABLE Emp_EH (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(255),
    EmailAddress VARCHAR(255)
);

DELIMITER //
CREATE PROCEDURE Insert_Emp_EH(
    IN p_EmpID INT,
    IN p_EmpName VARCHAR(255),
    IN p_EmailAddress VARCHAR(255)
)
BEGIN
    DECLARE error_occurred BOOLEAN DEFAULT FALSE;

    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        SET error_occurred = TRUE;
    END;

    INSERT INTO Emp_EH (EmpID, EmpName, EmailAddress) VALUES (p_EmpID, p_EmpName, p_EmailAddress);

    IF error_occurred THEN
        SELECT 'Error occurred';
    ELSE
        SELECT 'Values inserted successfully';
    END IF;
END //
DELIMITER ;

call classicmodels.Insert_Emp_EH(3, 'Meena', 'meena@gmail.com');
call classicmodels.Insert_Emp_EH(4, 'Saina', '');
call classicmodels.Insert_Emp_EH(1002, 'Murphy', 'dmurphy@classicmodelcars.com');
select * from Emp_EH;