CREATE TABLE [dbo].[DimSalesPerson]
(
    [SalesPersonKey]        INT IDENTITY,
    [SalesPersonID]         INT NOT NULL,
    [NationalIDNumber]      NVARCHAR(50),
    [JobTitle]              NVARCHAR(50),
    [BirthDate]             DATE,
    [MaritalStatus]         NCHAR(1),
    [Gender]                NCHAR(1),
    [HireDate]              DATE,
    [Name]                  NVARCHAR(100),
    CONSTRAINT PK_DimSalesPerson PRIMARY KEY CLUSTERED (SalesPersonKey)
)
GO

CREATE UNIQUE NONCLUSTERED INDEX UQ_DimSalesPerson_SalesPersonID
    ON [dbo].[DimSalesPerson] ([SalesPersonID])
GO
