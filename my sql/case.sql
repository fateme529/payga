USE payga;

CREATE TABLE p_case (
    id INT NOT NULL,
    number_of_fans INT NOT NULL,  
    fan_size  DECIMAL(5, 2) NOT NULL COMMENT'Fan size in millimeters (mm)',    
    wattage DECIMAL(8, 2) NOT NULL COMMENT 'Power consumption in watts (W)', 
    case_type VARCHAR(100) NOT NULL,
    material VARCHAR(100) NOT NULL,
    color VARCHAR(100) NOT NULL,
    height DECIMAL(10, 2) NULL COMMENT 'Height in cm',  
    width DECIMAL(10, 2) NOT NULL COMMENT 'Width in cm', 
    depth DECIMAL(10, 2) NOT NULL COMMENT 'Depth in cm',  
    PRIMARY KEY (id),
    CONSTRAINT FK_CASE_PRODUCT FOREIGN KEY (id) 
        REFERENCES product (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

