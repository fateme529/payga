ALTER TRIGGER trg_UpdateClientWalletBalance
ON wallet_transaction
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

 
    UPDATE c
    SET c.wallet_balance = c.wallet_balance + d.amount
    FROM client c
    JOIN deposits_into_wallet d ON d.tracking_code = (SELECT i.tracking_code FROM inserted i)
    WHERE c.id = d.id;
END;
