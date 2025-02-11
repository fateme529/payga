CREATE TABLE vip_client (
    id INT NOT NULL,
    Subscription_expiration_time DATETIME NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_vip FOREIGN KEY (id) 
        REFERENCES client(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

