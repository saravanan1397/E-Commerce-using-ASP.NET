create procedure [dbo].[SP_SaveCustomerProducts]
(
@CustomerID int,
@ProductID int,
@TotalProduct int
)
As
BEGIN
BEGIN TRY
insert into CustomerProducts(CustomerID , ProductID ,TotalProduct )
Values(@CustomerID,@ProductID ,@TotalProduct ) 
END TRY

BEGIN CATCH
print('Error Occured')
END CATCH
END