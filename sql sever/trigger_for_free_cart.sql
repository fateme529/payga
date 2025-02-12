CREATE TRIGGER trg_after_insert_tracking_code
ON issued_for
AFTER INSERT
AS
BEGIN
 

	 DECLARE @tracking_code VARCHAR(50), @id_client INT, @cart_number INT, @locked_number INT;

    SELECT 
	    @tracking_code = tracking_code,
        @id_client = id_client, 
        @cart_number = cart_number,
        @locked_number = locked_number
    FROM INSERTED;
	

    IF EXISTS (
        SELECT 1 
        FROM transactions 
        WHERE tracking_code = @tracking_code
          AND status = 'successful'
    )
    BEGIN
 
        UPDATE sc
        SET sc.status = 'Available'
        FROM shopping_cart sc
        JOIN inserted i ON sc.number = i.cart_number
        WHERE i.cart_number = @cart_number;
		END
END;
GO
