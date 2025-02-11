
CREATE TRIGGER after_subscribe_insert
ON subscribes
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    MERGE vip_client AS target
    USING INSERTED AS src
    ON target.ID = src.id
    WHEN MATCHED THEN 
        UPDATE SET target.Subscription_expiration_time = DATEADD(MONTH, 1, GETDATE())
    WHEN NOT MATCHED THEN 
        INSERT (id, Subscription_expiration_time)
        VALUES (src.id, DATEADD(MONTH, 1, GETDATE()));
END;

