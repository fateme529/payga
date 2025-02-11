USE payga;
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'applied_to')
BEGIN
    CREATE TABLE applied_to (
        client_id INT NOT NULL,
        cart_number INT NOT NULL,
        locked_number INT NOT NULL,
        app_code VARCHAR(50) NOT NULL,
        app_time DATETIME NOT NULL,  
        PRIMARY KEY (client_id, cart_number, locked_number, app_code),
        CONSTRAINT fk_applied_to_code FOREIGN KEY (app_code)
            REFERENCES discount_code (dis_code)
            ON DELETE CASCADE,
        CONSTRAINT fk_applied_to_locked_number FOREIGN KEY (client_id, cart_number, locked_number)
            REFERENCES locked_shopping_cart (id, cart_number, number_lock)
            ON DELETE CASCADE
    );
END;
GO
-- ????????? `ON UPDATE CASCADE` ???? ???? `applied_to`
CREATE TRIGGER trg_AppliedTo_Update
ON locked_shopping_cart
FOR UPDATE
AS
BEGIN
    UPDATE applied_to
    SET applied_to.client_id = i.client_id,
        applied_to.cart_number = i.cart_number,
        applied_to.locked_number = i.locked_number
    FROM applied_to
    INNER JOIN inserted i ON applied_to.client_id = i.client_id
                           AND applied_to.cart_number = i.cart_number
                           AND applied_to.locked_number = i.number_lock;
END;
GO


CREATE TRIGGER trg_AppliedTo_Code_Update
ON discount_code
FOR UPDATE
AS
BEGIN
    UPDATE applied_to
    SET applied_to.app_code = i.dis_code
    FROM applied_to
    INNER JOIN inserted i ON applied_to.app_code = i.dis_code;
END;
GO
