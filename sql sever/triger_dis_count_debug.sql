
ALTER TRIGGER [dbo].[AfterClientReferralInsert]
ON [dbo].[client]
AFTER INSERT
AS
BEGIN
    DECLARE @NewClientID INT;
    DECLARE @ReferralCode VARCHAR(50);
    DECLARE @DiscountCode VARCHAR(50); 

    SELECT @NewClientID = id, @ReferralCode = referal_code FROM INSERTED;
    IF @ReferralCode IS NOT NULL AND @ReferralCode != '' AND @ReferralCode != CAST(@NewClientID AS VARCHAR(50))
    BEGIN
        INSERT INTO refers (referee, referrer)
        SELECT @NewClientID, @ReferralCode;
        CREATE TABLE #TempDiscountCalculation (
            ClientID INT,
            Level INT,
            DiscountPercentage DECIMAL(10,2),
            FixedDiscount INT,
            DiscountCode VARCHAR(50)
        );
        WITH ReferralChain AS (
            SELECT
                id AS ClientID,
                referal_code AS Referrer,
                1 AS Level
            FROM client
            WHERE id = @NewClientID

            UNION ALL

            SELECT
                c.id AS ClientID,
                c.referal_code AS Referrer,
                rc.Level + 1 AS Level
            FROM client c
            INNER JOIN ReferralChain rc ON c.id = rc.Referrer
        )
        INSERT INTO #TempDiscountCalculation (ClientID, Level, DiscountPercentage, FixedDiscount, DiscountCode)
        SELECT
            ClientID,
            Level,
            CASE
                WHEN Level = 1 THEN 50
                WHEN Level = 2 THEN 25
                WHEN Level = 3 THEN 12.5
                WHEN Level = 4 THEN 6.25
                WHEN Level = 5 THEN 3.125
                WHEN Level = 6 THEN 1.56
                WHEN Level > 6 THEN 0
                ELSE 0
            END AS DiscountPercentage,
            CASE
                WHEN Level >= 6 THEN 500000
                ELSE 0
            END AS FixedDiscount,
            'id_discount_' + CAST(ClientID AS VARCHAR(50)) + '_' + LEFT(REPLACE(NEWID(), '-', ''), 8) AS DiscountCode -- Combination of ClientID and random characters
        FROM ReferralChain;
        INSERT INTO DISCOUNT_CODE (dis_code, amount, dis_limit, usage_count, expiration_date)
        SELECT
            DiscountCode,
            CASE
                WHEN Level >= 6 THEN FixedDiscount
                ELSE DiscountPercentage
            END AS amount,
            10000000 AS dis_limit,
            1 AS usage_count,
            DATEADD(DAY, 30, GETDATE()) AS expiration_date
        FROM #TempDiscountCalculation;
        INSERT INTO PRIVATE_CODE (pri_code, id, pri_time)
        SELECT
            DiscountCode, 
            ClientID AS id,
            GETDATE() AS pri_time
        FROM #TempDiscountCalculation;			 
        DROP TABLE #TempDiscountCalculation;
    END
END;	
