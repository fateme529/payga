USE payga;
GO


IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'power_supply')
BEGIN
    CREATE TABLE power_supply (
        id INT NOT NULL,
        supported_wattage DECIMAL(8, 2) NOT NULL,
        height DECIMAL(10, 2) NULL,
        width DECIMAL(10, 2) NOT NULL,
        depth DECIMAL(10, 2) NOT NULL,
        PRIMARY KEY (id),
        CONSTRAINT FK_POWER_SUPPLY_PRODUCT FOREIGN KEY (id)
            REFERENCES product (id)
            ON DELETE CASCADE
    );
END;
GO


CREATE TRIGGER trg_PowerSupply_Update
ON product
FOR UPDATE
AS
BEGIN
    UPDATE power_supply
    SET power_supply.id = i.id
    FROM power_supply
    INNER JOIN inserted i ON power_supply.id = i.id;
END;
GO

