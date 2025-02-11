CREATE TRIGGER trg_AddedTo_Locked
ON locked_shopping_cart
FOR UPDATE
AS
BEGIN

    UPDATE added_to
    SET added_to.id = i.id,
        added_to.cart_number = i.cart_number,
        added_to.locked_number = i.number_lock
    FROM added_to
    INNER JOIN inserted i
        ON added_to.client_id = i.client_id
        AND added_to.cart_number = i.cart_number
        AND added_to.locked_number = i.number_lock;
END;
