
USE payga;

CREATE TABLE motherboard (
    id INT NOT NULL,
    chipset VARCHAR(100) NOT NULL COMMENT 'Chipset of the motherboard',
    number_of_memory_slots INT NOT NULL COMMENT 'Number of memory slots',
    memory_speed_range VARCHAR(100) NOT NULL COMMENT 'Memory speed range in MHz',
    wattage DECIMAL(8, 2) NOT NULL COMMENT 'Power consumption in watts (W)',
    height DECIMAL(10, 2) NULL COMMENT 'Height in cm',  
    width DECIMAL(10, 2) NOT NULL COMMENT 'Width in cm', 
    depth DECIMAL(10, 2) NOT NULL COMMENT 'Depth in cm', 
    PRIMARY KEY (id),
    CONSTRAINT FK_MOTHERBOARD_PRODUCT FOREIGN KEY (id)
        REFERENCES product (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
