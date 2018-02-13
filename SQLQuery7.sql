create PROCEDURE [dbo].[SP_AddNewProduct] 
(
@ProductName varchar(300),
@ProductPrice int,
@ProductImage varchar(500),
@ProductDescription varchar(1000),
@CategoryID int
)
As
BEGIN 
BEGIN TRY

insert into product values
(
@ProductName ,
@ProductPrice ,
@ProductImage ,
@ProductDescription ,
@CategoryID
) 
END TRY
Begin Catch
-- INSERT INTO dbo.ErrorLog
-- VALUES(ERROR_MESSAGE(),'sp_GetAllData') 
PRINT('Error Occured')
End Catch
End