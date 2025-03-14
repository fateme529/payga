ALTER TRIGGER [dbo].[trg_ValidateBeforeInsert]
ON [dbo].[added_to]
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;


    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN shopping_cart sc ON sc.number = i.cart_number 
        WHERE sc.status <> 'Locked'
    )
    BEGIN
        RAISERROR ('This cart is not locked!', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END

    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN product p ON i.product_id = p.id
        WHERE p.stock_count < i.quantity 
    )
    BEGIN
        RAISERROR ('The selected product is not available in stock!', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END

   
    INSERT INTO added_to (client_id, cart_number, locked_number, product_ID, quantity, cart_price)
    SELECT client_id, cart_number, locked_number, product_id, quantity, cart_price
    FROM inserted;
END;
GO
