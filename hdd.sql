USE payga;


CREATE TABLE hdd (
    id INT NOT NULL,
    rotational_speed INT NOT NULL COMMENT'Rotational speed in revolutions per minute (rpm)',
    wattage DECIMAL(8, 2) NOT NULL COMMENT 'Power consumption in watts (W)',
    capacity INT NOT NULL COMMENT 'Capacity in terabytes (TB)',
	height DECIMAL(10, 2) NULL COMMENT 'Height in cm',  
    width DECIMAL(10, 2) NOT NULL COMMENT 'Width in cm', 
    depth DECIMAL(10, 2) NOT NULL COMMENT 'Depth in cm',
    PRIMARY KEY (ID),
    CONSTRAINT FK_HDD_PRODUCT FOREIGN KEY (ID)
        REFERENCES product (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


