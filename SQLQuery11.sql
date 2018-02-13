Create Procedure [dbo].[SP_GetOrderList]
(
@Flag Int
)
As  
BEGIN
BEGIN TRY
if(@Flag <> 0)
BEGIN
SELECT * FROM CustomerDetails where Id=@Flag 
END
ELSE
BEGIN
SELECT * FROM CustomerDetails
END

END TRY

BEGiN CATCH

print('Error Occured')

END CATCH

END