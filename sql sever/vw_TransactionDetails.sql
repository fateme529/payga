CREATE VIEW vw_TransactionDetails AS
SELECT 
    t.tracking_code,              
    t.timestamp AS transaction_time, 
    i.id_client AS issued_for_id,          
    i.cart_number,                  
    i.locked_number      
FROM 
    transactions t
JOIN  
    issued_for i
    ON t.tracking_code = i.tracking_code  
WHERE
    t.status = 'successful';              
