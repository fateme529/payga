CREATE TABLE power_supply (
    id INT NOT NULL,
    supported_wattage DECIMAL(8, 2) NOT NULL COMMENT 'Supported wattage in watts (W)',
	height DECIMAL(10, 2) NULL COMMENT 'Height in cm',  
    width DECIMAL(10, 2) NOT NULL COMMENT 'Width in cm', 
    depth DECIMAL(10, 2) NOT NULL COMMENT 'Depth in cm',  
    PRIMARY KEY (id),
    CONSTRAINT FK_POWER_SUPPLY_PRODUCT FOREIGN KEY (id) 
        REFERENCES product (id) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
