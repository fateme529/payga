CREATE TABLE deposits_into_wallet (
    tracking_code INT NOT NULL,
    id INT NOT NULL,
    amount DECIMAL(25, 2) NOT NULL,
    PRIMARY KEY (tracking_code),
    CONSTRAINT fk_deposits_into_wallet_client FOREIGN KEY (id)
        REFERENCES client (id)
        ON DELETE CASCADE,
    
    CONSTRAINT fk_deposits_into_wallet_transaction FOREIGN KEY (tracking_code)
        REFERENCES transactions (tracking_code)
        ON DELETE CASCADE,
      
);
