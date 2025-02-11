USE payga;
GO


IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'hdd')
BEGIN
    CREATE TABLE hdd (
        id INT NOT NULL,
        rotational_speed INT NOT NULL, 
        wattage DECIMAL(8, 2) NOT NULL,  
        capacity INT NOT NULL,  
        height DECIMAL(10, 2) NULL, 
        width DECIMAL(10, 2) NOT NULL,  
        depth DECIMAL(10, 2) NOT NULL, 
        PRIMARY KEY (id),
        CONSTRAINT FK_HDD_PRODUCT FOREIGN KEY (id)
            REFERENCES product (id)
            ON DELETE CASCADE
            ON UPDATE CASCADE
    );
END;
GO


CREATE TRIGGER trg_HDD_update
ON product
FOR UPDATE
AS
BEGIN
    UPDATE hdd
    SET hdd.id = i.id
    FROM hdd
    INNER JOIN inserted i ON hdd.id = i.id;
END;
GO
