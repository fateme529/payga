ALTER TRIGGER trg_UpdateWalletBalanceAfterIssuedFor
ON issued_for
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;


    UPDATE c
    SET c.wallet_balance = c.wallet_balance - 
        (
            SELECT TOP 1 final_total
            FROM dbo.Cart_Total_Discount ctd
            JOIN issued_for iss ON iss.cart_number = ctd.cart_number
            AND iss.locked_number = ctd.locked_number
            JOIN wallet_transaction wt ON wt.tracking_code = iss.tracking_code
            JOIN transactions t ON t.tracking_code = wt.tracking_code
            WHERE t.status = 'successful'
            AND iss.id_client = c.id
   
            AND EXISTS (
                SELECT 1
                FROM inserted i
                WHERE i.tracking_code = wt.tracking_code
                  AND i.cart_number = ctd.cart_number
                  AND i.locked_number = ctd.locked_number  
            )
        )
    FROM client c
    JOIN issued_for iss ON c.id = iss.id_client
    JOIN wallet_transaction wt ON wt.tracking_code = iss.tracking_code
    WHERE EXISTS (
        SELECT 1
        FROM inserted i
        WHERE i.tracking_code = wt.tracking_code
        AND i.cart_number = iss.cart_number 
        AND i.locked_number = iss.locked_number 
    );
END;
