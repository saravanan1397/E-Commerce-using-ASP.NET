Create Procedure [dbo].[SP_GetAvailableStock]
(
@StockType Int,
@CategoryID Int
)
AS
BEGIN
BEGIN TRY
DECLARE @StartRange INT
DECLARE @EndRange INT

IF(@StockType = 0)
BEGIN
SET @StartRange = 0
SET @EndRange = 0
END

IF(@StockType = 1)
BEGIN
SET @StartRange = 1
SET @EndRange = 10
END


IF(@StockType = 2)
BEGIN
SET @StartRange = 11
SET @EndRange = 1000
END

IF(@CategoryID = 0)

BEGIN 
SELECT * FROM 
(
SELECT p.Name,
p.Price,
p.ImageUrl,
c.CategoryName,
p.ProductQuantity,
ISNULL(SUM(cp.TotalProduct),0) As ProductSold,
 (p.ProductQuantity - ISNULL(SUM(cp.TotalProduct),0)) As AvailableStock
FROM product p 
INNER JOIN Category c ON c.CategoryID = p.CategoryID
LEFT JOIN CustomerProducts cp ON cp.ProductID = p.ProductID

GROUP BY cp.ProductID,
 p.Name,
p.Price,
p.ImageUrl,
c.CategoryName,
p.ProductQuantity)StockTable
WHERE AvailableStock BETWEEN @StartRange AND @EndRange
END
ELSE

BEGIN
 SELECT * FROM 
(
SELECT p.Name,
p.Price,
p.ImageUrl,
c.CategoryName,
p.ProductQuantity,
ISNULL(SUM(cp.TotalProduct),0) As ProductSold,
 (p.ProductQuantity - ISNULL(SUM(cp.TotalProduct),0 )) As AvailableStock
FROM product p 
INNER JOIN Category c ON c.CategoryID = p.CategoryID
LEFT JOIN CustomerProducts cp ON cp.ProductID = p.ProductID

WHERE c.CategoryID = @CategoryID
GROUP BY cp.ProductID,
 p.Name,
p.Price,
p.ImageUrl,
c.CategoryName,
p.ProductQuantity)StockTable
WHERE AvailableStock BETWEEN @StartRange AND @EndRange
END
END TRY

BEGIN CATCH
print('Error Occured')
END CATCH
END