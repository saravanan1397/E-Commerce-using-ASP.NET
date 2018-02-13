
CREATE PROCEDURE [dbo].[SP_GetAllCategories]

AS
BEGIN
BEGIN TRY
select * from Category
END TRY
BEGIN CATCH
-- INSERT INTO dbo.ErrorLog
-- VALUES(ERROR_MESSAGE(),'sp_GetAllData') 
PRINT('Error Occured')
END CATCH
END