/* 1 */
SELECT
	P.NAME, PC.Name
FROM
	Production.Product as P
JOIN
	Production.ProductSubcategory as PSC
ON
	P.ProductSubcategoryID = PSC.ProductSubcategoryID
JOIN
	Production.ProductCategory as PC
ON
	PSC.ProductCategoryID = PC.ProductCategoryID
WHERE
	P.Color IN ('Red') AND P.StandardCost >= 100

	
/* 2 */
SELECT
	P.Name, PC.Name
FROM
	Production.Product as P
JOIN
	Production.ProductSubcategory as PSC
ON
	P.Name = PSC.Name
JOIN
	Production.ProductCategory as PC
ON
	PSC.Name = PC.Name

/* 3 */
SELECT
	PC.NAME, COUNT(*)
FROM
	Production.Product as P
JOIN
	Production.ProductSubcategory as PSC
ON
	P.ProductSubcategoryID = PSC.ProductSubcategoryID
JOIN
	Production.ProductCategory as PC
ON
	PSC.ProductCategoryID = PC.ProductCategoryID
GROUP BY
	PC.Name

/* 4 */
SELECT DISTINCT
	PSC.NAME, COUNT(*)
FROM
	Production.Product as P
JOIN
	Production.ProductSubcategory as PSC
ON
	P.ProductSubcategoryID = PSC.ProductSubcategoryID
GROUP BY
	PSC.Name

/* 5 */
SELECT TOP 3	
	PSC.NAME, COUNT(*)
FROM
	Production.Product as P
JOIN
	Production.ProductSubcategory as PSC
ON
	P.ProductSubcategoryID = PSC.ProductSubcategoryID
GROUP BY
	PSC.Name
ORDER BY
	COUNT(*) ASC

/* 6 */
SELECT
	PSC.NAME, MAX(StandardCost)
FROM
	Production.Product as P
JOIN
	Production.ProductSubcategory as PSC
ON
	P.ProductSubcategoryID = PSC.ProductSubcategoryID
WHERE
	Color IN ('Red')
GROUP BY
	PSC.Name

/* 7 */
SELECT
	 V.Name, COUNT(*)
FROM
	Purchasing.Vendor as V
JOIN
	Purchasing.ProductVendor as PV
ON
	V.BusinessEntityID = PV.BusinessEntityID
JOIN
	Production.Product as P
ON
	P.ProductID = PV.ProductID
GROUP BY
	V.Name

/* 8 */
SELECT
	 P.Name, COUNT(*)
FROM
	Purchasing.ProductVendor as PV
JOIN
	Production.Product as P
ON
	P.ProductID = PV.ProductID
GROUP BY
	P.Name
HAVING
	COUNT(*) > 1
		
/* 9 */
SELECT TOP 1
	 P.Name, COUNT(*)
FROM
	Purchasing.ProductVendor as PV
JOIN
	Production.Product as P
ON
	P.ProductID = PV.ProductID
GROUP BY
	P.Name
ORDER BY
	COUNT(*) DESC