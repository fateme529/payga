USE payga;
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'locked_shopping_cart')
BEGIN
    CREATE TABLE locked_shopping_cart (
        id INT NOT NULL,
        cart_number INT NOT NULL,
        number_lock INT IDENTITY(1,1) NOT NULL,
        locked_time DATETIME NOT NULL,
        PRIMARY KEY (id, cart_number, number_lock),
        CONSTRAINT uq_locked_shopping_cart_number UNIQUE (number_lock),
        CONSTRAINT fk_locked_shopping_cart FOREIGN KEY (id, cart_number) 
            REFERENCES shopping_cart (id, number)
            ON DELETE CASCADE
    );
END;
GO

CREATE TRIGGER trg_LockedShoppingCart_Update
ON shopping_cart
FOR UPDATE
AS
BEGIN
    UPDATE locked_shopping_cart
    SET locked_shopping_cart.id = i.id,
        locked_shopping_cart.cart_number = i.number
    FROM locked_shopping_cart
    INNER JOIN inserted i ON locked_shopping_cart.id = i.id AND locked_shopping_cart.cart_number = i.number;
END;
GO
