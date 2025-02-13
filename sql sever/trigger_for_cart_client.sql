CREATE TRIGGER trg_DeleteShoppingCartAfterVIPClient
ON vip_client
AFTER DELETE
AS
BEGIN
 
    DELETE FROM shopping_cart
    WHERE number BETWEEN (
            (SELECT id FROM deleted WHERE Subscription_expiration_time <= GETDATE()) * 100 + 2
        )
        AND (
            (SELECT id FROM deleted WHERE Subscription_expiration_time <= GETDATE()) * 100 + 5
        )
    AND status IN ('Available', 'Blocked');
END;
GO
