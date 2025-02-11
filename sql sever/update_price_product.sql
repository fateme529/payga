ALTER TRIGGER [dbo].[trg_UpdateProductPrice]
ON [dbo].[added_to]
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    
    UPDATE a
    SET a.cart_price = i.quantity * p.current_price
    FROM added_to a
    INNER JOIN inserted i
        ON a.client_id = i.client_id
        AND a.cart_number = i.cart_number
        AND a.locked_number = i.locked_number
        AND a.product_id = i.product_id
    INNER JOIN product p ON i.product_id = p.id
    WHERE a.client_id = i.client_id
      AND a.cart_number = i.cart_number
      AND a.locked_number = i.locked_number
      AND a.product_id = i.product_id; 
END;
