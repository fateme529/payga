CREATE TABLE wallet_transaction (
    tracking_code INT NOT NULL,
    PRIMARY KEY (tracking_code),
    CONSTRAINT fk_wallet_transaction FOREIGN KEY (tracking_code) 
        REFERENCES transactions (tracking_code)ON UPDATE CASCADE ON DELETE CASCADE
);
