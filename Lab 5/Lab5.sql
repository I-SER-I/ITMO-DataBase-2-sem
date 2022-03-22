/* 1 */
WITH 
	OrderCount (CustomerID, SalesOrderID, ProductCount) AS
	(
		SELECT
			CustomerID, SOD.SalesOrderID, COUNT(ProductID) AS PoductCount
		FROM
			Sales.SalesOrderDetail AS SOD
		JOIN
			Sales.SalesOrderHeader AS SOH
		ON
			SOD.SalesOrderID = SOH.SalesOrderID
		GROUP BY
			CustomerID, SOD.SalesOrderID
	)
	
SELECT
	CustomerID, AVG(ProductCount)
FROM
	OrderCount
GROUP BY
	CustomerID
ORDER BY
	CustomerID ASC 

/* 2 */
WITH 
	Krinj (CustomerID, ProductID, ProductCount) AS
	(
		SELECT
			CustomerID, ProductID, COUNT(*) AS ProductCount
		FROM
			Sales.SalesOrderDetail AS SOD
		JOIN
			Sales.SalesOrderHeader AS SOH
		ON
			SOD.SalesOrderID = SOH.SalesOrderID
		GROUP BY
			CustomerID, ProductID
	), 
	OrderCount (CustomerID, SalesOrderID, ProductCount) AS
	(
		SELECT
			CustomerID, SOD.SalesOrderID, COUNT(ProductID) AS PoductCount
		FROM
			Sales.SalesOrderDetail AS SOD
		JOIN
			Sales.SalesOrderHeader AS SOH
		ON
			SOD.SalesOrderID = SOH.SalesOrderID
		GROUP BY
			CustomerID, SOD.SalesOrderID
	)
SELECT
	CustomerID, ProductCount
FROM
	OrderCount

/* 3 */
WITH 
	ProductInfo(ProductName, ProductCount, CustomerCount) AS
	(
		SELECT
			P.Name AS ProductName, COUNT(DISTINCT SOH.CustomerID) AS CustomerCount, COUNT(DISTINCT SOD.SalesOrderID) AS ProductCount
		FROM
			Production.Product AS P
		JOIN
			Sales.SpecialOfferProduct AS SOP
		ON
			P.ProductID = SOP.ProductID
		JOIN
			Sales.SalesOrderDetail AS SOD
		ON
			SOP.ProductID = SOD.ProductID
		JOIN
			Sales.SalesOrderHeader AS SOH
		ON
			SOD.SalesOrderID = SOH.SalesOrderID
		GROUP BY
			P.Name
	)
SELECT
	ProductName, ProductCount, CustomerCount
FROM
	ProductInfo