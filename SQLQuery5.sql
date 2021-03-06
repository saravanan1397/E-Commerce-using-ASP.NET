USE [Shoponline]
GO
/****** Object:  StoredProcedure [dbo].[SP_GetAllProducts]    Script Date: 03/21/2017 17:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[SP_GetAllProducts]
(
@CategoryID int
)
	
AS
BEGIN
	BEGIN TRY
	IF(@CategoryID <>0)
	BEGIN
	
	SELECT * FROM (
SELECT p.CategoryID ,
p.ProductID ,
p.Name,
p.Price,
p.Image,
p.Description ,
c.CategoryName,
p.ProductQuantity,
ISNULL(SUM(cp.TotalProduct),0) As ProductSold,
 (p.ProductQuantity - ISNULL(SUM(cp.TotalProduct),0 )) As AvailableStock
FROM product p 
INNER JOIN Category c ON c.CategoryID = p.CategoryID
LEFT JOIN CustomerProducts cp ON cp.ProductID = p.ProductID

GROUP BY p.ProductID,
 p.Name,
p.Price,
p.Image,
p.Description ,
c.CategoryName,
p.CategoryID ,
p.ProductQuantity) StockTable
WHERE AvailableStock > 0 AND CategoryID = @CategoryID 
END

ELSE

BEGIN

	SELECT * FROM (
SELECT p.CategoryID ,
p.ProductID ,
p.Name,
p.Price,
p.Image,
p.Description ,
c.CategoryName,
p.ProductQuantity,
ISNULL(SUM(cp.TotalProduct),0) As ProductSold,
 (p.ProductQuantity - ISNULL(SUM(cp.TotalProduct),0 )) As AvailableStock
FROM product p 
INNER JOIN Category c ON c.CategoryID = p.CategoryID
LEFT JOIN CustomerProducts cp ON cp.ProductID = p.ProductID

GROUP BY p.ProductID,
p.Name,
p.Price,
p.Image,
p.Description, 
c.CategoryName,
p.CategoryID ,
p.ProductQuantity) StockTable
WHERE AvailableStock > 0 
END
	END TRY
	BEGIN CATCH
	PRINT('ERROR OCCURED')
	END CATCH
END

