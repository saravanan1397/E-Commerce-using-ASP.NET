Create Procedure [dbo].[SP_GetTransactionDetails]
(
@TransactionNo int
)
As
BEGIN
BEGIN TRY
select p.Name,p.Image,p.Price,CP.TotalProduct as ProductQuantity from product p
INNER JOIN CustomerProducts CP
ON CP.ProductID = p.ProductID 
WHERE Cp.CustomerID = @TransactionNo  


END TRY
BEGIN CATCH
Print(ERROR_MESSAGE())
END CATCH
END