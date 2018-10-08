CREATE VIEW [dbo].[vw_Customer]
AS
SELECT 
    CustomerID      = c.CustomerID,
    AccountNumber   = CAST(c.AccountNumber AS VARCHAR(50)),
    Name            = CONCAT(p.FirstName, ' ', p.LastName) 
    FROM dbo.Customer AS c
    INNER JOIN dbo.Person AS p
        ON c.CustomerID = p.BusinessEntityID;
