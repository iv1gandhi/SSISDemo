CREATE TABLE [dbo].[LogPackagesIncLoad]
(
    ExecutionID         NVARCHAR(50) NOT NULL,
    PackageID           NVARCHAR(50) NOT NULL,
    PackageName         NVARCHAR(100) NOT NULL,
    PackageStartDate    DATETIME NOT NULL,
    PackageEndDate      DATETIME NULL,
    FactStartDate       DATE NOT NULL,
    FactEndDate         DATE NOT NULL,
    IsSuccessful        BIT NULL
)
GO

CREATE CLUSTERED INDEX IX_LogPackagesIncLoad_Dates ON dbo.LogPackagesIncLoad (PackageID, FactEndDate)
GO

CREATE NONCLUSTERED INDEX IX_LogPackagesIncLoad_ExecutionID ON dbo.LogPackagesIncLoad (ExecutionID)
GO
