CREATE DATABASE IF NOT EXISTS pisaz;
USE payga;

CREATE TABLE IF NOT EXISTS product (
    id INT AUTO_INCREMENT NOT NULL,
    category VARCHAR(45) NOT NULL,
    image LONGBLOB NOT NULL,
    current_price DECIMAL(15, 2) NOT NULL CHECK (current_price >= 0), 
    stock_count INT NOT NULL CHECK (stock_count >= 0),
    brand VARCHAR(100) NOT NULL,
    model VARCHAR(100) NOT NULL,
    PRIMARY KEY (id) 
) ENGINE=InnoDB; 


