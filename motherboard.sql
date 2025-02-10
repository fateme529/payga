
USE payga;

CREATE TABLE motherboard (
    id INT NOT NULL,
    chipset VARCHAR(100) NOT NULL,
    number_of_memory_slots INT NOT NULL,
    memory_speed_range VARCHAR(50) NOT NULL,
    wattage DECIMAL(8, 2) NOT NULL,
    height DECIMAL(8, 2) NULL,
    width DECIMAL(8, 2) NOT NULL,
    depth DECIMAL(8, 2) NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT FK_MOTHERBOARD_PRODUCT FOREIGN KEY (id)
        REFERENCES product (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
