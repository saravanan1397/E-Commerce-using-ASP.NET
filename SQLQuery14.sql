USE [Shoponline]
GO
/****** Object:  StoredProcedure [dbo].[SP_GetOrderList]    Script Date: 03/18/2017 23:08:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Procedure [dbo].[SP_GetOrderList]
(
@Flag Int
)
As  
BEGIN
BEGIN TRY
if(@Flag <> 0)
BEGIN
SELECT * FROM CustomerDetails where ID=@Flag 
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