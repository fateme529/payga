CREATE TRIGGER [dbo].[trg__applied_discount_pub_pri]
ON [dbo].[applied_to]
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @discount_code VARCHAR(50);
    DECLARE @client_id INT;          
    DECLARE @cart_number INT;           
    DECLARE @locked_number INT;          
    DECLARE @expiration_date DATETIME;   

    SELECT @discount_code = app_code, 
           @client_id = client_id, 
           @cart_number = cart_number, 
           @locked_number = locked_number 
    FROM inserted;

    SELECT @expiration_date = expiration_date
    FROM discount_code
    WHERE dis_code = @discount_code;

    IF @expiration_date < GETDATE() 
    BEGIN
        RAISERROR('This discount code has expired and cannot be used anymore.', 16, 1);
        RETURN;
    END

    IF EXISTS (
        SELECT 1
        FROM inserted i
        LEFT JOIN private_code p 
            ON i.app_code = p.pri_code AND i.client_id = p.id  
        LEFT JOIN public_code pb
            ON i.app_code = pb.pub_code  
        WHERE NOT (p.pri_code IS NOT NULL OR pb.pub_code IS NOT NULL)
    )
    BEGIN
        RAISERROR('Invalid discount code! The code must belong to the user or be a public discount code.', 16, 1);
        RETURN;
    END

    IF EXISTS (
        SELECT 1 
        FROM discount_code 
        WHERE dis_code = @discount_code AND usage_count <= 0
    )
    BEGIN
        RAISERROR('This discount code has reached its maximum usage limit and cannot be used anymore.', 16, 1);
        RETURN;
    END

    UPDATE discount_code
    SET usage_count = usage_count - 1
    WHERE dis_code = @discount_code;

    INSERT INTO applied_to (client_id, cart_number, locked_number, app_code)
    SELECT client_id, cart_number, locked_number, app_code
    FROM inserted; 

END;







