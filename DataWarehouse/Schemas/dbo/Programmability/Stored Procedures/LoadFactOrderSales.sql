CREATE PROCEDURE [dbo].[LoadFactOrderSales]
AS
BEGIN
    
    BEGIN TRY
        
        INSERT INTO [$(DatabaseName)].dbo.FactSalesOrders
            (OrderID, OrderDate, OrderDateKey, SalesOrderNumber, CustomerKey, SalesPersonKey, SubTotal, TaxAmt, Freight, TotalDue)
        SELECT 
            OrderID = so.OrderID, 
            OrderDate = ISNULL(dd.Date, '19990101'), 
            OrderDateKey = ISNULL(dd.DateKey, 19990101), 
            SalesOrderNumber = so.SalesOrderNumber, 
            CustomerKey = ISNULL(c.CustomerKey, -1), 
            SalesPersonKey = ISNULL(sp.SalesPersonID, -1), 
            SubTotal = so.SubTotal, 
            TaxAmt = so.TaxAmt, 
            Freight = so.Freight, 
            TotalDue = so.TotalAmt
        FROM [$(StagingDatabaseName)].dbo.vw_SalesOrders AS so
            LEFT JOIN [$(DatabaseName)].dbo.DimCustomer AS c
                ON so.CustomerID = c.CustomerID
            LEFT JOIN [$(DatabaseName)].dbo.DimSalesPerson AS sp
                ON so.SalesPersonID = sp.SalesPersonID
            LEFT JOIN [$(DatabaseName)].dbo.DimDate AS dd
                ON dd.DateKey = so.OrderDateKey;

    END TRY

    BEGIN CATCH

        DECLARE @ErrorMsg NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR (@ErrorMsg, 16, 1);
        RETURN

    END CATCH

END;
