
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'shopping_cart')
BEGIN
    CREATE TABLE shopping_cart (
        id INT NOT NULL,
        number INT NOT NULL,
        status VARCHAR(10) NOT NULL,
        PRIMARY KEY (id, number),
        CONSTRAINT unique_number UNIQUE (number),
        CONSTRAINT fk_client_id FOREIGN KEY (id) REFERENCES client (id) ON UPDATE CASCADE ON DELETE CASCADE
    );
END;





ALTER TABLE shopping_cart
ADD CONSTRAINT ch_status CHECK (status IN ('blocked', 'locked', 'available'));
