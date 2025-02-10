CREATE TABLE added_to (
    client_id INT NOT NULL,
    cart_number INT NOT NULL,
    locked_number INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT DEFAULT 1,
    cart_price DECIMAL(25, 2) DEFAULT 0,
    PRIMARY KEY (id, cart_number, locked_number, product_id),
    CONSTRAINT fk_added_to_locked FOREIGN KEY (client_id,cart_number,locked_number)
        REFERENCES locked_shopping_cart (client_id,cart_number,number_lock)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_added_to_product FOREIGN KEY (product_id)
        REFERENCES product (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
