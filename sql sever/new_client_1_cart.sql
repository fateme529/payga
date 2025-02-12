ALTER TRIGGER [dbo].[AfterNormalClientInsert]
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

     
        IF NOT EXISTS (
            SELECT 1 FROM shopping_cart 
            WHERE id = @NewClientID AND number = @CombinedCartNumber
        )
        BEGIN
         
            INSERT INTO shopping_cart (id, number, Status)
            VALUES (@NewClientID, @CombinedCartNumber, 'Available');
        END
    END
END;
