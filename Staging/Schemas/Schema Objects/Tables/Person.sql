CREATE TABLE [dbo].[Person]
(
    BusinessEntityID    INT NOT NULL,
    FirstName           NVARCHAR(50) NOT NULL,
    LastName            NVARCHAR(50) NOT NULL,
    CONSTRAINT PK_Person PRIMARY KEY (BusinessEntityID)
)
