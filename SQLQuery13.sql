create Procedure [dbo].[SP_GetIncomeReport]
(
@ReportType Int
)
As
BEGIN
BEGIN TRY
DECLARE @Month Int
DECLARE @Today Int
DECLARE @Year Int


SELECT @Today = Day(GETDATE()),@Month = MONTH(GETDATE()),@Year = YEAR(GETDATE())  

if(@ReportType = 1)
begin
Select * from(Select *,Day(OrderDateTime)As TodayDay,Month(OrderDateTime)As ThisMonth,Year(OrderDateTime)As ThisYear
from  CustomerDetails)IncomeTable  WHERE TodayDay =@Today and ThisMonth=@Month and ThisYear=@Year   
end 

if(@ReportType = 2)
begin
Select * from(Select *,Day(OrderDateTime)As TodayDay,Month(OrderDateTime)As ThisMonth,Year(OrderDateTime)As ThisYear
from  CustomerDetails)IncomeTable  WHERE ThisMonth=@Month and ThisYear=@Year   
end 

if(@ReportType = 3)
begin
Select * from(Select *,Day(OrderDateTime)As TodayDay,Month(OrderDateTime)As ThisMonth,Year(OrderDateTime)As ThisYear
from  CustomerDetails)IncomeTable  WHERE  ThisYear=@Year   
end 
END TRY

BEGIN CATCH
Print('Error Occurred')
END CATCH
END
