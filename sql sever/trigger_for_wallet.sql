CREATE TRIGGER trg_InsertIntoWalletTransaction
ON deposits_into_wallet
AFTER INSERT
AS
BEGIN
  
    INSERT INTO wallet_transaction (tracking_code)
    SELECT i.tracking_code
    FROM inserted i
    JOIN transactions t ON i.tracking_code = t.tracking_code
    WHERE t.status = 'successful';
END;
GO
