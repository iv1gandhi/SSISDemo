CREATE TABLE [dbo].[Employee]
(
    BusinessEntityID        INT NOT NULL,
    NationalIDNumber        NVARCHAR(15) NOT NULL,
    JobTitle                NVARCHAR(50),
    BirthDate               DATE,
    MaritalStatus           NCHAR(1),
    Gender                  NCHAR(1),
    HireDate                DATE,
    CONSTRAINT PK_Employee PRIMARY KEY (BusinessEntityID)
)
