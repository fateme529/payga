CREATE TABLE power_supply (
    id INT NOT NULL,
    supported_wattage INT NOT NULL,
    dimensions NVARCHAR(50) NULL,
    PRIMARY KEY (id),
    CONSTRAINT FK_POWER_SUPPLY_PRODUCT FOREIGN KEY (id) 
        REFERENCES product (id) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);
