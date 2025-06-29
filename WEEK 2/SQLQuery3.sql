USE EmployeeManagement;

SELECT 
    EmployeeID, 
    FirstName, 
    LastName, 
    DepartmentID 
FROM 
    Employees;

SELECT 
    DepartmentID, 
    DepartmentName 
FROM 
    Departments;


CREATE PROCEDURE sp_GetEmployeeCountByDepartment
    @DepartmentID INT
AS
BEGIN
    SELECT COUNT(*) AS TotalEmployees
    FROM Employees
    WHERE DepartmentID = @DepartmentID;
END;

EXEC sp_GetEmployeeCountByDepartment @DepartmentID = 1;

SELECT * FROM Employees;