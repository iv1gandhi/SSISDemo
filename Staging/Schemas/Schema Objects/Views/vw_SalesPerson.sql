CREATE VIEW [dbo].[vw_SalesPerson]
AS
SELECT 
    SalesPersonID       = e.BusinessEntityID,
    NationalIDNumber    = CAST(e.NationalIDNumber AS NVARCHAR(50)),
    JobTitle            = e.JobTitle,
    BirthDate           = e.BirthDate,
    MaritalStatus       = CAST(e.MaritalStatus AS NCHAR(1)),
    Gender              = e.Gender,
    HireDate            = e.HireDate,
    Name                = CONCAT(p.FirstName, ' ', p.LastName) 
    FROM dbo.Employee AS e
    INNER JOIN dbo.Person AS p
        ON e.BusinessEntityID = p.BusinessEntityID
GO
