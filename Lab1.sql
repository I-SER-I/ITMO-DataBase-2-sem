/* 1 */
SELECT
	Name, Color, Size
FROM
	Production.Product

/* 2 */
SELECT
	Name, Color, Size
FROM
	Production.Product
WHERE
	StandardCost > 100

/* 3 */
SELECT
	Name, Color, Size
FROM
	Production.Product
WHERE
	StandardCost > 100

/* 4 */
SELECT
	Name, Color, Size
FROM
	Production.Product
WHERE
	StandardCost < 100 AND Color = 'Black'
ORDER BY 
	StandardCost ASC

/* 5 */
SELECT TOP 3
	Name, Color, Size, StandardCost
FROM
	Production.Product
WHERE
	Color = 'Black'
ORDER BY 
	StandardCost DESC

/* 6 */
SELECT
	Name, Color
FROM
	Production.Product
WHERE
	Color IS NOT NULL AND Size IS NOT NULL

/* 7 */
SELECT
	Color
FROM
	Production.Product
WHERE 
	Name LIKE 'L_N%'

/* 8 */
SELECT
	Color
FROM
	Production.Product
WHERE 
	Name LIKE 'L_N%'

/* 9 */
SELECT
	Name
FROM
	Production.Product
WHERE 
	Name LIKE '[DM]%' AND len(Name) > 3

/* 10 */
SELECT
	Name
FROM
	Production.Product
WHERE 
	SellStartDate < '2012-01-01'

/* 11 */
SELECT
	Name
FROM
	Production.ProductSubcategory

/* 12 */
SELECT
	Name
FROM
	Production.ProductCategory

/* 13 */
SELECT
	FirstName
FROM
	Person.Person
WHERE
	Title = 'Mr.'

/* 14 */
SELECT
	FirstName
FROM
	Person.Person
WHERE
	Title IS NULL
