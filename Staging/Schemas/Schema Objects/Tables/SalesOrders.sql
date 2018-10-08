CREATE TABLE [dbo].[SalesOrders]
(
    SalesOrderID        INT,
    OrderDate           DATETIME,
    SalesOrderNumber    NVARCHAR(25),
    CustomerID          INT,
    SalesPersonID       INT,
    SubTotal            MONEY,
    TaxAmt              MONEY,
    Freight             MONEY,
    CONSTRAINT PK_SalesOrders PRIMARY KEY (SalesOrderID)
)
