CREATE TABLE [dbo].[FactSalesOrders]
(
    [OrderKey]              BIGINT IDENTITY,
    [OrderID]               INT NOT NULL,
    [OrderDate]             DATETIME,
    [OrderDateKey]          INT NOT NULL,
    [SalesOrderNumber]      NVARCHAR(20),
    [CustomerID]            INT NOT NULL,
    [SalesPersonID]         INT NOT NULL,
    [SubTotal]              MONEY,
    [TaxAmt]                MONEY,
    [Freight]               MONEY,
    [TotalDue]              MONEY
)
GO

CREATE CLUSTERED INDEX IX_FactSalesOrders_OrderDateKey 
    ON [dbo].[FactSalesOrders] ([OrderDateKey]) 
    WITH (DATA_COMPRESSION = PAGE)
GO

CREATE NONCLUSTERED INDEX IX_FactSalesOrders_OrderID 
    ON [dbo].[FactSalesOrders] ([OrderID])
GO