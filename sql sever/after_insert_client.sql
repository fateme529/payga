CREATE TRIGGER trg_SetDefaultValues
ON client
AFTER INSERT
AS
BEGIN
 
    UPDATE client
    SET timestamp = GETDATE()
    FROM client c
    INNER JOIN inserted i ON c.id = i.id
    WHERE c.timestamp IS NULL;


    UPDATE client
    SET wallet_balance = 0
    FROM client c
    INNER JOIN inserted i ON c.id = i.id
    WHERE c.wallet_balance IS NULL;
END;
