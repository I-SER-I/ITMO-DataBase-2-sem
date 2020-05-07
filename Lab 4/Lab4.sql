/* 1 */
SELECT
	NAME
FROM
	Production.Product
WHERE
	ProductID IN
	(
		SELECT TOP 1 
			ProductID
		FROM
			Sales.SalesOrderDetail
		GROUP BY
			ProductID
		ORDER BY
			COUNT(*) DESC
	)

/* 2 */
SELECT
	SOH.CustomerID, SOD.OrderQty * SOD.UnitPrice AS 'Total Cost'
FROM
	Sales.SalesOrderHeader AS SOH 
JOIN
	Sales.SalesOrderDetail AS SOD
ON
	SOH.SalesOrderID = SOD.SalesOrderID
WHERE
	SOD.OrderQty * SOD.UnitPrice = 
	(
		SELECT
			MAX(SOD.OrderQty * SOD.UnitPrice)
		FROM
			Sales.SalesOrderHeader AS SOH 
		JOIN
			Sales.SalesOrderDetail AS SOD
		ON
			SOH.SalesOrderID = SOD.SalesOrderID
	)

/* 3 */
SELECT
	ProductID
FROM
	Sales.SalesOrderDetail
WHERE
	ProductID IN
	(
		SELECT
			SOD.ProductID
		FROM
			Sales.SalesOrderDetail AS SOD
		JOIN
			Sales.SalesOrderHeader AS SOH
		ON
			SOD.SalesOrderID = SOH.SalesOrderID
		GROUP BY
			SOD.ProductID
		HAVING
			COUNT(DISTINCT SOH.CustomerID) = 1
	)

/* 4 */
SELECT
	Name
FROM
	Production.Product
WHERE
	ListPrice > ALL
	(
		SELECT
			AVG(P.ListPrice)
		FROM
			Production.Product AS P
		WHERE
			ProductSubcategoryID = P.ProductSubcategoryID
	)

/* 5 */
SELECT
	Name
FROM
	Production.Product
WHERE
	ProductID IN
	(
		SELECT
			SOD.ProductID
		FROM
			Sales.SalesOrderDetail AS SOD 
		JOIN
			Sales.SalesOrderHeader AS SOH
		ON
			SOD.SalesOrderID = SOH.SalesOrderID
		WHERE
			SOH.CustomerID IN
			(
				SELECT
					SOH.CustomerID
				FROM
					Sales.SalesOrderDetail AS SOD 
				JOIN
					Sales.SalesOrderHeader AS SOH
				ON
					SOD.SalesOrderID = SOH.SalesOrderID
				JOIN
					Production.Product AS P
				ON
					SOD.ProductID = P.ProductID
				GROUP BY
					SOH.CustomerID
				HAVING
					COUNT(DISTINCT P.Color) = 1 and COUNT(DISTINCT P.Color) != 2
			)
		GROUP BY
			SOD.ProductID
		HAVING
			COUNT(DISTINCT SOH.CustomerID) > 1
	)

/* 6 */
SELECT DISTINCT
	ProductID
FROM
	Sales.SalesOrderDetail
WHERE 
	ProductID IN 
	(
		SELECT 
			SOD.ProductID
		FROM 
			Sales.SalesOrderDetail AS SOD
		JOIN
			Sales.SalesOrderHeader AS SOH
		ON 
			SOD.SalesOrderID = SOH.SalesOrderID
		WHERE EXISTS
		(
			SELECT 
				_SOH.CustomerID
			FROM 
				Sales.SalesOrderDetail as _SOD
			JOIN
				Sales.SalesOrderHeader as _SOH
			ON
				_SOD.SalesOrderID = _SOH.SalesOrderID
			WHERE 
				SOH.CustomerID = _SOH.CustomerID and
				SOD.ProductID = _SOD.ProductID and 
				SOD.SalesOrderID != _SOD.SalesOrderID
			GROUP BY
				_SOH.CustomerID
			HAVING
				COUNT(DISTINCT _SOD.ProductID) =
				(
					SELECT
						COUNT(DISTINCT __SOD.ProductID)
					FROM
						Sales.SalesOrderDetail AS __SOD
					WHERE
						SOD.ProductID = __SOD.ProductID
					GROUP BY
						__SOD.ProductID
				)
		)
	)

/* 7 */
SELECT DISTINCT
	CustomerID
FROM 
	Sales.SalesOrderHeader
WHERE 
	CustomerID IN 
	(
		SELECT 
			SOH.CustomerID
		FROM
			Sales.SalesOrderDetail as SOD 
		JOIN
			Sales.SalesOrderHeader as SOH
		ON 
			SOD.SalesOrderID = SOH.SalesOrderID
		WHERE EXISTS
		(
			SELECT 
				_SOD.ProductID
			FROM 
				Sales.SalesOrderDetail AS _SOD
			JOIN
				Sales.SalesOrderHeader AS _SOH
			ON
				_SOD.SalesOrderID = _SOH.SalesOrderID
			WHERE 
				SOH.CustomerID = _SOH.CustomerID AND 
				SOD.ProductID = _SOD.ProductID AND 
				SOD.SalesOrderID != _SOD.SalesOrderID
		)
	)