CREATE DATABASE IF NOT EXISTS payga;
USE payga;
CREATE TABLE ram_stick (
    id INT NOT NULL,
    frequency INT NOT NULL,
    capacity INT NOT NULL,
    generation VARCHAR(50) NOT NULL,
    wattage DECIMAL(6, 2) NOT NULL,
	height DECIMAL(6, 2) NULL,
    width DECIMAL(6, 2) NOT NULL,
    depth DECIMAL(6, 2) NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT FK_RAM_STICK_PRODUCT FOREIGN KEY (id) 
        REFERENCES product (id) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);
