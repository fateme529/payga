IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'wallet_transaction')
BEGIN
    CREATE TABLE wallet_transaction (
        tracking_code INT NOT NULL,
        PRIMARY KEY (tracking_code),
        CONSTRAINT fk_wallet_transaction FOREIGN KEY (tracking_code)
            REFERENCES transactions (tracking_code) ON DELETE CASCADE
    );
END;
GO
