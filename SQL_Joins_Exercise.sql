/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */

SELECT p.Name as 'Product_Name', c.Name as 'Category'
FROM bestbuy.products p
LEFT JOIN bestbuy.categories c
ON p.CategoryID = c.CategoryID 
WHERE c.CategoryID = 1
ORDER BY p.Name;
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT p.Name as 'Product_Name', p.Price, r.Rating, r.Comment as 'Customer_Reviews'
FROM bestbuy.products p
RIGHT JOIN bestbuy.reviews r
ON r.ProductID = p.ProductID
WHERE r.Rating = 5
ORDER BY p.Name;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT e.FirstName, e.LastName, 
SUM(Quantity) AS TotalSales
FROM bestbuy.sales s
LEFT JOIN bestbuy.employees e
ON e.EmployeeID = s.EmployeeID
WHERE s.Quantity IS NOT NULL
GROUP BY e.EmployeeID ORDER BY TotalSales DESC;


/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT c.Name AS CatName, d.Name AS DepName
FROM bestbuy.categories c
JOIN bestbuy.departments d
ON d.DepartmentID = c.DepartmentID
WHERE (c.Name LIKE '%App%' OR c.Name LIKE '%Gam%');

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT p.Name AS ProductName, SUM(s.Quantity) AS TotalSold, SUM(s.Quantity * s.PricePerUnit) AS TotalPrice 
FROM bestbuy.products p
LEFT JOIN bestbuy.sales s
ON p.ProductID = s.ProductID
WHERE p.ProductID = 97;
-- GROUP BY p.Name + s.Quantity;


/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT p.Name AS Product_Name, r.Reviewer, r.Rating, r.Comment
FROM bestbuy.reviews r
LEFT JOIN bestbuy.products p
ON r.ProductID = p.ProductID
WHERE p.Name LIKE ('%Visio%') AND r.Rating = 1;



-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
-- Should use the GROUP BY
