IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'transactions')
BEGIN
    CREATE TABLE transactions (
        tracking_code INT IDENTITY(1,1) NOT NULL,
        status VARCHAR(20) NOT NULL,
        timestamp DATETIME DEFAULT GETDATE(),
        PRIMARY KEY (tracking_code)
    );
END;



ALTER TABLE transactions
ADD CONSTRAINT chk_status CHECK (status IN ('partially_successful', 'failed', 'successful'));

