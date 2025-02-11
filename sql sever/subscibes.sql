CREATE TABLE subscribes (
    tracking_code INT NOT NULL,
    id INT NOT NULL,
    PRIMARY KEY (tracking_code),
    CONSTRAINT fk_subscribes_client FOREIGN KEY (id) 
        REFERENCES client (id) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE,
    CONSTRAINT fk_subscribes_transaction FOREIGN KEY (tracking_code) 
        REFERENCES transactions (tracking_code) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);
