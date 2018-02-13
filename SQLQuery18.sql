Create Procedure [dbo].[SP_OrderStatus]
(
@TransactionNo int,
@OrderStatus VarChar(300),
@Flag int
)
As
BEGIN
BEGIN TRY
if(@Flag = 1)
begin
insert into DeliveryStatus(TransactionNo,StatusMessage)values(@TransactionNo ,@OrderStatus)
end

select StatusMessage as ShipmentStatus,DataEntry as updatedOn from DeliveryStatus where TransactionNo = @TransactionNo 
END TRY

BEGIN CATCH
Print('Error Occured')
END CATCH
END