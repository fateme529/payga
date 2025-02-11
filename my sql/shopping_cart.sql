CREATE DATABASE IF NOT EXISTS payga;
USE payga;


CREATE TABLE IF NOT EXISTS shopping_cart (
    id INT NOT NULL,
    number INT NOT NULL,
    status VARCHAR(10) NOT NULL,
    PRIMARY KEY (id, number), 
    UNIQUE KEY unique_number (number),
    CONSTRAINT fk_client_id FOREIGN KEY (id) REFERENCES client (id) ON DELETE CASCADE,
    CHECK (status IN ('blocked', 'locked', 'available')) 
) ENGINE=InnoDB;
