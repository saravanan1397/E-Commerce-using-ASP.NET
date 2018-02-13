Create table product1
(
ProductID int primary key identity (1,1),
Items varchar(500),
Description varchar(1000),
Price varchar(50),
ImageUrl varchar(500),
CategoryId int
)
Create table Categories
(
CategoryId int primary key identity(1,1),
CategoryName varchar(200)

)