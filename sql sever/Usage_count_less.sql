CREATE TRIGGER trg_UpdateDiscount_Usage_caount_less
ON applied_to
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @discount_code VARCHAR(50);
    SELECT @discount_code = app_code FROM inserted;
    IF EXISTS (
        SELECT 1 
        FROM discount_code 
        WHERE dis_code = @discount_code AND usage_count <= 0
    )
    BEGIN
        RAISERROR('This discount code has reached its maximum usage limit and cannot be used anymore.', 16, 1);
    END
    ELSE
    BEGIN
        UPDATE discount_code
        SET usage_count = usage_count - 1
        WHERE dis_code = @discount_code;


        INSERT INTO applied_to (client_id, cart_number, locked_number, app_code)
        SELECT client_id, cart_number, locked_number, app_code
        FROM inserted;
    END
END;


ALTER TABLE applied_to
ADD CONSTRAINT DF_app_time DEFAULT GETDATE() FOR app_time;