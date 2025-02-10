USE payga;


CREATE TABLE hdd (
    id INT NOT NULL,
    rotational_speed INT NOT NULL,
    wattage DECIMAL(8, 2) NOT NULL,
    capacity INT NOT NULL,
    height DECIMAL(10, 2) NULL,
    width DECIMAL(10, 2) NOT NULL,
    depth DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (ID),
    CONSTRAINT FK_HDD_PRODUCT FOREIGN KEY (ID)
        REFERENCES product (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


