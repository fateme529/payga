CREATE DATABASE IF NOT EXISTS payga;
USE payga;
CREATE TABLE ram_stick (
    id INT NOT NULL,
    frequency INT NOT NULL COMMENT 'Frequency in MHz',
    capacity INT NOT NULL COMMENT 'Capacity in GB',
    generation VARCHAR(100) NOT NULL,
    wattage DECIMAL(8, 2) NOT NULL COMMENT 'Power consumption in watts (W)', 
    height DECIMAL(10, 2) NULL COMMENT 'Height of RAM stick in mm',
    width DECIMAL(10, 2) NOT NULL COMMENT 'Width of RAM stick in mm',
    depth DECIMAL(10, 2) NOT NULL COMMENT 'Depth of RAM stick in mm',
    PRIMARY KEY (id),
    CONSTRAINT FK_RAM_STICK_PRODUCT FOREIGN KEY (id) 
        REFERENCES product (id) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
