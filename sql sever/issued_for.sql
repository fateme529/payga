CREATE TABLE issued_for (
    tracking_code INT NOT NULL,
    id_client INT NOT NULL,
    cart_number INT NOT NULL,
    locked_number INT NOT NULL,
    PRIMARY KEY (tracking_code),
    CONSTRAINT fk_issued_for_cart_number FOREIGN KEY (id_client, cart_number, locked_number)
        REFERENCES locked_shopping_cart (id, cart_number, number_lock)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_issued_for_tracking_code FOREIGN KEY (tracking_code)
        REFERENCES transactions (tracking_code)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
