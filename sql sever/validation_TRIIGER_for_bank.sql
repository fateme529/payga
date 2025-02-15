USE [payga]
GO
/****** Object:  Trigger [dbo].[trg_CheckBankTransaction]    Script Date: 2/15/2025 7:07:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TRIGGER [dbo].[trg_CheckBankTransaction]
ON [dbo].[bank_transaction]
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
