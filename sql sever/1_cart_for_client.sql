
CREATE TRIGGER [dbo].[AfterNormalClient_1_CART]
ON [dbo].[client]
AFTER INSERT
AS
BEGIN
    DECLARE @NewClientID INT;
    DECLARE @CombinedCartNumber INT; 
    SELECT @NewClientID = ID FROM INSERTED;
    IF NOT EXISTS (SELECT 1 FROM vip_client WHERE ID = @NewClientID)
    BEGIN
        SET @CombinedCartNumber = @NewClientID * 100 + 1; 
        INSERT INTO shopping_cart (id, number, Status)
        VALUES (@NewClientID, @CombinedCartNumber, 'Available');
    END
END;
