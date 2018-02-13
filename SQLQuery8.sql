Create Table [dbo].[CustomerDetails]
(
[ID] [INT] IDENTITY (1,1) Not Null primary key,
[CustomerName] [VarChar] (100) Null,
[CustomerEmailID] [VarChar] (100) Null,
[CustomerPhoneNo] [VarChar] (10) Null,
[CustomerAddress] [VarChar] (100) Null,
[TotalProducts] [Int] Null,
[TotalPrice] [Int] Null,
[OrderDateTime] [dateTime] Null default getDate(),
[PaymentMethod] [VarChar] (100) Null
)