USE [payga]
GO
/****** Object:  Trigger [dbo].[trg_CheckWalletTransaction]    Script Date: 2/15/2025 7:44:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TRIGGER [dbo].[trg_CheckWalletTransaction]
ON [dbo].[wallet_transaction]
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

  
    IF NOT EXISTS (
        SELECT 1 
        FROM inserted i
        WHERE NOT EXISTS (
            SELECT 1 
            FROM bank_transaction bt
            WHERE bt.tracking_code = i.tracking_code
        )
    )
    BEGIN
  
        RAISERROR('Tracking code not found in wallet_transaction. Insert operation is cancelled.', 16, 1);
        ROLLBACK TRANSACTION; 
    END
END;
