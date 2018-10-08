CREATE TABLE [dbo].[DimCustomer]
(
    CustomerKey     INT IDENTITY,
    CustomerID      INT NOT NULL,
    AccountNumber   NVARCHAR(50),
    Name            NVARCHAR(100),
    CONSTRAINT PK_DimCustomer PRIMARY KEY CLUSTERED (CustomerKey),
)
GO

CREATE UNIQUE NONCLUSTERED INDEX UQ_DimCustomer_CustomerID
    ON [dbo].[DimCustomer] (CustomerID)
GO
