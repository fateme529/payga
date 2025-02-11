CREATE TRIGGER [dbo].[trg_LockShoppingCart]
ON [dbo].[locked_shopping_cart]
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE sc
    SET sc.status = 'locked'                 
    FROM shopping_cart sc
    INNER JOIN inserted i 
        ON sc.id = i.id 
        AND sc.number = i.cart_number 
    WHERE sc.status IS NULL OR sc.status <> 'locked'; 

END;


ALTER TABLE locked_shopping_cart
ADD CONSTRAINT DF_locked_time DEFAULT GETDATE() FOR locked_time;

