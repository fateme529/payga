USE payga;
GO


IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'bank_transaction')
BEGIN
    CREATE TABLE bank_transaction (
        tracking_code INT NOT NULL,
        card_number CHAR(16) NOT NULL,
        PRIMARY KEY (tracking_code),
        CONSTRAINT fk_bank_transaction FOREIGN KEY (tracking_code) 
            REFERENCES transactions (tracking_code)
            ON DELETE CASCADE
    );
END;
GO

CREATE TRIGGER trg_BankTransaction_Update
ON transactions
FOR UPDATE
AS
BEGIN
    UPDATE bank_transaction
    SET bank_transaction.tracking_code = i.tracking_code
    FROM bank_transaction
    INNER JOIN inserted i ON bank_transaction.tracking_code = i.tracking_code;
END;
GO
