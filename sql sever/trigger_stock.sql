ALTER TRIGGER trg_UpdateProductStockAfterBlock
ON shopping_cart
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    
    IF UPDATE(status)
    BEGIN
        UPDATE p
        SET p.stock_count = p.stock_count + atc.quantity
        FROM product p
        INNER JOIN added_to atc 
            ON p.id = atc.product_id
        INNER JOIN inserted i 
            ON i.number = atc.cart_number
        WHERE i.status = 'Blocked'  
          AND EXISTS (SELECT 1 FROM deleted d WHERE d.number = i.number AND d.status <> 'Blocked');
    END
END;
