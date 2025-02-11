CREATE TRIGGER trg_wallet_transaction_update
ON transactions
FOR UPDATE
AS
BEGIN
    UPDATE wt
    SET wt.tracking_code = i.tracking_code
    FROM wallet_transaction wt
    INNER JOIN inserted i ON wt.tracking_code = i.tracking_code;
END;
GO
