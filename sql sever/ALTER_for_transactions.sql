ALTER TABLE transactions
ADD CONSTRAINT DF_transaction_timestamp DEFAULT GETDATE() FOR timestamp;
