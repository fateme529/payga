CREATE VIEW dbo.for_tottal_shema
WITH SCHEMABINDING
AS
SELECT
    added.cart_number,
    added.locked_number,
    ct.cart_total, 
    STUFF((SELECT ', ' + ap.app_code
           FROM dbo.applied_to ap 
           WHERE ap.cart_number = added.cart_number 
             AND ap.locked_number = added.locked_number
           FOR XML PATH('')), 1, 2, '') AS discount_codes, 
    SUM(CASE 
        WHEN ap.app_code IS NOT NULL 
            AND dc.expiration_date > GETDATE() 
        THEN 
            CASE
                WHEN dc.amount < 100 THEN 
                    CASE 
                        WHEN (ct.cart_total * (dc.amount / 100.0)) > dc.dis_limit THEN 
                            dc.dis_limit 
                        ELSE 
                            (ct.cart_total * (dc.amount / 100.0))  
                    END
                ELSE 
                    CASE 
                        WHEN dc.amount > dc.dis_limit THEN dc.dis_limit 
                        ELSE dc.amount 
                    END
            END
        ELSE 0
    END) AS total_discount_amount, 
    CASE 
        WHEN ct.cart_total - 
            SUM(CASE 
                WHEN ap.app_code IS NOT NULL 
                    AND dc.expiration_date > GETDATE() 
                THEN 
                    CASE
                        WHEN dc.amount < 100 THEN
                            CASE 
                              
                                WHEN (ct.cart_total * (dc.amount / 100.0)) > dc.dis_limit THEN 
                                    dc.dis_limit
                                ELSE 
                                    (ct.cart_total * (dc.amount / 100.0))  
                            END 
                        ELSE
                            CASE 
                                WHEN dc.amount > dc.dis_limit THEN dc.dis_limit  
                                ELSE dc.amount 
                            END  
                    END
                ELSE 0
            END) < 0 
        THEN 0
        ELSE ct.cart_total - 
            SUM(CASE 
                WHEN ap.app_code IS NOT NULL 
                    AND dc.expiration_date > GETDATE() 
                THEN 
                    CASE
                        WHEN dc.amount < 100 THEN
                            
                            CASE 
                             
                                WHEN (ct.cart_total * (dc.amount / 100.0)) > dc.dis_limit THEN 
                                    dc.dis_limit  
                                ELSE 
                                    (ct.cart_total * (dc.amount / 100.0)) 
                            END 
                        ELSE
                      
                            CASE 
                                WHEN dc.amount > dc.dis_limit THEN dc.dis_limit 
                                ELSE dc.amount  
                            END  
                    END
                ELSE 0
            END)
    END AS final_total  
FROM
    dbo.added_to added
JOIN
    dbo.product p ON added.product_id = p.id
LEFT JOIN
    dbo.applied_to ap ON added.cart_number = ap.cart_number 
    AND added.locked_number = ap.locked_number
LEFT JOIN
    dbo.discount_code dc ON ap.app_code = dc.dis_code  
JOIN 
    (SELECT 
        added.cart_number,
        added.locked_number,
        SUM(added.quantity * p.current_price) AS cart_total
     FROM 
        dbo.added_to added
     JOIN 
        dbo.product p ON added.product_id = p.id
     GROUP BY 
        added.cart_number, added.locked_number) ct 
    ON added.cart_number = ct.cart_number 
    AND added.locked_number = ct.locked_number
GROUP BY
    added.cart_number, added.locked_number, ct.cart_total;
