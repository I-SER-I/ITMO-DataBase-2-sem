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

/* 10 */
SELECT TOP 1
	PC.Name
FROM
    	Production.Product AS P
JOIN
 	Production.ProductSubcategory AS PSC
ON
 	P.ProductSubcategoryID = PSC.ProductSubcategoryID
JOIN
  	Production.ProductCategory AS PC
ON
 	PSC.ProductCategoryID = PC.ProductCategoryID
JOIN
    	Purchasing.ProductVendor AS PPV
ON
    	P.ProductID = PPV.ProductID
GROUP BY
    	PC.Name
ORDER BY
    	COUNT(*) DESC
    
/* 11 */
SELECT
    	PC.Name, COUNT(DISTINCT P.ProductSubcategoryID), COUNT(ProductID)
FROM
    	Production.Product AS P
JOIN
    	Production.ProductSubcategory AS PSC
ON
    	P.ProductSubcategoryID = PSC.ProductSubcategoryID
JOIN
    	Production.ProductCategory AS PC
ON
  	PC.ProductCategoryID = PSC.ProductCategoryID
GROUP BY
    	PC.Name

/* 12 */
  
SELECT
    	CreditRating, COUNT(ProductID)
FROM
    	Purchasing.ProductVendor AS PV
JOIN
    	Purchasing.Vendor AS V
ON
    	PV.BusinessEntityID = V.BusinessEntityID
GROUP BY
    	CreditRating
