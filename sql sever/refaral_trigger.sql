

/****** Object:  Trigger [dbo].[AfterClientReferralInsert]    Script Date: 2/11/2025 4:09:48 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER TRIGGER [dbo].[AfterClientReferralInsert]
ON [dbo].[client]
AFTER INSERT
AS
BEGIN
    DECLARE @NewClientID INT;
    DECLARE @ReferralCode VARCHAR(50);
    SELECT @NewClientID = id, @ReferralCode = referal_code FROM INSERTED;

   
  
  
  

    IF @ReferralCode IS NOT NULL AND @ReferralCode != '' AND @ReferralCode != CAST(@NewClientID AS VARCHAR(50))
    BEGIN
  
        INSERT INTO refers (referee, referrer)
        SELECT  @NewClientID,@ReferralCode;

        CREATE TABLE #TempDiscountCalculation (
            ClientID INT,
            Level INT,
            DiscountPercentage DECIMAL(10,2),
            FixedDiscount INT
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


        INSERT INTO #TempDiscountCalculation (ClientID, Level, DiscountPercentage, FixedDiscount)
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
            END AS FixedDiscount
        FROM ReferralChain;

        INSERT INTO DISCOUNT_CODE (dis_code, amount, dis_limit, usage_count, expiration_date)
        SELECT
            CONCAT('DISCOUNT_', ClientID, '_', Level) AS Code,
            CASE 
                WHEN Level >= 6 THEN FixedDiscount 
                ELSE DiscountPercentage  
            END AS amount,  
            10000000 AS limit,                    
            1 AS usage_count, 
            DATEADD(DAY, 30, GETDATE()) AS expiration_date 
        FROM #TempDiscountCalculation
        WHERE NOT EXISTS (
            SELECT 1
            FROM DISCOUNT_CODE dc
            WHERE dc.dis_Code = CONCAT('DISCOUNT_', ClientID, '_', Level)
        );

        INSERT INTO PRIVATE_CODE (pri_code, id, pri_time)
        SELECT
            CONCAT('DISCOUNT_', ClientID, '_', Level) AS Code,
            ClientID AS id,
            GETDATE() AS pri_time
        FROM #TempDiscountCalculation
        WHERE EXISTS (
            SELECT 1
            FROM DISCOUNT_CODE dc
            WHERE dc.dis_Code = CONCAT('DISCOUNT_', ClientID, '_', Level)
        )
        AND NOT EXISTS (
            SELECT 1
            FROM PRIVATE_CODE pc
            WHERE pc.pri_Code = CONCAT('DISCOUNT_', ClientID, '_', Level)
        );

        DROP TABLE #TempDiscountCalculation;
    END
END;

GO

ALTER TABLE [dbo].[client] ENABLE TRIGGER [AfterClientReferralInsert]
GO


