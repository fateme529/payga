IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'SSD')
BEGIN
    CREATE TABLE SSD (
        id INT NOT NULL,
        capacity INT NOT NULL, 
        wattage DECIMAL(8, 2) NOT NULL, 
        PRIMARY KEY (id),
        CONSTRAINT FK_SSD_PRODUCT FOREIGN KEY (id) 
            REFERENCES product (id) 
            ON DELETE CASCADE 
            ON UPDATE CASCADE
    );
END;
GO

CREATE TRIGGER trg_SSD_update
ON product
FOR UPDATE
AS
BEGIN
    UPDATE ssd
    SET ssd.id = i.id
    FROM SSD ssd
    INNER JOIN inserted i ON ssd.id = i.id;
END;
GO
