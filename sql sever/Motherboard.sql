USE payga;
GO


IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'motherboard')
BEGIN
    CREATE TABLE motherboard (
        id INT NOT NULL,
        chipset VARCHAR(100) NOT NULL, 
        number_of_memory_slots INT NOT NULL, 
        memory_speed_range VARCHAR(100) NOT NULL, 
        wattage DECIMAL(8, 2) NOT NULL, 
        height DECIMAL(10, 2) NULL,  
        width DECIMAL(10, 2) NOT NULL, 
        depth DECIMAL(10, 2) NOT NULL, 
        PRIMARY KEY (id),
        CONSTRAINT FK_MOTHERBOARD_PRODUCT FOREIGN KEY (id)
            REFERENCES product (id)
            ON DELETE CASCADE
            ON UPDATE CASCADE
    );
END;
GO

CREATE TRIGGER trg_Motherboard_update
ON product
FOR UPDATE
AS
BEGIN
    UPDATE motherboard
    SET motherboard.id = i.id
    FROM motherboard
    INNER JOIN inserted i ON motherboard.id = i.id;
END;
GO
