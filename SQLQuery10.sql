create Procedure [dbo].[SaveCustomerDetails]
(
@CustomerName VarChar (100),
@CustomerEmailID VarChar (100),
@CustomerPhoneNo VarChar (10),
@CustomerAddress VarChar (100),
@TotalProducts Int,
@TotalPrice Int,
@PaymentMethod varchar(100)
)
As
BEGIN
 
BEGIn TRY
insert into CustomerDetails(CustomerName , CustomerEmailID , CustomerPhoneNo,CustomerAddress,TotalProducts,TotalPrice,PaymentMethod)
values(@CustomerName,@CustomerEmailID,@CustomerPhoneNo,@CustomerAddress,@TotalProducts,@TotalPrice,@PaymentMethod )  

select @@IDENTITY as CustomerID
END TRY
BEGIN CATCH
print('Error Occured')
END CATCH
END