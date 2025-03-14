ALTER TRIGGER [dbo].[trg_CheckBankTransaction]
ON [dbo].[bank_transaction]
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

  
    IF NOT EXISTS (
        SELECT 1 
        FROM inserted i
        WHERE NOT EXISTS (
            SELECT 1 
            FROM wallet_transaction wt
            WHERE wt.tracking_code = i.tracking_code
        )
    )
    BEGIN
  
        RAISERROR('Tracking code not found in wallet_transaction. Insert operation is cancelled.', 16, 1);
        ROLLBACK TRANSACTION; 
    END
END;
