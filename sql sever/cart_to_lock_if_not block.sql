
ALTER TRIGGER [dbo].[trg_LockShoppingCart]
ON [dbo].[locked_shopping_cart]
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @cart_number INT;
    SELECT @cart_number = cart_number
    FROM inserted;
    IF EXISTS (SELECT 1
               FROM shopping_cart 
               WHERE number = @cart_number 
                 AND status = 'Blocked')
    BEGIN
        PRINT 'The cart is blocked and cannot be locked.';
    END
    ELSE
    BEGIN
       
        UPDATE sc
        SET sc.status = 'Locked'                 
        FROM shopping_cart sc
        INNER JOIN inserted i 
            ON sc.number = i.cart_number
        WHERE sc.number = @cart_number
          AND (sc.status IS NULL OR sc.status <> 'Locked');
    END
END;
