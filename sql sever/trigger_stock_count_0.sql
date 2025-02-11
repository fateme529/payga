CREATE TRIGGER [dbo].[trg_CheckStockBeforeInsert]
ON [dbo].[added_to]
AFTER INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN PRODUCT p ON i.Product_ID = p.ID
        WHERE p.stock_count <= 0
    )
    BEGIN
        RAISERROR ('The selected product is not available in stock!', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO

ALTER TABLE [dbo].[added_to] ENABLE TRIGGER [trg_CheckStockBeforeInsert]
GO


