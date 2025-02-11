USE payga;
CREATE TABLE gpu (
    id INT NOT NULL,
    clock_speed DECIMAL(8, 2) NOT NULL COMMENT 'Clock speed in gigahertz (GHz)', 
    ram_size INT NOT NULL COMMENT 'RAM size in megabytes (MB)',
    number_of_fans INT NOT NULL COMMENT'Number of fans in the GPU',
	wattage DECIMAL(8, 2) NOT NULL COMMENT 'Power consumption in watts (W)',
    height DECIMAL(10, 2) NULL COMMENT 'Height in cm',  
    width DECIMAL(10, 2) NOT NULL COMMENT 'Width in cm', 
    depth DECIMAL(10, 2) NOT NULL COMMENT 'Depth in cm',
    PRIMARY KEY (id),
    CONSTRAINT FK_GPU_PRODUCT FOREIGN KEY (id)
        REFERENCES product (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


