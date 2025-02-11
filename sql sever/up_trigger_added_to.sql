
CREATE TRIGGER trg_AddedTo_Product_Update
ON product
FOR UPDATE
AS
BEGIN
    UPDATE added_to
    SET added_to.product_id = i.id
    FROM added_to
    INNER JOIN inserted i ON added_to.product_id = i.id;
END;
GO
