/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 SELECT P.Name as Product, C.Name as Category
 FROM products as P
 INNER JOIN categories as C
 ON C.CategoryID = P.CategoryID
 WHERE C.Name = "Computers";
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 SELECT P.Name as Product, P.Price, R.Rating
 FROM products as P
 INNER JOIN reviews as R
 ON P.ProductID = R.ProductID
 WHERE R.Rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT E.FirstName, E.LastName, SUM(S.Quantity) as Total
FROM sales as S
INNER JOIN employees as E
ON E.EmployeeID = S.EmployeeID
GROUP BY E.EmployeeID
ORDER BY Total DESC
LIMIT 2;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT D.Name as Department, C.Name as Category
FROM departments as D
INNER JOIN categories as C
ON D.DepartmentID = C.DepartmentID
WHERE C.Name = "Appliances" OR C.Name = "Games";

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT P.Name as Product, SUM(S.Quantity) as 'Total Sold', SUM(S.Quantity * S.PricePerUnit) as 'Total Price'
FROM sales as S
INNER JOIN products as P
ON P.ProductID = S.ProductID
WHERE P.Name = "Eagles: Hotel California";

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT P.Name as Product, R.Reviewer, R.Rating, R.Comment
FROM reviews as R
INNER JOIN products as P
ON P.ProductID = R.ProductID
WHERE P.Name = "Visio TV"
ORDER BY R.Rating
LIMIT 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
SELECT E.FirstName, E.LastName, E.EmployeeID, P.Name as Product, SUM(S.Quantity) as 'Total Sold'
FROM employees as E
INNER JOIN sales as S
ON E.EmployeeID = S.EmployeeID
INNER JOIN products as P
ON P.ProductID = S.ProductID
GROUP BY E.EmployeeID, P.ProductID
ORDER BY E.FirstName;
