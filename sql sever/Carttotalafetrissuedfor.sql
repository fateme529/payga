
CREATE VIEW [dbo].[vw_CartTotalAfterIssuedFor]
AS
SELECT 
    ctd.cart_number,
    ctd.locked_number,
    ctd.final_total
FROM dbo.Cart_Total_Discount ctd
JOIN dbo.issued_for iss ON iss.cart_number = ctd.cart_number
    AND iss.locked_number = ctd.locked_number
JOIN dbo.transactions t ON t.tracking_code = iss.tracking_code
WHERE t.status = 'successful';


