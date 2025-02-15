
CREATE TRIGGER [dbo].[trg_CheckWalletTransaction]
ON [dbo].[wallet_transaction]
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

  
    IF  NOT EXISTS (
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
