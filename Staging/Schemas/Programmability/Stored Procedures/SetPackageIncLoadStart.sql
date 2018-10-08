CREATE PROCEDURE [dbo].[SetPackageIncLoadStart]
    @PackageID      VARCHAR(50),
    @PackageName    NVARCHAR(100),
    @ExecutionID    VARCHAR(50) OUTPUT,
    @FactStartDate  DATE OUTPUT,
    @FactEndDate    DATE OUTPUT
AS
BEGIN
    
    SET NOCOUNT ON;

    BEGIN TRY

        SET @ExecutionID = (SELECT NEWID());

        DECLARE @MaxLoadedDate DATE;

        SET @MaxLoadedDate = (SELECT MAX(FactEndDate)
                                FROM dbo.LogPackagesIncLoad
                                WHERE   PackageID = @PackageID
                                        AND IsSuccessful = 1
                            );

        SET @FactStartDate = (SELECT ISNULL(DATEADD(DD, 1, @MaxLoadedDate), '19990101'));
        SET @FactEndDate = (SELECT DATEADD(DD, -1, GETDATE()));

        IF @FactStartDate = CAST(GETDATE() AS DATE)
            SET @FactStartDate =  @FactEndDate;
              
        INSERT INTO dbo.LogPackagesIncLoad
            (ExecutionID, PackageID, PackageName, PackageStartDate, FactStartDate, FactEndDate)
        SELECT @ExecutionID, @PackageID, @PackageName, GETDATE(), @FactStartDate, @FactEndDate;

    END TRY

    BEGIN CATCH
        
        DECLARE @ErrorMsg NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR (@ErrorMsg, 16, 1);
        RETURN

    END CATCH

END;
