/* 1 */
SELECT LastName || ' ' || FirstName AS Name, Address, City, Region FROM Employees

/* 2 */
SELECT e.LastName, c.CompanyName FROM Orders o
JOIN Customers c ON c.CustomerID = o.CustomerID
JOIN Employees e ON e.EmployeeID = o.EmployeeID
JOIN Shippers s ON s.ShipperID = o.ShipVia
WHERE lower(s.CompanyName) = 'speedy express' AND lower(c.City) = 'bruxelles'

/* 3 */
SELECT LastName, FirstName, Title 
FROM Employees e
JOIN Orders o ON o.EmployeeID = e.EmployeeID
JOIN [Order Details] od ON od.OrderID = o.OrderID
JOIN Products p ON p.ProductID = od.ProductID
WHERE p.ProductName ='Gravad Lax' OR p.ProductName = 'Mishi Kobe Niku'

/* 4 */
SELECT e.LastName || ' ' || e.FirstName AS 'Employee', d.LastName || ' ' || d.FirstName AS 'Superior'
FROM Employees e
LEFT OUTER JOIN Employees d ON e.ReportsTo = d.EmployeeID

/* 5 */
SELECT distinct c.CompanyName, p.ProductName, s.CompanyName
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN [Order Details] od ON od.OrderID = o.OrderID
JOIN Products p ON p.ProductID = od.ProductID
JOIN Suppliers s ON s.SupplierID = p.SupplierID
WHERE c.City = 'London' and s.CompanyName IN ('Pavlova, Ltd.', 'Karkki Oy') 

/* 11 */
SELECT distinct c.CompanyName
FROM Customers C
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN [Order Details] od ON od.OrderID = o.OrderID
JOIN Products p ON p.ProductID = od.ProductID
WHERE p.UnitPrice < 5
GROUP BY c.CustomerId, c.CompanyName
HAVING COUNT(od.productID) = 
(SELECT count(*) FROM Products P2 WHERE UnitPrice < 5)

/* 12 */
SELECT p.ProductName
FROM Products p
WHERE p.ProductID in 
( SELECT od.ProductID
FROM [Order Details] od
JOIN Orders o ON o.OrderID = od.OrderID
GROUP BY od.ProductID
HAVING COUNT(distinct o.EmployeeID) = (SELECT COUNT(*) From Employees)
)

/* 13 */
SELECT * 
FROM [Order Details] od
JOIN Orders o ON o.OrderID = od.OrderID
WHERE o.CustomerID = 'LAZYK' AND NOT EXISTS (SELECT * FROM)

/* 15 */
select CategoryID, avg(UnitPrice) AS 'Prix moyen'
from Products
group by CategoryID 

/* 16 */
SELECT c.CategoryName, AVG(p.UnitPrice) AS 'Prix moyen'
FROM Categories c
JOIN Products p ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryName

/* 17 */
SELECT s.SupplierID, s.CompanyName
FROM Suppliers s
JOIN Products p ON p.SupplierID = s.SupplierID
GROUP BY s.SupplierID, s.CompanyName
HAVING COUNT(*) > 3

/* 18 */
SELECT e.EmployeeID, e.LastName, SUM(od.UnitPrice* (1 - od.Discount)) AS 'Ventes'
FROM Employees e
JOIN Orders o ON o.EmployeeID = e.EmployeeID
JOIN [Order Details] od ON od.OrderID = o.OrderID
GROUP BY e.EmployeeID
ORDER BY e.EmployeeID