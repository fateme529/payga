CREATE TABLE power_supply (
    id INT NOT NULL,
    supported_wattage INT NOT NULL,
	height DECIMAL(6, 2) NULL,
    width DECIMAL(6, 2) NOT NULL,
    depth DECIMAL(6, 2) NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT FK_POWER_SUPPLY_PRODUCT FOREIGN KEY (id) 
        REFERENCES product (id) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);
