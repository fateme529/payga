CREATE TABLE SSD (
    id INT NOT NULL,
    capacity INT NOT NULL COMMENT 'Capacity in GB',
	wattage DECIMAL(8, 2) NOT NULL COMMENT 'Power consumption in watts (W)', 
    PRIMARY KEY (id),
    CONSTRAINT FK_SSD_PRODUCT FOREIGN KEY (id) 
        REFERENCES product (id) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);
