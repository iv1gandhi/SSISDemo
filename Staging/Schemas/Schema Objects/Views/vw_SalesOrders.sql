CREATE VIEW [dbo].[vw_SalesOrders]
AS
SELECT OrderID = SalesOrderID,
    OrderDate,
    OrderDateKey = YEAR(OrderDate) * 10000 + MONTH(OrderDate) * 100 + DAY(OrderDate),
    SalesOrderNumber,
    CustomerID,
    SalesPersonID,
    SubTotal,
    TaxAmt,
    Freight,
    TotalAmt = CAST(SubTotal + TaxAmt + Freight AS MONEY)
FROM dbo.SalesOrders
GO
