---NORTH AMERICA RETAIL SALES ANALYSIS.

--Question 1. What is Total number of Products

SELECT 
	COUNT(DISTINCT([Product ID])) AS TotalProducts 
FROM
	Products

--Question 2. What is the total number of Customers

SELECT 
	COUNT(DISTINCT([Customer ID])) AS TotalCustomers 
FROM
	Customers

--Question 3. What was the Average delivery days for the  different product category ?

SELECT 
	[Category]
	,AVG(DATEDIFF(DAY,[Order Date],[Ship Date]) ) AS AvgDeliveryDays
    
FROM
	[OrderDetails] AS ORD INNER JOIN Products AS P 
	ON ORD.[Product ID] = P.[Product ID]

GROUP BY 
	[Category]

ORDER BY 
	AvgDeliveryDays DESC

--Question 4. What was the Average delivery days for each segment ?
SELECT 
	[Segment]
	,AVG(DATEDIFF(DAY,[Order Date],[Ship Date]) ) AS AvgDeliveryDays
    
FROM
	[OrderDetails] AS ORD INNER JOIN Customers AS C 
	ON ORD.[Customer ID] = C.[Customer ID]

GROUP BY 
	[Segment]

ORDER BY 
	AvgDeliveryDays DESC

---Question 5. What are the Top 5 Fastest delivery products and Top 5 slowest delivery products
--TOP 5 Fastest 

SELECT
	[Product Name]
	,DATEDIFF(DAY,[Order Date],[Ship Date]) AS DeliveryDays
    
FROM
	[OrderDetails] AS ORD INNER JOIN Products AS P 
	ON ORD.[Product ID] = P.[Product ID]


ORDER BY
	DeliveryDays ASC

--TOP 5 Slowest 
SELECT TOP 5
	[Product Name]
	,DATEDIFF(DAY,[Order Date],[Ship Date]) AS DeliveryDays
    
FROM
	[OrderDetails] AS ORD INNER JOIN Products AS P 
	ON ORD.[Product ID] = P.[Product ID]

ORDER BY
	DeliveryDays DESC

