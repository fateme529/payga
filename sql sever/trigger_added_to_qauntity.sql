
ALTER TRIGGER [dbo].[trg_DecreaseStockAfterInsert]
ON [dbo].[added_to]
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE p
    SET p.stock_count = p.stock_count - i.quantity
    FROM dbo.PRODUCT p
    INNER JOIN inserted i ON p.ID = i.Product_ID
    WHERE p.stock_count >= i.quantity;  
END;
GO
