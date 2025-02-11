CREATE TABLE bank_transaction (
    tracking_code INT NOT NULL,
    card_number CHAR(16) NOT NULL,
    PRIMARY KEY (tracking_code),
    CONSTRAINT fk_bank_transaction FOREIGN KEY (tracking_code) 
        REFERENCES transactions (tracking_code)ON UPDATE CASCADE ON DELETE CASCADE
);
