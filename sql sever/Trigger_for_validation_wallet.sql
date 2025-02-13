CREATE TRIGGER trg_CheckWalletTransaction
ON bank_transaction
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

  
    IF EXISTS (
        SELECT 1 
        FROM inserted i
        LEFT JOIN wallet_transaction wt ON i.tracking_code = wt.tracking_code
        WHERE wt.tracking_code IS NULL
    )
    BEGIN
        RAISERROR('Tracking code not found in wallet_transaction. Insert operation is cancelled.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
