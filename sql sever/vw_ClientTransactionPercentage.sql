CREATE VIEW vw_ClientTransactionPercentage AS
WITH TransactionTotals AS (
    SELECT vtf.id_client, SUM(vtf.final_total) AS total_transactions
    FROM vw_CartTotalAfterIssuedFor vtf
    INNER JOIN vip_client v ON vtf.id_client = v.id
    WHERE vtf.timestamp BETWEEN DATEADD(MONTH, -1, v.Subscription_expiration_time) AND v.Subscription_expiration_time
    GROUP BY vtf.id_client
)
SELECT c.id AS client_id,
       (tt.total_transactions * 0.15) AS transaction_15_percent
FROM client c
INNER JOIN TransactionTotals tt ON c.id = tt.id_client
WHERE tt.total_transactions > 0;
