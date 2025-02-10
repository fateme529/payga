CREATE TABLE applied_to (
    client_id INT NOT NULL,
    cart_number INT NOT NULL,
    locked_number INT NOT NULL,
    app_code VARCHAR(50) NOT NULL,
    app_time DATETIME NOT NULL,  
    PRIMARY KEY (client_id, cart_number, locked_number, app_code),
    CONSTRAINT fk_applied_to_code FOREIGN KEY (app_code)
        REFERENCES discount_code (dis_code) 
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_applied_to_locked_number FOREIGN KEY (client_id, cart_number, locked_number)
        REFERENCES locked_shopping_cart (id, cart_number, number_lock)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
