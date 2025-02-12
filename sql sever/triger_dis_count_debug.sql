
ALTER TRIGGER [dbo].[AfterClientReferralInsert]
ON [dbo].[client]
AFTER INSERT
AS
BEGIN
    DECLARE @NewClientID INT;
    DECLARE @ReferralCode VARCHAR(50);
    DECLARE @DiscountCode VARCHAR(50); -- Variable to hold the discount code as string

    -- Get the new client ID and referral code from the inserted row
    SELECT @NewClientID = id, @ReferralCode = referal_code FROM INSERTED;

    -- Ensure referral code is valid and not equal to the current client ID
    IF @ReferralCode IS NOT NULL AND @ReferralCode != '' AND @ReferralCode != CAST(@NewClientID AS VARCHAR(50))
    BEGIN
        -- Insert into refers table (referee and referrer)
        INSERT INTO refers (referee, referrer)
        SELECT @NewClientID, @ReferralCode;

        -- Declare a temporary table for storing discount calculations
        CREATE TABLE #TempDiscountCalculation (
            ClientID INT,
            Level INT,
            DiscountPercentage DECIMAL(10,2),
            FixedDiscount INT,
            DiscountCode VARCHAR(50) -- Column to store the generated discount code
        );

        -- Recursively generate the referral chain
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

        -- Insert calculated discount data into the temporary table, also generating the discount code as a combination of NEWID() and ClientID
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
            -- Generate discount code with the format 'id_discount_<ClientID>_<RandomChars>'
            'id_discount_' + CAST(ClientID AS VARCHAR(50)) + '_' + LEFT(REPLACE(NEWID(), '-', ''), 8) AS DiscountCode -- Combination of ClientID and random characters
        FROM ReferralChain;

        -- Insert into DISCOUNT_CODE using the generated discount code from temporary table
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

        -- Insert into PRIVATE_CODE using the discount codes generated for the new clients
        INSERT INTO PRIVATE_CODE (pri_code, id, pri_time)
        SELECT
            DiscountCode, -- Use the same DiscountCode from temporary table
            ClientID AS id,
            GETDATE() AS pri_time
        FROM #TempDiscountCalculation;

        -- Drop the temporary table
        DROP TABLE #TempDiscountCalculation;
    END
END;
