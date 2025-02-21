CREATE TRIGGER trg_InsertVipClient
ON vip_client
INSTEAD OF INSERT
AS
BEGIN
    INSERT INTO vip_client (id, Subscription_expiration_time)
    SELECT i.id, 
           COALESCE(i.Subscription_expiration_time, GETDATE())
    FROM inserted i


END
