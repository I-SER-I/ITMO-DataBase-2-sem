/* 1 */
SELECT 
	Name, SalesOrderID, (SUM(OrderQty) OVER(PARTITION BY Name, SalesOrderID) * UnitPrice)
FROM 
	Sales.SalesOrderDetail AS SSOD 
JOIN 
	Production.Product AS PP 
ON 
	SSOD.ProductID = PP.ProductID

/* 2 */
SELECT 
	Name, StandardCost, (StandardCost - MIN(StandardCost) OVER(PARTITION BY ProductSubcategoryID)) AS Diff
FROM 
	Production.Product

/* 3 */
SELECT 
	CustomerID, SalesOrderID, (ROW_NUMBER() OVER(PARTITION BY CustomerID ORDER BY OrderDate)) AS RowNum
FROM 
	Sales.SalesOrderHeader

/* 4 */
WITH 
	ProductsAndAvg (ProductID, StandardCost, ProductSubcategoryID, AvgCostSubcategory) AS
	(
		SELECT 
			ProductID, StandardCost, ProductSubcategoryID, (AVG(StandardCost) OVER(PARTITION BY ProductSubcategoryID)) 
		FROM 
			Production.Product
	)
SELECT 
	ProductID 
FROM 
	ProductsAndAvg
WHERE 
	StandardCost > AvgCostSubcategory AND ProductSubcategoryID IS NOT NULL
