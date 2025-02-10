CREATE DATABASE IF NOT EXISTS payga;
USE payga;


CREATE TABLE IF NOT EXISTS locked_shopping_cart (
    id INT NOT NULL,
    cart_number INT NOT NULL,
    number INT NOT NULL AUTO_INCREMENT, 
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP, 
    PRIMARY KEY (id, cart_number, number),
    UNIQUE KEY uq_locked_shopping_cart_number (number), 
	FOREIGN KEY (id,cart_number) REFERENCES shopping_cart (id,number)ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;
