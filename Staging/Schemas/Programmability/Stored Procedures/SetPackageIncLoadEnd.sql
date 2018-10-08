CREATE PROCEDURE [dbo].[SetPackageIncLoadEnd]
    @ExecutionID    UNIQUEIDENTIFIER,
    @IsSuccessful   BIT
AS
BEGIN
    
    SET NOCOUNT ON;

    BEGIN TRY

        UPDATE dbo.LogPackagesIncLoad
        SET PackageEndDate  = GETDATE(),
            IsSuccessful    =  @IsSuccessful
        WHERE ExecutionID = @ExecutionID;

    END TRY

    BEGIN CATCH
        
        DECLARE @ErrorMsg NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR (@ErrorMsg, 16, 1);
        RETURN

    END CATCH

END;

