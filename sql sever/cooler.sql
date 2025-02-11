USE payga;
GO


IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'cooler')
BEGIN
    CREATE TABLE cooler (
        id INT NOT NULL,
        maximum_rotational_speed DECIMAL(8, 2) NOT NULL,
        wattage DECIMAL(8, 2) NOT NULL,  
        fan_size DECIMAL(5, 2) NOT NULL,  
        cooling_method VARCHAR(10) NOT NULL, 
        height DECIMAL(10, 2) NULL, 
        width DECIMAL(10, 2) NOT NULL,  
        depth DECIMAL(10, 2) NOT NULL,  
        PRIMARY KEY (id),
        CONSTRAINT FK_COOLER_PRODUCT FOREIGN KEY (id)
            REFERENCES product (id)
            ON DELETE CASCADE,
        CONSTRAINT chk_cooling_method CHECK (cooling_method IN ('Liquid', 'Air'))
    );
END;
GO

CREATE TRIGGER trg_Cooler_update
ON product
FOR UPDATE
AS
BEGIN
    UPDATE cooler
    SET cooler.id = i.id
    FROM cooler
    INNER JOIN inserted i ON cooler.id = i.id;
END;
GO
