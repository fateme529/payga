USE payga;

CREATE TABLE ram_stick (
    id INT NOT NULL,
    frequency INT NOT NULL, -- Frequency in MHz
    capacity INT NOT NULL, -- Capacity in GB
    generation VARCHAR(100) NOT NULL,
    wattage DECIMAL(8, 2) NOT NULL, -- Power consumption in watts (W)
    height DECIMAL(10, 2) NULL, -- Height of RAM stick in mm
    width DECIMAL(10, 2) NOT NULL, -- Width of RAM stick in mm
    depth DECIMAL(10, 2) NOT NULL, -- Depth of RAM stick in mm
    PRIMARY KEY (id)
);


ALTER TABLE ram_stick
ADD CONSTRAINT FK_RAM_STICK_PRODUCT FOREIGN KEY (id)
    REFERENCES product (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE;
