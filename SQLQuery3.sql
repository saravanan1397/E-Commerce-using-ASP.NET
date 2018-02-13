-- ================================================
CREATE PROCEDURE [dbo].[SP_GetAllProducts] (@CategoryId INT)
	
	
AS
BEGIN
	BEGIN TRY
	IF(@CategoryID <> 0)
	BEGIN
	SELECT * FROM (SELECT p.CategoryID,
	               p.ProductID ,
	               p.Name ,
	               p.Price ,
	               p.ProductQuantity,
	               c.CategoryName , 
	               p.ImageUrl ,
	               ISNULL(SUM(p.TotalProduct),0 )  As ProductSale,
	               (p.ProductQuantity - ISNULL(SUM(p.TotalProduct),0 )) As AvailableStock
	               
	               FROM product p 
	               INNER JOIN Category  c 
	               ON C.CategoryId = p.CategoryId 
	               LEFT JOIN CustomerProdutc CP
	               ON CP.ProductID = p.ProductID 
	               
	               GROUP BY p.ProductID ,
	               p.Name ,
	               p.Price ,
	               p.ImageUrl,
	               c.CategoryName ,
	               c.CategoryId ,
	               p.ProductQunatity)StockTable
	               WHERE AvailableStock > 0
	               AND CategoryId = @CategoryId
	End
	Else
	BEGIN
	SELECT * FROM (SELECT p.CategoryID,
	               p.ProductID ,
	               p.Name ,
	               p.Price ,
	               p.ProductQuantity,
	               c.CategoryName , 
	               p.ImageUrl ,
	               ISNULL(SUM(p.TotalProduct),0 )  As ProductSale,
	               (p.ProductQuantity - ISNULL(SUM(p.TotalProduct),0 )) As AvailableStock
	               
	               FROM product p 
	               INNER JOIN Category  c 
	               ON C.CategoryId = p.CategoryId 
	               LEFT JOIN CustomerProdutc CP
	               ON CP.ProductID = p.ProductID 
	               
	               GROUP BY p.ProductID ,
	               p.Name ,
	               p.Price ,
	               p.ImageUrl,
	               c.CategoryName ,
	               c.CategoryId ,
	               p.ProductQunatity)StockTable
	               WHERE AvailableStock > 0
	               END
	               
	END TRY         
	BEGIN CATCH
	      -- INSERT INTO dbo.ErrorLog
-- VALUES (ERROR_MESSAGE(),'sp_GetAllData')
PRINT('Error Occured')         
	 END CATCH	
END
GO
