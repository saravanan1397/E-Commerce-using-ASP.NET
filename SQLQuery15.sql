USE [Shoponline]
GO
/****** Object:  StoredProcedure [dbo].[SP_AddNewProduct]    Script Date: 03/19/2017 23:28:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_AddNewProduct] 
(
@ProductName varchar(300),
@ProductPrice int,
@ProductImage varchar(500),
@ProductDescription varchar(1000),
@CategoryID int,
@ProductQuantity int
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
@CategoryID,
@ProductQuantity
) 
END TRY
Begin Catch
Print('Error Occured')
End Catch
End