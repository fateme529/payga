CREATE TRIGGER trg_update_deposits_into_wallet
ON deposits_into_wallet
FOR UPDATE
AS
BEGIN
    DECLARE @tracking_code INT, @new_amount DECIMAL(25, 2);
    SELECT @tracking_code = tracking_code, @new_amount = amount
    FROM inserted;
    PRINT 'Tracking code updated: ' + CAST(@tracking_code AS VARCHAR(50)) + ' with new amount: ' + CAST(@new_amount AS VARCHAR(50));


    
END;
GO