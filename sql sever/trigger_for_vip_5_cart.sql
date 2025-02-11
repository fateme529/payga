
CREATE TRIGGER [dbo].[AfterVIPClient_5_cart]
ON [dbo].[vip_client]
AFTER INSERT
AS
BEGIN
    DECLARE @NewClientID INT;
    DECLARE @CartNumber INT;
    DECLARE @CombinedCartNumber INT; 

    SELECT @NewClientID = ID FROM INSERTED;

    IF EXISTS (SELECT 1 FROM vip_client WHERE ID = @NewClientID)
    BEGIN
        SET @CartNumber = 2;

        WHILE @CartNumber <= 5
        BEGIN
            SET @CombinedCartNumber = @NewClientID * 100 + @CartNumber;
            INSERT INTO shopping_cart (id, number, Status)
            VALUES (@NewClientID, @CombinedCartNumber, 'Available');

            SET @CartNumber = @CartNumber + 1;
        END
    END
END;
