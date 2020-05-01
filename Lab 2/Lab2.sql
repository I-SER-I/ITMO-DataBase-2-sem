/* 1 */
SELECT 
	Color, COUNT(Color) as 'Amount'
FROM 
	Production.Product
WHERE 
	Color IS NOT NULL AND ListPrice >= 30
GROUP BY 
	Color

/* 2 */
SELECT 
	Color, MIN(ListPrice) as 'MinPrice'
FROM 
	Production.Product
WHERE 
	Color IS NOT NULL
GROUP BY 
	Color
HAVING 
	MIN(ListPrice) > 100

/* 3 */
SELECT 
	ProductSubcategoryID, COUNT(*) as 'ProductCount'
FROM 
	Production.Product
WHERE 
	ProductSubcategoryID IS NOT NULL
GROUP BY 
	ProductSubcategoryID
ORDER BY 
	ProductSubcategoryID

/* 4 */
SELECT 
	ProductID, COUNT(LineTotal) as 'SalesFacts'
FROM 
	Sales.SalesOrderDetail
WHERE 
	ProductID IS NOT NULL
GROUP BY 
	ProductID

/* 5 */
SELECT 
	ProductID, COUNT(LineTotal) as 'SalesFacts'
FROM 
	Sales.SalesOrderDetail
WHERE 
	ProductID IS NOT NULL
GROUP BY 
	ProductID
HAVING 
	COUNT(LineTotal) > 5

/* 6 */
SELECT
    CustomerID
FROM
    Sales.SalesOrderHeader
GROUP BY
    CustomerID, OrderDate
HAVING
    COUNT(SalesOrderID) > 1
ORDER BY
    CustomerID

/* 7 */
SELECT 
	SalesOrderID, COUNT(*) as 'ProductCount'
FROM 
	Sales.SalesOrderDetail
WHERE 
	SalesOrderID IS NOT NULL
GROUP BY 
	SalesOrderID
HAVING 
	COUNT(*) > 3

/* 8 */
SELECT 
	ProductID, COUNT(*) as 'ProductCount'
FROM 
	Sales.SalesOrderDetail
GROUP BY 
	ProductID
HAVING 
	COUNT(*) > 3

/* 9 */
SELECT 
	ProductID, COUNT(*) as 'ProductCount'
FROM 
	Sales.SalesOrderDetail
GROUP BY 
	ProductID
HAVING 
	COUNT(*) IN (3, 5)

/* 10 */
SELECT 
	ProductSubcategoryID, COUNT(*) as 'ProductCount'
FROM 
	Production.Product
WHERE 
	ProductSubcategoryID IS NOT NULL
GROUP BY 
	ProductSubcategoryID
HAVING 
	COUNT(*) > 10

/* 11 */
SELECT 
	ProductID
FROM 
	Sales.SalesOrderDetail
WHERE 
	OrderQty = 1
GROUP BY 
	ProductID
ORDER BY 
	ProductID

/* 12 */
SELECT TOP 1 
	SalesOrderID, COUNT(*) as 'ProductCount'
FROM 
	Sales.SalesOrderDetail
GROUP BY 
	SalesOrderID
ORDER BY 
	COUNT(*) DESC

/* 13 */
SELECT TOP 1 
	SalesOrderID, UnitPrice
FROM 
	Sales.SalesOrderDetail
GROUP BY 
	SalesOrderID, UnitPrice
ORDER BY 
	UnitPrice DESC

/* 14 */
SELECT 
	ProductSubcategoryID, COUNT(*) as 'ProductCount'
FROM 
	Production.Product
WHERE 
	ProductSubcategoryID IS NOT NULL AND Color IS NOT NULL
GROUP BY 
	ProductSubcategoryID

/* 15 */
SELECT 
	Color, COUNT(*) as 'ProductCount'
FROM 
	Production.Product
WHERE 
	Color IS NOT NULL
GROUP BY 
	Color
ORDER BY 
	COUNT(*) DESC

/* 16 */
SELECT 
	ProductID, COUNT(*) as 'ProductCount'
FROM 
	Sales.SalesOrderDetail
WHERE 
	OrderQty > 1
GROUP BY 
	ProductID
HAVING 
	COUNT(*) > 2
ORDER BY 
	ProductID
