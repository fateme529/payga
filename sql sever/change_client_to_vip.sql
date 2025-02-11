ALTER TRIGGER after_subscribe_insert
ON subscribes
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

  
    IF EXISTS (
        SELECT 1 
        FROM INSERTED i
        JOIN transactions t ON i.tracking_code = t.tracking_code
        WHERE t.status = 'successful'
    )
    BEGIN
        MERGE vip_client AS target
        USING INSERTED AS src
        ON target.ID = src.id
        WHEN MATCHED THEN 
            UPDATE SET target.Subscription_expiration_time = DATEADD(MONTH, 1, GETDATE())
        WHEN NOT MATCHED THEN 
            INSERT (id, Subscription_expiration_time)
            VALUES (src.id, DATEADD(MONTH, 1, GETDATE()));

       
        RAISERROR('Subscription expiration time updated successfully.', 0, 1);
    END
    ELSE
    BEGIN
        
        RAISERROR('Tracking code status is not successful. No action performed.', 16, 1); 
    END
END;
