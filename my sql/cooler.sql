USE payga;


CREATE TABLE cooler (
    id INT NOT NULL,
    maximum_rotational_speed DECIMAL(8, 2) NOT NULL COMMENT 'Maximum rotational speed in rotations per second (rps)',
	wattage DECIMAL(8, 2) NOT NULL COMMENT 'Power consumption in watts (W)', 
	fan_size  DECIMAL(5, 2) NOT NULL COMMENT'Fan size in millimeters (mm)',
    cooling_method ENUM('Liquid', 'Air') NOT NULL COMMENT 'Cooling method: Liquid or Air',
    height DECIMAL(10, 2) NULL COMMENT 'Height in mm',  
    width DECIMAL(10, 2) NOT NULL COMMENT 'Width in mm', 
    depth DECIMAL(10, 2) NOT NULL COMMENT 'Depth in mm',  
    PRIMARY KEY (id),
    CONSTRAINT FK_COOLER_PRODUCT FOREIGN KEY (id) 
        REFERENCES product (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
